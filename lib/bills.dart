// To parse this JSON data, do
//
//     final lastbills = lastbillsFromJson(jsonString);

import 'dart:convert';

List<Lastbills> lastbillsFromJson(String str) =>
    List<Lastbills>.from(json.decode(str).map((x) => Lastbills.fromJson(x)));

String lastbillsToJson(List<Lastbills> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Lastbills {
  Lastbills({
    required this.no,
    required this.amt,
    required this.pamt,
    required this.dt,
  });

  String no;
  String amt;
  String pamt;
  DateTime dt;

  factory Lastbills.fromJson(Map<String, dynamic> json) => Lastbills(
        no: json["NO"],
        amt: json["AMT"],
        pamt: json["PAMT"],
        dt: DateTime.parse(json["DT"]),
      );

  Map<String, dynamic> toJson() => {
        "NO": no,
        "AMT": amt,
        "PAMT": pamt,
        "DT": dt.toIso8601String(),
      };
}
