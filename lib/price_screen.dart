import 'package:bitcoin_ticker/crypto_rate.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'coin_data.dart';
import 'dart:io';

class PriceScreen extends StatefulWidget {
  @override
  _PriceScreenState createState() => _PriceScreenState();
}

class _PriceScreenState extends State<PriceScreen> {
  Future<CryptoRate> futureRate;
  Future<CryptoRate> futureSecondRate;
  Future<CryptoRate> futureThirdRate;

  DropdownButton<String> androidPicker() {
    List<DropdownMenuItem<String>> dropdownItem = [];
    for (String currency in currenciesList) {
      var newItems = DropdownMenuItem(
        child: Text(currency),
        value: currency,
      );
      dropdownItem.add(newItems);
    }

    return DropdownButton<String>(
      value: selectedCurency,
      items: dropdownItem,
      onChanged: (value) {
        setState(() {
          selectedCurency = value;
          futureRate = CoinData(
                  cryptoName: cryptoList[0],
                  cryptoConvertName: selectedCurency ?? 'AUD')
              .coinsDatas();
          futureSecondRate = CoinData(
                  cryptoName: cryptoList[1],
                  cryptoConvertName: selectedCurency ?? 'AUD')
              .coinsDatas();
          futureThirdRate = CoinData(
                  cryptoName: cryptoList[2],
                  cryptoConvertName: selectedCurency ?? 'AUD')
              .coinsDatas();
        });
      },
    );
  }

  CupertinoPicker iosPicker() {
    List<Text> pickerItems = [];

    for (String currency in currenciesList) {
      pickerItems.add(Text(
        currency,
        style: TextStyle(color: Colors.white),
      ));
    }

    return CupertinoPicker(
      itemExtent: 32.0,
      onSelectedItemChanged: (selectedIndex) {
        setState(() {
          selectedCurency = currenciesList[selectedIndex];
          futureRate = CoinData(
                  cryptoName: cryptoList[0],
                  cryptoConvertName: selectedCurency ?? 'AUD')
              .coinsDatas();
          futureSecondRate = CoinData(
                  cryptoName: cryptoList[1],
                  cryptoConvertName: selectedCurency ?? 'AUD')
              .coinsDatas();
          futureThirdRate = CoinData(
                  cryptoName: cryptoList[2],
                  cryptoConvertName: selectedCurency ?? 'AUD')
              .coinsDatas();
        });
      },
      children: pickerItems,
    );
  }

  String selectedCurency;

  @override
  void initState() {
    super.initState();
    futureRate = CoinData(
            cryptoName: cryptoList[0],
            cryptoConvertName: selectedCurency ?? 'AUD')
        .coinsDatas();
    futureSecondRate = CoinData(
            cryptoName: cryptoList[1],
            cryptoConvertName: selectedCurency ?? 'AUD')
        .coinsDatas();
    futureThirdRate = CoinData(
            cryptoName: cryptoList[2],
            cryptoConvertName: selectedCurency ?? 'AUD')
        .coinsDatas();
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
            children: [
              Padding(
                padding: EdgeInsets.fromLTRB(18.0, 18.0, 18.0, 0),
                child: Card(
                  color: Colors.lightBlueAccent,
                  elevation: 5.0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Padding(
                      padding: EdgeInsets.symmetric(
                          vertical: 15.0, horizontal: 28.0),
                      child: FutureBuilder<CryptoRate>(
                        future: futureRate,
                        builder: (context, snapshot) {
                          if (snapshot.hasData) {
                            return Text(
                              '1 ${cryptoList[0]} = ${snapshot.data.rate.round().toString() ?? ''} ${selectedCurency ?? 'AUD'}',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 20.0,
                                color: Colors.white,
                              ),
                            );
                          } else if (snapshot.hasError) {
                            return Text('${snapshot.error}');
                          }
                          // By default, show a loading spinner.
                          return const CircularProgressIndicator();
                        },
                      )),
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(18.0, 18.0, 18.0, 0),
                child: Card(
                  color: Colors.lightBlueAccent,
                  elevation: 5.0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Padding(
                      padding: EdgeInsets.symmetric(
                          vertical: 15.0, horizontal: 28.0),
                      child: FutureBuilder<CryptoRate>(
                        future: futureSecondRate,
                        builder: (context, snapshot) {
                          if (snapshot.hasData) {
                            return Text(
                              '1 ${cryptoList[1]} = ${snapshot.data.rate.round().toString() ?? ''} ${selectedCurency ?? 'AUD'}',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 20.0,
                                color: Colors.white,
                              ),
                            );
                          } else if (snapshot.hasError) {
                            return Text('${snapshot.error}');
                          }
                          // By default, show a loading spinner.
                          return const CircularProgressIndicator();
                        },
                      )),
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(18.0, 18.0, 18.0, 0),
                child: Card(
                  color: Colors.lightBlueAccent,
                  elevation: 5.0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Padding(
                      padding: EdgeInsets.symmetric(
                          vertical: 15.0, horizontal: 28.0),
                      child: FutureBuilder<CryptoRate>(
                        future: futureThirdRate,
                        builder: (context, snapshot) {
                          if (snapshot.hasData) {
                            return Text(
                              '1 ${cryptoList[2]} = ${snapshot.data.rate.round().toString() ?? ''} ${selectedCurency ?? 'AUD'}',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 20.0,
                                color: Colors.white,
                              ),
                            );
                          } else if (snapshot.hasError) {
                            return Text('${snapshot.error}');
                          }
                          // By default, show a loading spinner.
                          return const CircularProgressIndicator();
                        },
                      )),
                ),
              ),
            ],
          ),
          Container(
            height: 150.0,
            alignment: Alignment.center,
            padding: EdgeInsets.only(bottom: 30.0),
            color: Colors.lightBlue,
            child: Platform.isIOS ? iosPicker() : androidPicker(),
          ),
        ],
      ),
    );
  }
}
