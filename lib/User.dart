import 'package:basic_bank/CustomerList.dart';
import 'package:flutter/material.dart';

class UserInfo extends StatefulWidget {
  final String name, email;
  final double curBal;
  final int phoneNo, cusId;

  UserInfo({
    Key key,
    @required this.name,
    @required this.email,
    @required this.phoneNo,
    @required this.curBal,
    @required this.cusId,
  });
  @override
  _UserInfoState createState() => _UserInfoState();
}

class _UserInfoState extends State<UserInfo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          iconTheme: IconThemeData(
            color: Colors.black,
          ),
          backgroundColor: Colors.redAccent,
          title: Text(
            'Welcome',
            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
          ),
          centerTitle: true,
        ),
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                  height: 250,
                  width: 500,
                  decoration: BoxDecoration(
                      color: Colors.redAccent,
                      borderRadius: BorderRadius.only(
                          bottomRight: Radius.circular(30),
                          bottomLeft: Radius.circular(30))),
                  child: Column(
                    children: [
                      SizedBox(height: 20),
                      CircleAvatar(
                        radius: 100.0,
                        child: Icon(
                          Icons.person,
                          size: 80,
                          color: Colors.black,
                        ),
                        backgroundColor: Colors.white,
                      ),
                    ],
                  )),
              Center(
                child: Column(
                  children: [
                    SizedBox(height: 20),
                    Text(
                      widget.name,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 30,
                      ),
                    ),
                    SizedBox(height: 20),
                    Text(
                      'Email ID : ${widget.email}',
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                    SizedBox(height: 20),
                    Text(
                      'Phone No. : ${widget.phoneNo}',
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                    SizedBox(height: 20),
                    Text(
                      'Current Balance :₹ ${widget.curBal}',
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 60),
              RaisedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => CustomerList(
                          sname: widget.name,
                          sbalance: widget.curBal,
                          cusId: widget.cusId,
                        ),
                      ),
                    );
                  },
                  padding: EdgeInsets.fromLTRB(80, 15, 80, 15),
                  color: Colors.redAccent,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30)),
                  child: Text(
                    'Transfer Money',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  )),
            ],
          ),
        ));
  }
}
