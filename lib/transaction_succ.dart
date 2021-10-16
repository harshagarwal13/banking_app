import 'package:basic_bank/HomePage.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class TransactionS extends StatefulWidget {
  @override
  _TransactionSState createState() => _TransactionSState();
}

class _TransactionSState extends State<TransactionS> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(
      Duration(milliseconds: 1500),
      () => Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => FirstPage(),
          )),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Container(
          color: Colors.redAccent,
          child: Lottie.asset("assets/lottie/trans1.json"),
        ));
  }
}
