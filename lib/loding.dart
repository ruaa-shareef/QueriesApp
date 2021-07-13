import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'Personinfo.dart';
import 'main.dart';
import 'mainPage.dart';

class Loading extends StatefulWidget {
  String agreementId;
  Loading(this.agreementId);
  @override
  _LoadingState createState() => _LoadingState(this.agreementId);
}

class _LoadingState extends State<Loading> {
  String agreementId0;
  _LoadingState(this.agreementId0);

  late List<Personinfo> clintInfo = [];
  void fetchRest() async {
    http.Response response = await http.get(Uri.parse(
        'http://api.hepco.ps:8084/integration/login-service.php?id=${this.agreementId0}&fun=logins'));
    if (response.statusCode == 200) {
      var jsonArray = jsonDecode(response.body) as List;
      clintInfo =
          jsonArray.map((element) => Personinfo.fromJson(element)).toList();

      Navigator.of(context).pushReplacement(
        MaterialPageRoute<void>(
          builder: (BuildContext context) => MyHomePage(
              clintInfo[0].agreementId,
              clintInfo[0].nameA,
              clintInfo[0].addressa),
        ),
      );
    }
  }

  @override
  void initState() {
    super.initState();
    fetchRest();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
    );
  }
}
