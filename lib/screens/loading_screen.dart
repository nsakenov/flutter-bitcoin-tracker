import 'package:flutter/material.dart';
import 'package:bitcoin_ticker/services/crypto_prices.dart';
import 'price_screen.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'dart:io';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {
    super.initState();
    updateInitialPrices();
  }

  Future updateInitialPrices() async {
    CryptoPrices price = CryptoPrices();
    var json = await price.getPrices('BTC,ETH,LTC', 'USD');
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return PriceScreen(json: json);
    }));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SpinKitDoubleBounce(color: Colors.black, size: 100),
      ),
    );
  }
}
