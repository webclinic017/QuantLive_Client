// To parse this JSON data, do
//
//     final magicFormulaQuantModel = magicFormulaQuantModelFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

MagicFormulaQuantModel magicFormulaQuantModelFromJson(String str) => MagicFormulaQuantModel.fromJson(json.decode(str));

String magicFormulaQuantModelToJson(MagicFormulaQuantModel data) => json.encode(data.toJson());

class MagicFormulaQuantModel {
  MagicFormulaQuantModel({
    required this.quantJcode,
    required this.quantJname,
    required this.quantPbr,
    required this.quantGpa,
    required this.quantOrder,
    required this.quantDate,
  });

  String quantJcode;
  String quantJname;
  String quantPbr;
  String quantGpa;
  String quantOrder;
  DateTime quantDate;

  factory MagicFormulaQuantModel.fromJson(Map<String, dynamic> json) => MagicFormulaQuantModel(
    quantJcode: json["quant_jcode"],
    quantJname: json["quant_jname"],
    quantPbr: json["quant_pbr"],
    quantGpa: json["quant_gpa"],
    quantOrder: json["quant_order"],
    quantDate: DateTime.parse(json["quant_date"]),
  );

  Map<String, dynamic> toJson() => {
    "quant_jcode": quantJcode,
    "quant_jname": quantJname,
    "quant_pbr": quantPbr,
    "quant_gpa": quantGpa,
    "quant_order": quantOrder,
    "quant_date": "${quantDate.year.toString().padLeft(4, '0')}-${quantDate.month.toString().padLeft(2, '0')}-${quantDate.day.toString().padLeft(2, '0')}",
  };
}
