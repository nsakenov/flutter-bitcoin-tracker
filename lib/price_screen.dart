import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'coin_data.dart';

class PriceScreen extends StatefulWidget {
  @override
  _PriceScreenState createState() => _PriceScreenState();
}

class _PriceScreenState extends State<PriceScreen> {
  List widgets = currenciesList.map((String value) {
    return Text(
      value,
      style: TextStyle(color: Colors.white),
    );
  }).toList();

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
          Padding(
            padding: EdgeInsets.fromLTRB(18.0, 18.0, 18.0, 0),
            child: Card(
              color: Colors.lightBlueAccent,
              elevation: 5.0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 28.0),
                child: Text(
                  '1 BTC = ? USD',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 20.0,
                    color: Colors.white,
                  ),
                ),
              ),
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
              child: CupertinoPicker(
                onSelectedItemChanged: (int value) {
                  print(value);
                },
                itemExtent: 30,
                children: widgets,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// DropdownButton<String>(
// dropdownColor: Colors.blue,
// value: selectedCurrency,
// icon: Icon(Icons.arrow_downward),
// iconSize: 24,
// elevation: 16,
// style: TextStyle(color: Colors.white, fontSize: 20),
// underline: Container(
// height: 2,
// color: Colors.deepPurpleAccent,
// ),
// onChanged: (String newValue) {
// setState(() {
// selectedCurrency = newValue;
// print(selectedCurrency);
// });
// },
// items: currenciesList.map((String value) {
// return DropdownMenuItem(
// value: value,
// child: Text(value),
// );
// }).toList(),
// ),
