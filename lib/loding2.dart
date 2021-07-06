import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:queriesa/payinfo.dart';
import 'Personinfo.dart';
import 'latest payments.dart';
import 'mainPage.dart';

class Loadingpay extends StatefulWidget {
  String agreementId;
  String name;

  Loadingpay(this.agreementId, this.name);
  @override
  _LoadingpayState createState() =>
      _LoadingpayState(this.agreementId, this.name);
}

class _LoadingpayState extends State<Loadingpay> {
  String agreementId0;
  String name1;

  _LoadingpayState(this.agreementId0, this.name1);

  late List<Payinfo> clintInfo = [];
  void fetchRest() async {
    http.Response response = await http.get(Uri.parse(
        'http://api.hepco.ps:8084/integration/fawateryapi.php?id=${this.agreementId0}&pass=123&fun=payments&page=1'));
    if (response.statusCode == 200) {
      var jsonArray = jsonDecode(response.body) as List;
      clintInfo =
          jsonArray.map((element) => Payinfo.fromJson(element)).toList();

      Navigator.of(context).pushReplacement(
        MaterialPageRoute<void>(
          builder: (BuildContext context) =>
              lastPays(this.name1, this.clintInfo),
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
