import 'dart:io';
import 'package:bitcoin_ticker/services/Repository.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'coin_data.dart';

class PriceScreen extends StatefulWidget {
  @override
  _PriceScreenState createState() => _PriceScreenState();
}

class _PriceScreenState extends State<PriceScreen> {
  String selectedCurrency = 'EUR';
  String iotaValue;
  String bitCoinValue;
  String xlmValue;
  bool isWaiting;

  Future<void> updateData() async {
    isWaiting = true;
    Repository repository = Repository();
    dynamic btcData = await repository.getExchangeRate(selectedCurrency, 'BTC');
    dynamic iotaData =
        await repository.getExchangeRate(selectedCurrency, 'IOTA');
    dynamic xlmData = await repository.getExchangeRate(selectedCurrency, 'XLM');

    setState(() {
      bitCoinValue = btcData['rate'].toStringAsFixed(2);
      iotaValue = iotaData['rate'].toStringAsFixed(2);
      xlmValue = xlmData['rate'].toStringAsFixed(2);
      isWaiting = false;
    });
  }

  @override
  void initState() {
    super.initState();
    updateData();
  }

  DropdownButton getDroptdownButton() {
    return DropdownButton<String>(
      value: selectedCurrency,
      items: currenciesList
          .map((e) => DropdownMenuItem(child: Text(e), value: e))
          .toList(),
      onChanged: (value) {
        setState(
          () {
            selectedCurrency = value;
          },
        );
      },
    );
  }

  CupertinoPicker IOSPicker() {
    return CupertinoPicker(
      backgroundColor: Colors.lightBlue,
      itemExtent: 32.0,
      onSelectedItemChanged: (selectedIndex) {
        selectedCurrency = currenciesList[selectedIndex];
      },
      children: currenciesList.map((e) => Text(e)).toList(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('🤑 Coin Ticker'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                exchangeInfo(
                    'BTC', isWaiting ? '?' : bitCoinValue, selectedCurrency),
                exchangeInfo(
                    'IOTA', isWaiting ? '?' : iotaValue, selectedCurrency),
                exchangeInfo(
                    'Stellar', isWaiting ? '?' : xlmValue, selectedCurrency),
              ]),
          Container(
            height: 150.0,
            alignment: Alignment.center,
            padding: EdgeInsets.only(bottom: 30.0),
            color: Colors.lightBlue,
            child: Platform.isIOS ? IOSPicker() : getDroptdownButton(),
          ),
        ],
      ),
    );
  }
}

Padding exchangeInfo(
    String cryptoCurrency, String value, String selectedCurrency) {
  return Padding(
    padding: EdgeInsets.fromLTRB(5.0, 5.0, 5.0, 0),
    child: Card(
      color: Colors.lightBlueAccent,
      elevation: 5.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 28.0),
        child: Text(
          '1 $cryptoCurrency = $value $selectedCurrency',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 20.0,
            color: Colors.white,
          ),
        ),
      ),
    ),
  );
}
