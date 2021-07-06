// To parse this JSON data, do
//
//     final personinfo = personinfoFromJson(jsonString);

import 'dart:convert';

Personinfo personinfoFromJson(String str) =>
    Personinfo.fromJson(json.decode(str));

String personinfoToJson(Personinfo data) => json.encode(data.toJson());

class Personinfo {
  Personinfo({
    required this.agreementId,
    required this.nameA,
    required this.addressa,
  });

  String agreementId;
  String nameA;
  String addressa;

  factory Personinfo.fromJson(Map<String, dynamic> json) => Personinfo(
        agreementId: json["AGREEMENT_ID"],
        nameA: json["NAME_A"],
        addressa: json["ADDRESS_A"],
      );

  Map<String, dynamic> toJson() => {
        "AGREEMENT_ID": agreementId,
        "NAME_A": nameA,
        "ADDRESS_A": addressa,
      };
}
