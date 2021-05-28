import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'coin_data.dart';
import 'dart:io' show Platform; //import only platform class
import 'package:bitcoin_ticker/services/crypto_prices.dart';
import 'components/build_card.dart';

class PriceScreen extends StatefulWidget {
  @override
  _PriceScreenState createState() => _PriceScreenState();
}

class _PriceScreenState extends State<PriceScreen> {
  var selectedCurrency = 'USD';
  int btcPrice;
  int ethPrice;
  int ltcPrice;

  void updateUI(dynamic btcJson, dynamic ethJson, dynamic ltcJson) {
    setState(() {
      btcPrice = btcJson['rate'].toInt();
      ethPrice = ethJson['rate'].toInt();
      ltcPrice = ltcJson['rate'].toInt();
      print('$btcPrice, $ethPrice, $ltcPrice');
    });
  }

  void updatePrices(String currency) async {
    CryptoPrices price = CryptoPrices();
    var btcJson = await price.getPrices('BTC', selectedCurrency);
    var ethJson = await price.getPrices('ETH', selectedCurrency);
    var ltcJson = await price.getPrices('LTC', selectedCurrency);
    updateUI(btcJson, ethJson, ltcJson);
  }

  @override
  void initState() {
    super.initState();
    updatePrices(selectedCurrency);
  }

//widgets//
//ios picker
  CupertinoPicker iOSPicker() {
    return CupertinoPicker(
      onSelectedItemChanged: (int value) {
        selectedCurrency = currenciesList[value];
        updatePrices(selectedCurrency);
      },
      itemExtent: 30,
      children: currenciesList.map((String value) {
        return Text(
          value,
          style: TextStyle(color: Colors.white),
        );
      }).toList(),
    );
  }

//android picker
  DropdownButton<String> androidDropDown(selectedCurrency) {
    return DropdownButton<String>(
      dropdownColor: Colors.blue,
      value: selectedCurrency,
      icon: Icon(Icons.arrow_downward),
      iconSize: 24,
      elevation: 16,
      style: TextStyle(color: Colors.white, fontSize: 20),
      underline: Container(
        height: 2,
        color: Colors.deepPurpleAccent,
      ),
      onChanged: (String newValue) {
        setState(() {
          selectedCurrency = newValue;
          print(selectedCurrency);
        });
      },
      items: currenciesList.map((String value) {
        //loop currencies, create text widgets
        return DropdownMenuItem(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          '🤑 Coin Ticker',
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.fromLTRB(18.0, 18.0, 18.0, 0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                buildCard('BTC', btcPrice, selectedCurrency),
                SizedBox(height: 10),
                buildCard('ETH', ethPrice, selectedCurrency),
                SizedBox(height: 10),
                buildCard('LTC', ltcPrice, selectedCurrency),
              ],
            ),
          ),
          Container(
            height: 150.0,
            alignment: Alignment.center,
            padding: EdgeInsets.only(bottom: 30.0),
            color: Color(0xFF212121),
            child: Container(
              width: 100,
              alignment: Alignment.center,
              child: Platform.isIOS
                  ? iOSPicker()
                  : androidDropDown(selectedCurrency),
            ),
          ),
        ],
      ),
    );
  }
}
