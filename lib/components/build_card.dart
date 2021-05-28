import 'package:flutter/material.dart';

Card buildCard(String crypto, int btcValue, String selectedCurrency) {
  return Card(
    color: Color(0xFF3F51B5),
    elevation: 5.0,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10.0),
    ),
    child: Padding(
      padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 70.0),
      child: Text(
        '1 $crypto = $btcValue $selectedCurrency',
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 20.0,
          color: Colors.white,
        ),
      ),
    ),
  );
}
