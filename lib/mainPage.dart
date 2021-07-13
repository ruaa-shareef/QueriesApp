import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:queriesa/installment.dart';
import 'bills.dart';
import 'lastes.dart';
import 'package:http/http.dart' as http;
import 'loding2.dart';
import 'lodingInst.dart';
import 'main.dart';
import 'myinfo.dart';

// ignore: must_be_immutable
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
        toolbarHeight: 70.0,
        backgroundColor: Colors.indigo[800],
        title: Center(
          child: Text(
            "فواتيري",
            style: TextStyle(color: Colors.white, fontSize: 40),
          ),
        ),
        leading: GestureDetector(
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute<void>(
                builder: (BuildContext context) => Servicespage(),
              ),
            );
          },
          child: Center(
            child: Text(
              "خروج",
              style: TextStyle(fontSize: 20, color: Colors.white),
            ),
          ),
        ),
      ),
      body: Column(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.fromLTRB(0, 25, 30, 0),
            child: Container(
              alignment: Alignment.topRight,
              child: Text(
                'المشترك',
                style: TextStyle(color: Colors.grey, fontSize: 30),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(0, 3, 30, 0),
            child: Container(
              alignment: Alignment.topRight,
              child: Text(
                "${this.nameA0}",
                style: TextStyle(color: Colors.black, fontSize: 40),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(50, 130, 50, 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute<void>(
                        builder: (BuildContext context) =>
                            installments(bbills, this.nameA0),
                      ),
                    );
                  },
                  child: Padding(
                    padding: EdgeInsets.all(30.0),
                    child: Container(
                      color: Colors.blue[100],
                      height: 250,
                      width: 250,
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              padding: EdgeInsets.fromLTRB(0, 0, 85, 100),
                              child: IconButton(
                                  onPressed: () {
                                    Navigator.of(context).push(
                                      MaterialPageRoute<void>(
                                        builder: (BuildContext context) =>
                                            installments(bbills, this.nameA0),
                                      ),
                                    );
                                  },
                                  icon: Padding(
                                    padding:
                                        const EdgeInsets.fromLTRB(0, 0, 50, 0),
                                    child: Container(
                                      child: Icon(
                                        Icons.feed_rounded,
                                        size: 120,
                                      ),
                                    ),
                                  )),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(15.0),
                              child: Text(
                                "آخر الفواتير",
                                style: TextStyle(
                                    fontSize: 25, fontWeight: FontWeight.bold),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute<void>(
                        builder: (BuildContext context) =>
                            Loadingpay(this.agreementId0, this.nameA0),
                      ),
                    );
                  },
                  child: Padding(
                    padding: EdgeInsets.all(30.0),
                    child: Container(
                      color: Colors.purple[100],
                      height: 250,
                      width: 250,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            padding: EdgeInsets.fromLTRB(0, 0, 70, 130),
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
                                  size: 120,
                                )),
                          ),
                          Text(
                            "آخر الدفعات",
                            style: TextStyle(
                                fontSize: 25, fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute<void>(
                        builder: (BuildContext context) =>
                            LoadingInst(this.agreementId0, this.nameA0),
                      ),
                    );
                  },
                  child: Padding(
                    padding: EdgeInsets.all(30.0),
                    child: Container(
                      color: Colors.green[200],
                      height: 250,
                      width: 250,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            padding: EdgeInsets.fromLTRB(0, 0, 95, 130),
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
                                  size: 120,
                                )),
                          ),
                          Text(
                            "الأقساط ",
                            style: TextStyle(
                                fontSize: 25, fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute<void>(
                        builder: (BuildContext context) => myInfo(
                            this.agreementId0, this.nameA0, this.addressa0),
                      ),
                    );
                  },
                  child: Padding(
                    padding: EdgeInsets.all(30.0),
                    child: Container(
                      color: Colors.pink[100],
                      height: 250,
                      width: 250,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            padding: EdgeInsets.fromLTRB(0, 0, 85, 130),
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
                                icon: Center(
                                  child: Icon(
                                    Icons.account_box,
                                    size: 120,
                                  ),
                                )),
                          ),
                          Text(
                            "بياناتي",
                            style: TextStyle(
                                fontSize: 25, fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
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
