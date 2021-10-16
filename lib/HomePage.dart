import 'package:basic_bank/ViewCustomers.dart';

import 'package:flutter/material.dart';
import 'InsertUser.dart';
import 'TransactionHistory.dart';

class FirstPage extends StatefulWidget {
  @override
  _FirstPageState createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Home Page',
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
        ),
        leading: Icon(
          Icons.home,
          color: Colors.black,
          size: 30,
        ),
        centerTitle: true,
        backgroundColor: Colors.redAccent,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            // ignore: prefer_const_literals_to_create_immutables
            children: [
              CircleAvatar(
                backgroundColor: Colors.redAccent,
                radius: 80.0,
                child: Icon(
                  Icons.account_balance_outlined,
                  size: 140.0,
                  color: Colors.black,
                ),
              ),
              SizedBox(
                height: 40,
              ),
              Text(
                "Welcome Admin",
                style: TextStyle(fontWeight: FontWeight.w500, fontSize: 40),
              ),
              SizedBox(
                height: 20,
              ),
              InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ViewCustomers(),
                      ));
                },
                child: Container(
                  width: 200,
                  height: 75,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.redAccent,
                  ),
                  child: Center(
                      child: Text(
                    "Show All Customers",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  )),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => InsertUser(),
                      ));
                },
                child: Container(
                  width: 175,
                  height: 75,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.redAccent,
                  ),
                  child: Center(
                      child: Text(
                    "New Customer",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  )),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => TransactionHistory(),
                      ));
                },
                child: Container(
                  width: 200,
                  height: 75,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.redAccent,
                  ),
                  child: Center(
                      child: Text(
                    "Show All Transactions",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  )),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
