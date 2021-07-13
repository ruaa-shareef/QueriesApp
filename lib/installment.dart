import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:queriesa/instinfo.dart';

class orgInstallment extends StatefulWidget {
  List<Instinfo> info;
  String nameA;
  orgInstallment(this.info, this.nameA);
  @override
  _orgInstallmentState createState() =>
      _orgInstallmentState(this.info, this.nameA);
}

class _orgInstallmentState extends State<orgInstallment> {
  String nameA0;
  List<Instinfo> info1;

  _orgInstallmentState(this.info1, this.nameA0);
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 70.0,
        backgroundColor: Colors.indigo[800],
        title: Text(
          "الأقساط",
          style: TextStyle(color: Colors.white, fontSize: 40.0),
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
            padding: EdgeInsets.fromLTRB(30, 40, 0, 0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              children: [
                Container(
                  width: 500,
                  child: Center(
                    child: Text(
                      " عدد مرات الدفع ",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                Container(
                  width: 250,
                  child: Center(
                    child: Text(
                      "المبلغ",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                Container(
                  width: 250,
                  child: Center(
                    child: Text(
                      " عدد الدفعات الكلية ",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                Container(
                  width: 250,
                  child: Center(
                    child: Text(
                      "تاريخ التفعيل",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                Container(
                  width: 250,
                  child: Center(
                    child: Text(
                      "نوع الإضافة",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
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
              itemCount: this.info1.length,
              itemBuilder: (BuildContext context, int index) {
                return Lbillitem(Ins0: this.info1[index]);
              },
            ),
          ),
        ],
      ),
    );
  }
}

class Lbillitem extends StatelessWidget {
  late final Instinfo Ins0;
  Lbillitem({required this.Ins0});
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: EdgeInsets.all(30.0),
        child: Container(
          width: 200,
          height: 25,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            children: [
              Container(
                width: 500,
                child: Center(
                  child: Text(
                    "${Ins0.calTimes}",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              Container(
                width: 250,
                child: Center(
                  child: Text(
                    "${Ins0.feeValue}",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              Container(
                width: 250,
                child: Center(
                  child: Text(
                    "${Ins0.feeTimes}",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              Container(
                width: 250,
                child: Center(
                  child: Text(
                    "${Ins0.startDate.date}",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              Container(
                width: 250,
                child: Center(
                  child: Text(
                    "${Ins0.feeName}",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
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
