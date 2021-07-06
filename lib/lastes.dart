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
        backgroundColor: Colors.blue[600],
        title: Text(
          "آخر الفواتير",
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
          Container(
            padding: EdgeInsets.fromLTRB(30, 50, 0, 0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              children: [
                Container(
                  width: 300,
                  child: Center(
                    child: Text("المبلغ المدفوع "),
                  ),
                ),
                Container(
                  width: 300,
                  child: Center(
                    child: Text("المبلغ"),
                  ),
                ),
                Container(
                  width: 300,
                  child: Center(
                    child: Text("رقم الفاتورة "),
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
                width: 300,
                child: Center(
                  child: Text("${bill0.pamt}"),
                ),
              ),
              Container(
                width: 300,
                child: Center(
                  child: Text("${bill0.amt}"),
                ),
              ),
              Container(
                width: 300,
                child: Center(
                  child: Text("${bill0.no}"),
                ),
              ),
              Container(
                width: 300,
                child: Center(
                  child: Text("${bill0.dt}"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
