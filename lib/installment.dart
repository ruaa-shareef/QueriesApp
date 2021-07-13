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
        backgroundColor: Colors.indigo[800],
        title: Text(
          "الأقساط",
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
            padding: EdgeInsets.fromLTRB(30, 40, 0, 0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              children: [
                Container(
                  width: 250,
                  child: Center(
                    child: Text(" عدد مرات الدفع "),
                  ),
                ),
                Container(
                  width: 250,
                  child: Center(
                    child: Text("المبلغ"),
                  ),
                ),
                Container(
                  width: 250,
                  child: Center(
                    child: Text(" عدد الدفعات الكلية "),
                  ),
                ),
                Container(
                  width: 250,
                  child: Center(
                    child: Text("تاريخ التفعيل"),
                  ),
                ),
                Container(
                  width: 250,
                  child: Center(
                    child: Text("نوع الإضافة"),
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
          height: 20,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            children: [
              Container(
                width: 250,
                child: Center(
                  child: Text("${Ins0.calTimes}"),
                ),
              ),
              Container(
                width: 250,
                child: Center(
                  child: Text("${Ins0.feeValue}"),
                ),
              ),
              Container(
                width: 250,
                child: Center(
                  child: Text("${Ins0.feeTimes}"),
                ),
              ),
              Container(
                width: 250,
                child: Center(
                  child: Text("${Ins0.startDate.date}"),
                ),
              ),
              Container(
                width: 250,
                child: Center(
                  child: Text("${Ins0.feeName}"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
