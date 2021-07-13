import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:queriesa/payinfo.dart';

class lastPays extends StatefulWidget {
  String nameA;
  List<Payinfo> payinfo1;
  lastPays(this.nameA, this.payinfo1);
  @override
  _lastPayState createState() => _lastPayState(this.nameA, this.payinfo1);
}

class _lastPayState extends State<lastPays> {
  String nameA0;
  List<Payinfo> payinfo2;

  _lastPayState(this.nameA0, this.payinfo2);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.indigo[800],
        title: Text(
          "آخر الدفعات",
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: Icon(
            Icons.arrow_back_ios_new,
            color: Colors.white,
          ),
        ),
      ),
      body: Column(
        children: [
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
          Container(
            padding: EdgeInsets.fromLTRB(400, 40, 10, 0),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Container(
                  width: 300,
                  child: Center(
                    child: Text("الدفعات "),
                  ),
                ),
                Container(
                  width: 300,
                  child: Center(
                    child: Text("التاريخ"),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              primary: false,
              shrinkWrap: true,
              itemCount: payinfo2.length,
              itemBuilder: (BuildContext context, int index) {
                return Lbillitem(info: payinfo2[index]);
              },
            ),
          ),
        ],
      ),
    );
  }
}

class Lbillitem extends StatelessWidget {
  late final Payinfo info;
  Lbillitem({required this.info});
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.all(Radius.circular(10.0)),
        child: Padding(
          padding: EdgeInsets.fromLTRB(400, 20, 0, 0),
          child: Container(
            width: 100,
            height: 30,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              children: [
                Container(
                  width: 300,
                  child: Center(
                    child: Text("${info.dt}"),
                  ),
                ),
                Container(
                  width: 300,
                  child: Center(
                    child: Text("${info.amt}"),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
