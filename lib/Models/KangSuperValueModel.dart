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
    required this.quantSigachong,
    required this.quantIssues,
    required this.quantAsset,
    required this.quantGp,
    required this.quantMarketProfit,
    required this.quantGpa,
    required this.quantNetProfit,
    required this.quantSells,
  });

  String quantJcode;
  String quantJname;
  String quantSigachong;
  String quantIssues;
  String quantAsset;
  String quantGp;
  String quantMarketProfit;
  String quantGpa;
  String quantNetProfit;
  String quantSells;

  factory KangSuperValueModel.fromJson(Map<String, dynamic> json) => KangSuperValueModel(
    quantJcode: json["quant_jcode"] ?? "",
    quantJname: json["quant_jname"] ?? "",
    quantSigachong: json["quant_sigachong"] ?? "",
    quantIssues: json["quant_issues"] ?? "",
    quantAsset: json["quant_asset"] ?? "",
    quantGp: json["quant_gp"] ?? "",
    quantMarketProfit: json["quant_market_profit"] ?? "",
    quantGpa: json["quant_gpa"] ?? "",
    quantNetProfit: json["quant_net_profit"] ?? "",
    quantSells: json["quant_sells"] ?? "",
  );

  Map<String, dynamic> toJson() => {
    "quant_jcode": quantJcode,
    "quant_jname": quantJname,
    "quant_sigachong": quantSigachong,
    "quant_issues": quantIssues,
    "quant_asset": quantAsset,
    "quant_gp": quantGp,
    "quant_market_profit": quantMarketProfit,
    "quant_gpa": quantGpa,
    "quant_net_profit": quantNetProfit,
    "quant_sells": quantSells,
  };
}
