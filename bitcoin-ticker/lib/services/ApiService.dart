import 'dart:convert';

import 'package:http/http.dart' as http;

const apiKey = 'D4C9A39D-8F41-41A0-A9C1-97D8C417D095';

class ApiService {
  final String url;
  ApiService({this.url});

  Future<dynamic> getExchangeRate() async {
    http.Response response =
        await http.get(url, headers: {'X-CoinAPI-Key': '$apiKey'});
    if (response.statusCode == 200) {
      String responseData = response.body;
      return jsonDecode(responseData);
    } else {
      print("Response rr: ${response.statusCode}");
    }
  }
}
