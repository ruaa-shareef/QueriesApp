import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'bills.dart';

class installments extends StatefulWidget {
  late final List<Lastbills> bills1;
  String nameA;
  installments(this.bills1, this.nameA);
  @override
  _installmentsState createState() =>
      _installmentsState(this.bills1, this.nameA);
}

class _installmentsState extends State<installments> {
  late final List<Lastbills> bills2;
  String nameA0;
  _installmentsState(this.bills2, this.nameA0);
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 70.0,
        backgroundColor: Colors.indigo[800],
        title: Text(
          "آخر الفواتير",
          style: TextStyle(color: Colors.white, fontSize: 40),
        ),
        centerTitle: true,
        leading: Center(
          child: GestureDetector(
              onTap: () {
                Navigator.of(context).pop();
              },
              child: Text(
                "الرجوع ",
                style: TextStyle(fontSize: 20),
              )),
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
            padding: EdgeInsets.fromLTRB(30, 50, 0, 0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              children: [
                Container(
                  width: 450,
                  child: Center(
                    child: Text(
                      "المبلغ المدفوع ",
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                ),
                Container(
                  width: 450,
                  child: Center(
                    child: Text(
                      "المبلغ",
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                ),
                Container(
                  width: 450,
                  child: Center(
                    child: Text(
                      "رقم الفاتورة ",
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                ),
                Container(
                  width: 450,
                  child: Center(
                    child: Text(
                      "التاريخ",
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              primary: false,
              shrinkWrap: true,
              itemCount: bills2.length,
              itemBuilder: (BuildContext context, int index) {
                return Lbillitem(bill0: bills2[index]);
              },
            ),
          ),
        ],
      ),
    );
  }
}

class Lbillitem extends StatelessWidget {
  late final Lastbills bill0;
  Lbillitem({required this.bill0});
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: EdgeInsets.all(20.0),
        child: Container(
          width: 200,
          height: 20,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            children: [
              Container(
                width: 450,
                child: Center(
                  child: Text(
                    "${bill0.pamt}",
                    style: TextStyle(fontSize: 20),
                  ),
                ),
              ),
              Container(
                width: 450,
                child: Center(
                  child: Text(
                    "${bill0.amt}",
                    style: TextStyle(fontSize: 20),
                  ),
                ),
              ),
              Container(
                width: 450,
                child: Center(
                  child: Text(
                    "${bill0.no}",
                    style: TextStyle(fontSize: 20),
                  ),
                ),
              ),
              Container(
                width: 450,
                child: Center(
                  child: Text(
                    "${bill0.dt}",
                    style: TextStyle(fontSize: 20),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
