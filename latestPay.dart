import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Quesies Website',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Pay(),
    );
  }
}

class Pay extends StatelessWidget {
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: Text(
            "اخر الدفعات",
            style: TextStyle(color: Colors.black),
          ),
          centerTitle: true,
          leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: Icon(
              Icons.arrow_back_ios_new,
              color: Colors.black,
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
                  'رؤى الشريف',
                  style: TextStyle(color: Colors.black, fontSize: 20),
                ),
              ),
            ),
            Container(
              alignment: Alignment.topRight,
              padding: EdgeInsets.fromLTRB(0, 20, 70, 0),
              child: DataTable(
                dataRowHeight: 70.0,
                columnSpacing: 200.0,
                columns: const <DataColumn>[

                  DataColumn(
                    label: Text(
                      'رقم الفاتورة',
                      style: TextStyle(fontStyle: FontStyle.italic),
                    ),
                  ),

                  DataColumn(
                    label: Text(
                      'التاريخ ',
                      style: TextStyle(fontStyle: FontStyle.italic),
                    ),
                  ),
                  
                ],
                rows: const <DataRow>[
                  DataRow(
                    cells: <DataCell>[
                      DataCell(Text('bill no')),
                      DataCell(Text('date')),
                    ],
                  ),
                  DataRow(
                    cells: <DataCell>[
                      DataCell(Text('bill no')),
                      DataCell(Text('date')),
                    ],
                  ),
                  DataRow(
                    cells: <DataCell>[
                      DataCell(Text('bill no')),
                      DataCell(Text('date')),
                    ],
                  ),
                  DataRow(
                    cells: <DataCell>[
                      DataCell(Text('bill no')),
                      DataCell(Text('date')),
                    ],
                  ),
                  DataRow(
                    cells: <DataCell>[
                      DataCell(Text('bill no')),
                      DataCell(Text('date')),                   
                    ],
                  ),
                ],
              ),
            ),
          ],
        ));
  }
}