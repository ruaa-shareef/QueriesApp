import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'installment.dart';
import 'instinfo.dart';

class LoadingInst extends StatefulWidget {
  String agreementId;
  String name;
  LoadingInst(this.agreementId, this.name);
  @override
  _LoadingInstState createState() =>
      _LoadingInstState(this.agreementId, this.name);
}

class _LoadingInstState extends State<LoadingInst> {
  String agreementId0;
  String name0;

  _LoadingInstState(this.agreementId0, this.name0);

  late List<Instinfo> clintInfo = [];
  void fetchRest() async {
    http.Response response = await http.get(Uri.parse(
        'http://portal.hepco.ps:7654/api/GetScreenExtinsionByCustId/${this.agreementId0}'));
    //${this.agreementId0}
    if (response.statusCode == 200) {
      var jsonArray = jsonDecode(response.body) as List;
      clintInfo =
          jsonArray.map((element) => Instinfo.fromJson(element)).toList();

      print("kldsfhdskjlfhd");
      print(clintInfo);
      Navigator.of(context).pushReplacement(
        MaterialPageRoute<void>(
          builder: (BuildContext context) =>
              orgInstallment(this.clintInfo, this.name0),
        ),
      );
    } else {
      throw Exception("Failed to load data");
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
