import 'package:basic_bank/Database/DatabaseHelper.dart';
import 'package:basic_bank/HomePage.dart';
import 'package:basic_bank/InsertUser.dart';
import 'package:basic_bank/User.dart';
import 'package:flutter/material.dart';

class ViewCustomers extends StatefulWidget {
  @override
  _ViewCustomersState createState() => _ViewCustomersState();
}

class _ViewCustomersState extends State<ViewCustomers> {
  final dbHelper = DatabaseHelper.instance;

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'View All Customers',
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
        ),
        leading: IconButton(
            icon: Icon(
              Icons.arrow_back,
              color: Colors.black,
              size: 30,
            ),
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => FirstPage(),
              ));
            }),
        centerTitle: true,
        backgroundColor: Colors.redAccent,
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Container(
            color: Colors.white,
            padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
            height: 1000,
            child: FutureBuilder(
                initialData: [],
                future: dbHelper.fetchUserDetails(),
                builder: (context, index) {
                  return ListView.builder(
                    scrollDirection: Axis.vertical,
                    physics: BouncingScrollPhysics(),
                    itemCount: index.data.length,
                    itemBuilder: (context, indx) {
                      return GestureDetector(
                          onTap: () {
                            setState(() => {print('Inside setstate')});
                          },
                          child: Column(
                            children: [
                              ListTile(
                                tileColor: Colors.white,
                                leading: CircleAvatar(
                                  radius: 30.0,
                                  child: Icon(
                                    Icons.person,
                                    color: Colors.black,
                                    size: 30,
                                  ),
                                  backgroundColor: Colors.grey,
                                ),
                                title: Text(index.data[indx].name),
                                horizontalTitleGap: 25,
                                subtitle: Text(
                                  '₹ ${index.data[indx].curBal}',
                                  style: TextStyle(
                                    color: Colors.green,
                                  ),
                                ),
                                onTap: () {
                                  Navigator.of(context).push(
                                    MaterialPageRoute(
                                      builder: (_) => UserInfo(
                                        name: index.data[indx].name,
                                        email: index.data[indx].email,
                                        phoneNo: index.data[indx].phoneNo,
                                        curBal: index.data[indx].curBal,
                                        cusId: index.data[indx].id,
                                      ),
                                    ),
                                  );

                                  print('name: ${index.data[indx].name}');
                                  print('balance: ${index.data[indx].curBal}');
                                  print('length: ${index.data.length}');
                                  print('phoneno: ${index.data[indx].phoneNo}');
                                  print('cus id : ${index.data[indx].id}');
                                },
                              ),
                              Divider(
                                height: 5,
                                thickness: 4,
                                color: Color(0Xfffad5d2),
                              ),
                            ],
                          ));
                    },
                  );
                })),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => InsertUser(),
            ),
          );
        },
        child: Icon(
          Icons.add,
          size: 40,
          color: Colors.white,
        ),
        backgroundColor: Colors.redAccent,
      ),
    );
  }
}
