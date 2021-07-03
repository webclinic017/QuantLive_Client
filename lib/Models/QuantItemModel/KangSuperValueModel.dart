// To parse this JSON data, do
//
//     final kangSuperValueModel = kangSuperValueModelFromJson(jsonString);

import 'dart:convert';

KangSuperValueModel kangSuperValueModelFromJson(String str) => KangSuperValueModel.fromJson(json.decode(str));

String kangSuperValueModelToJson(KangSuperValueModel data) => json.encode(data.toJson());

class KangSuperValueModel {
  KangSuperValueModel({
    required this.quantJcode,
    required this.quantJname,
    required this.quantPer,
    required this.quantPbr,
    required this.quantPcr,
    required this.quantPsr,
    required this.quantOrder,
    required this.quantPrice,
    required this.quantDate,
  });

  String quantJcode;
  String quantJname;
  String quantPer;
  String quantPbr;
  String quantPcr;
  String quantPsr;
  String quantOrder;
  String quantPrice;
  DateTime quantDate;

  factory KangSuperValueModel.fromJson(Map<String, dynamic> json) => KangSuperValueModel(
    quantJcode: json["quant_jcode"],
    quantJname: json["quant_jname"],
    quantPer: json["quant_per"],
    quantPbr: json["quant_pbr"],
    quantPcr: json["quant_pcr"],
    quantPsr: json["quant_psr"],
    quantOrder: json["quant_order"],
    quantPrice: json["quant_price"],
    quantDate: DateTime.parse(json["quant_date"]),
  );

  Map<String, dynamic> toJson() => {
    "quant_jcode": quantJcode,
    "quant_jname": quantJname,
    "quant_per": quantPer,
    "quant_pbr": quantPbr,
    "quant_pcr": quantPcr,
    "quant_psr": quantPsr,
    "quant_order": quantOrder,
    "quant_price": quantPrice,
    "quant_date": "${quantDate.year.toString().padLeft(4, '0')}-${quantDate.month.toString().padLeft(2, '0')}-${quantDate.day.toString().padLeft(2, '0')}",
  };
}
