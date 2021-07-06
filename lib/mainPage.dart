import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:queriesa/installment.dart';
import 'bills.dart';
import 'lastes.dart';
import 'package:http/http.dart' as http;
import 'loding2.dart';
import 'lodingInst.dart';
import 'myinfo.dart';

class MyHomePage extends StatefulWidget {
  String agreementId;
  String nameA;
  String addressa;
  MyHomePage(this.agreementId, this.nameA, this.addressa);
  @override
  _MyHomePageState createState() =>
      _MyHomePageState(this.agreementId, this.nameA, this.addressa);
}

class _MyHomePageState extends State<MyHomePage> {
  String agreementId0;
  String nameA0;
  String addressa0;
  _MyHomePageState(this.agreementId0, this.nameA0, this.addressa0);
  List<Lastbills> bbills = [];

  void fetchbill() async {
    http.Response response = await http.get(Uri.parse(
        'http://api.hepco.ps:8084/integration/fawateryapi.php?id=${this.agreementId0}&pass=123&fun=vouchers&page=1'));
    if (response.statusCode == 200) {
      // success, parse json data
      var jsonArray = jsonDecode(response.body) as List;
      bbills = jsonArray.map((element) => Lastbills.fromJson(element)).toList();
    } else {
      throw Exception("Failed to load data");
    }
  }

  @override
  void initState() {
    super.initState();
    fetchbill();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue[600],
        title: Center(
          child: Text(
            "فواتيري",
            style: TextStyle(color: Colors.white),
          ),
        ),
        actions: [
          Padding(
            padding: EdgeInsets.fromLTRB(0, 0, 15, 0),
            child: Container(
              child: Icon(
                Icons.logout_outlined,
                color: Colors.black,
                size: 30,
              ),
            ),
          )
        ],
      ),
      body: Column(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.fromLTRB(0, 15, 30, 0),
            child: Container(
              alignment: Alignment.topRight,
              child: Text(
                'العميل',
                style: TextStyle(color: Colors.grey),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(0, 3, 30, 0),
            child: Container(
              alignment: Alignment.topRight,
              child: Text(
                "${this.nameA0}",
                style: TextStyle(color: Colors.black, fontSize: 20),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(40, 100, 30, 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.all(30.0),
                  child: Container(
                    color: Colors.blue[100],
                    height: 200,
                    width: 200,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          padding: EdgeInsets.fromLTRB(0, 0, 70, 100),
                          child: IconButton(
                              onPressed: () {
                                Navigator.of(context).push(
                                  MaterialPageRoute<void>(
                                    builder: (BuildContext context) =>
                                        installments(bbills, this.nameA0),
                                  ),
                                );
                              },
                              icon: Icon(
                                Icons.feed_rounded,
                                size: 100,
                              )),
                        ),
                        Text(
                          "آخر الفواتير",
                          style: TextStyle(fontSize: 20),
                        )
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(30.0),
                  child: Container(
                    color: Colors.purple[100],
                    height: 200,
                    width: 200,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          padding: EdgeInsets.fromLTRB(0, 0, 70, 100),
                          child: IconButton(
                              onPressed: () {
                                Navigator.of(context).push(
                                  MaterialPageRoute<void>(
                                    builder: (BuildContext context) =>
                                        Loadingpay(
                                            this.agreementId0, this.nameA0),
                                  ),
                                );
                              },
                              icon: Icon(
                                Icons.price_check_sharp,
                                size: 100,
                              )),
                        ),
                        Text(
                          "آخر الدفعات",
                          style: TextStyle(fontSize: 20),
                        )
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(30.0),
                  child: Container(
                    color: Colors.green[200],
                    height: 200,
                    width: 200,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          padding: EdgeInsets.fromLTRB(0, 0, 70, 100),
                          child: IconButton(
                              onPressed: () {
                                Navigator.of(context).push(
                                  MaterialPageRoute<void>(
                                    builder: (BuildContext context) =>
                                        LoadingInst(
                                            this.agreementId0, this.nameA0),
                                  ),
                                );
                              },
                              icon: Icon(
                                Icons.monetization_on_sharp,
                                size: 100,
                              )),
                        ),
                        Text(
                          "الأقساط ",
                          style: TextStyle(fontSize: 20),
                        )
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(30.0),
                  child: Container(
                    color: Colors.pink[100],
                    height: 200,
                    width: 200,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          padding: EdgeInsets.fromLTRB(0, 0, 70, 100),
                          child: IconButton(
                              onPressed: () {
                                Navigator.of(context).push(
                                  MaterialPageRoute<void>(
                                    builder: (BuildContext context) => myInfo(
                                        this.agreementId0,
                                        this.nameA0,
                                        this.addressa0),
                                  ),
                                );
                              },
                              icon: Icon(
                                Icons.account_box,
                                size: 100,
                              )),
                        ),
                        Text(
                          "بياناتي",
                          style: TextStyle(fontSize: 20),
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
