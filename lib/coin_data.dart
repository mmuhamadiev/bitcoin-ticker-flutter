import 'package:bitcoin_ticker/crypto_rate.dart';
import 'package:flutter/cupertino.dart';
import 'dart:convert';
import 'networking_helper.dart';

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

const apiKey = '3E8F2D82-543D-4963-A167-A12B2FC8EAED';
//3E8F2D82-543D-4963-A167-A12B2FC8EAED
//FCA9478E-5F74-4EDF-8ECB-59CC46441EC0

const url = 'https://rest.coinapi.io/v1/exchangerate';


class CoinData {

  String cryptoName;
  String cryptoConvertName;

  CoinData({@required this.cryptoName, @required this.cryptoConvertName});

  Future<CryptoRate> coinsDatas() async{
    NetworkHelper networkHelper = NetworkHelper(url: '$url/$cryptoName/$cryptoConvertName/?apikey=$apiKey');

    var response = await networkHelper.getCoinData();
    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.
      return CryptoRate.fromJson(jsonDecode(response.body));
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('?');
    }

  }
}
