import 'package:basic_bank/SplashScreen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(BankApp());
}

class BankApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: new ThemeData(scaffoldBackgroundColor: Colors.white),
      title: 'Banking App',
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}
