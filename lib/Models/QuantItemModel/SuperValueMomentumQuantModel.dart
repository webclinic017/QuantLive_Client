// To parse this JSON data, do
//
//     final superValueMomentumQuantModel = superValueMomentumQuantModelFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

SuperValueMomentumQuantModel superValueMomentumQuantModelFromJson(String str) => SuperValueMomentumQuantModel.fromJson(json.decode(str));

String superValueMomentumQuantModelToJson(SuperValueMomentumQuantModel data) => json.encode(data.toJson());

class SuperValueMomentumQuantModel {
  SuperValueMomentumQuantModel({
    required this.quantJcode,
    required this.quantJname,
    required this.quantPer,
    required this.quantPbr,
    required this.quantPcr,
    required this.quantGpa,
    required this.quantOrder,
    required this.quantMomentum,
    required this.quantAccCount,
    required this.quantDate,
  });

  String quantJcode;
  String quantJname;
  String quantPer;
  String quantPbr;
  String quantPcr;
  String quantGpa;
  String quantOrder;
  String quantMomentum;
  int quantAccCount;
  DateTime quantDate;

  factory SuperValueMomentumQuantModel.fromJson(Map<String, dynamic> json) => SuperValueMomentumQuantModel(
    quantJcode: json["quant_jcode"],
    quantJname: json["quant_jname"],
    quantPer: json["quant_per"],
    quantPbr: json["quant_pbr"],
    quantPcr: json["quant_pcr"],
    quantGpa: json["quant_gpa"],
    quantOrder: json["quant_order"],
    quantMomentum: json["quant_momentum"],
    quantAccCount: json["quant_accCount"],
    quantDate: DateTime.parse(json["quant_date"]),
  );

  Map<String, dynamic> toJson() => {
    "quant_jcode": quantJcode,
    "quant_jname": quantJname,
    "quant_per": quantPer,
    "quant_pbr": quantPbr,
    "quant_pcr": quantPcr,
    "quant_gpa": quantGpa,
    "quant_order": quantOrder,
    "quant_momentum": quantMomentum,
    "quant_accCount": quantAccCount,
    "quant_date": "${quantDate.year.toString().padLeft(4, '0')}-${quantDate.month.toString().padLeft(2, '0')}-${quantDate.day.toString().padLeft(2, '0')}",
  };
}
