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

const coinApiURL = 'https://rest.coinapi.io/v1/exchangerate';
const apiKey = '30819C3D-5785-4416-A9C4-B534881BB33A';

class CoinData {
  Future getCoinData(String currency) async {

    String requestUrl = '$coinApiURL/BTC/$currency?apikey=$apiKey';
    print(requestUrl);
    http.Response response = await http.get(requestUrl);

    if (response.statusCode == 200) {
      var decodedData = jsonDecode(response.body);

      var lastPrice = decodedData['rate'];

      return lastPrice;
    }else{
      print(response.statusCode);
      throw 'Problem with the get request';

    }
  }
}
