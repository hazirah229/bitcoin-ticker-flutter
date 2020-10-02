import 'dart:convert';
import 'package:http/http.dart' as http;

const List<String> currenciesList = [
  'AUD',
  'BRL',
  'CAD',
  'CNY',
  'EUR',
  'GBP',
  'HKD',
  'IDR',
  'ILS',
  'INR',
  'JPY',
  'MXN',
  'MYR',
  'NOK',
  'NZD',
  'PLN',
  'RON',
  'RUB',
  'SEK',
  'SGD',
  'USD',
  'ZAR'
];

const List<String> cryptoList = [
  'BTC',
  'ETH',
  'LTC',
];

const coin_API_URL = 'https://rest.coinapi.io/v1/exchangerate';
const coin_apikey = 'E11E4094-B91E-4F42-9C63-9AF3209CE86B';

class CoinData {
  Future getCoinData(String selectedCurrency) async {
    String requestURL =
        '$coin_API_URL/BTC/$selectedCurrency?apikey=$coin_apikey';

    http.Response response = await http.get(requestURL);

    if (response.statusCode == 200) {
      var decodedData = jsonDecode(response.body);
      var lastPrice = decodedData['rate'];
      return lastPrice;
    } else {
      print(response.statusCode);
      throw 'Problem with GET request';
    }
  }
}
