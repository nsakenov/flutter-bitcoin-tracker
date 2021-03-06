import 'package:flutter/material.dart';
import 'screens/loading_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
          primaryColor: Color(0xFF212121),
          scaffoldBackgroundColor: Colors.white),
      home: LoadingScreen(),
    );
  }
}
