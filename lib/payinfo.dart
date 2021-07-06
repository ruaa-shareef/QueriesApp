// To parse this JSON data, do
//
//     final payinfo = payinfoFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

List<Payinfo> payinfoFromJson(String str) =>
    List<Payinfo>.from(json.decode(str).map((x) => Payinfo.fromJson(x)));

String payinfoToJson(List<Payinfo> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Payinfo {
  Payinfo({
    required this.no,
    required this.amt,
    required this.dt,
  });

  String no;
  String amt;
  DateTime dt;

  factory Payinfo.fromJson(Map<String, dynamic> json) => Payinfo(
        no: json["NO"],
        amt: json["AMT"],
        dt: DateTime.parse(json["DT"]),
      );

  Map<String, dynamic> toJson() => {
        "NO": no,
        "AMT": amt,
        "DT": dt.toIso8601String(),
      };
}
