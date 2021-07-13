import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../Personinfo.dart';
import 'loding.dart';

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
      home: Servicespage(),
    );
  }
}

class Servicespage extends StatefulWidget {
  @override
  _ServicesState createState() => _ServicesState();
}

class _ServicesState extends State<Servicespage> {
  late TextEditingController _controller;

  void initState() {
    super.initState();
    _controller = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          toolbarHeight: 70.0,
          backgroundColor: Colors.indigo[800],
          title: Text("الخدمات",
              style: TextStyle(
                fontSize: 40,
                color: Colors.white,
              )),
          centerTitle: true,
          leading: IconButton(
            icon: Icon(Icons.arrow_back_ios, color: Colors.white),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ),
        body: Center(
          child: Container(
            child: Column(
              children: [
                SizedBox(
                  width: 1300,
                  height: 280,
                ),
                Text("رقم الخدمة",
                    style: (TextStyle(
                      color: Colors.black,
                      fontSize: 50,
                    ))),
                SizedBox(
                  height: 30,
                ),
                Container(
                  width: 400,
                  height: 60,
                  child: TextField(
                    enableInteractiveSelection: false,
                    textAlign: TextAlign.right,
                    controller: _controller,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'ادخل رقم الخدمة',
                      alignLabelWithHint: true,
                    ),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute<void>(
                        builder: (BuildContext context) =>
                            Loading(_controller.text),
                      ),
                    );
                  },
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.all(Radius.circular(5.0)),
                      child: Container(
                        width: 400,
                        height: 60,
                        color: Colors.indigo[800],
                        child: Center(
                          child: Text(
                            "دخول",
                            style: TextStyle(color: Colors.white, fontSize: 30),
                          ),
                        ),
                        /*ElevatedButton(
                          child: Text(
                            "دخول",
                          ),
                          onPressed: () {
                            Navigator.of(context).push(
                              MaterialPageRoute<void>(
                                builder: (BuildContext context) =>
                                    Loading(_controller.text),
                              ),
                            );
                          },
                        ),*/
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}

Future<Personinfo>? _futureNo;

FutureBuilder<Personinfo> buildFutureBuilder() {
  return FutureBuilder<Personinfo>(
    future: _futureNo,
    builder: (context, snapshot) {
      if (snapshot.hasData) {
        return Text(snapshot.data!.agreementId);
      } else if (snapshot.hasError) {
        return Text('${snapshot.error}');
      }
      return CircularProgressIndicator();
    },
  );
}
