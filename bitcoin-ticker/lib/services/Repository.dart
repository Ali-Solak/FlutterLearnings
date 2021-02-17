import 'package:bitcoin_ticker/services/ApiService.dart';

const apiKey = 'D4C9A39D-8F41-41A0-A9C1-97D8C417D095';
const baseUrlExchangeRate = 'https://rest.coinapi.io/v1/exchangerate';

class Repository {
  Future<dynamic> getExchangeRate(String fiat, String crypto) async {
    ApiService apiService =
        ApiService(url: '$baseUrlExchangeRate/$crypto/$fiat');

    return await apiService.getExchangeRate();
  }
}
