import 'package:basic_bank/Database/DatabaseHelper.dart';
import 'package:basic_bank/HomePage.dart';
import 'package:basic_bank/Models/TransactionModel.dart';
import 'package:basic_bank/TransactionHistory.dart';
import 'package:basic_bank/transaction_succ.dart';

import 'package:flutter/material.dart';

class MoneyTransfer extends StatefulWidget {
  final double sbalance, tamount, rbalance;
  final int cusId, tid;
  final String sname, rname;
  String status;

  MoneyTransfer({
    this.sbalance,
    this.rbalance,
    this.tamount,
    this.cusId,
    this.sname,
    this.rname,
    this.status,
    this.tid,
  });
  @override
  _MoneyTransferState createState() => _MoneyTransferState();
}

class _MoneyTransferState extends State<MoneyTransfer> {
  double amount;
  final dbHelper = DatabaseHelper.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(
            'Make Transaction',
            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
          ),
          leading: IconButton(
              icon: Icon(
                Icons.arrow_back,
                color: Colors.black,
                size: 30,
              ),
              onPressed: () {
                Navigator.pop(context);
              }),
          centerTitle: true,
          backgroundColor: Colors.redAccent),
      body: Builder(builder: (BuildContext context) {
        return SingleChildScrollView(
            child: Container(
          padding: EdgeInsets.fromLTRB(50, 60, 50, 0),
          alignment: Alignment.center,
          color: Colors.white,
          child: Column(
            children: [
              Image.asset(
                'assets/transfer.png',
              ),
              SizedBox(height: 30),
              TextField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(25),
                  ),
                  fillColor: Colors.white,
                  hintText: "Amount",
                  hintStyle: TextStyle(color: Colors.black26),
                  labelText: 'Enter the Amount',
                  labelStyle: TextStyle(color: Colors.black),
                  prefixIcon: Icon(
                    Icons.attach_money_sharp,
                    color: Colors.black,
                  ),
                ),
                onChanged: (value) {
                  amount = double.parse(value);
                },
              ),
              SizedBox(height: 30),
              RaisedButton(
                  onPressed: () async {
                    if (widget.sbalance >= amount && amount >= 0) {
                      widget.status = 'Sucessful';
                      double senderRemainingBal = widget.sbalance - amount;

                      await dbHelper.updateCurBalance(
                          widget.cusId, senderRemainingBal);

                      double receiverRemainingBal = widget.rbalance + amount;

                      await dbHelper.updateCurBalance(
                          widget.tid, receiverRemainingBal);

                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => TransactionS(),
                        ),
                      );
                    } else {
                      widget.status = 'Failed';

                      Scaffold.of(context).showSnackBar(SnackBar(
                        content: Text(
                          'Transaction Failed....Insufficient Balance!!',
                          style: TextStyle(
                            fontSize: 20,
                            color: Color(0Xfffad5d2),
                          ),
                          textAlign: TextAlign.center,
                        ),
                        duration: Duration(seconds: 5),
                        backgroundColor: Colors.black,
                      ));
                    }

                    TransactionTable _transactions = TransactionTable(
                      sname: widget.sname,
                      rname: widget.rname,
                      tid: widget.tid,
                      id: widget.cusId,
                      tamount: amount,
                      status: widget.status,
                    );

                    await dbHelper.insertTransaction(_transactions);
                  },
                  padding: EdgeInsets.fromLTRB(80, 15, 80, 15),
                  color: Colors.redAccent,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30)),
                  child: Text(
                    'Proceed',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ))
            ],
          ),
        ));
      }),
    );
  }
}
