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
      home: Services(
        title: 'الخدمات',
      ),
    );
  }
}

class Services extends StatefulWidget {
  Services({Key? key, required this.title}) : super(key: key);

  final String title;
  @override
  _ServicesState createState() => _ServicesState();
}

class _ServicesState extends State<Services> {
  Future<Personinfo> fetchNo(String no) async {
    final response = await http.post(
      Uri.parse(
          'http://api.hepco.ps:8084/integration/login-service.php?id=${_controller.text}&fun=logins'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'Number': no,
      }),
    );

    if (response.statusCode == 201) {
      // If the server did return a 201 CREATED response,
      // then parse the JSON.
      return Personinfo.fromJson(jsonDecode(response.body));
    } else {
      // If the server did not return a 201 CREATED response,
      // then throw an exception.
      throw Exception('Failed to create album.');
    }
  }

  late TextEditingController _controller;

  void initState() {
    super.initState();
    _controller = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue[600],
          title: Text("الخدمات",
              style: TextStyle(
                fontSize: 30,
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
        body: Container(
          child: Column(
            children: [
              SizedBox(
                width: 1300,
                height: 150,
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
                width: 300,
                height: 50,
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
              Container(
                width: 300,
                height: 50,
                child: ElevatedButton(
                  child: Text("دخول"),
                  onPressed: () {
                    _futureNo = fetchNo(_controller.text);
                    Navigator.of(context).push(
                      MaterialPageRoute<void>(
                        builder: (BuildContext context) =>
                            Loading(_controller.text),
                      ),
                    );
                  },
                ),
              ),
            ],
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
