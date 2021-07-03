// To parse this JSON data, do
//
//     final naverStockPriceInfoModel = naverStockPriceInfoModelFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

NaverStockPriceInfoModel naverStockPriceInfoModelFromJson(String str) => NaverStockPriceInfoModel.fromJson(json.decode(str));

String naverStockPriceInfoModelToJson(NaverStockPriceInfoModel data) => json.encode(data.toJson());

class NaverStockPriceInfoModel {
  NaverStockPriceInfoModel({
    required this.result,
    required this.resultCode,
  });

  List<Result> result;
  String resultCode;

  factory NaverStockPriceInfoModel.fromJson(Map<String, dynamic> json) => NaverStockPriceInfoModel(
    result: List<Result>.from(json["result"].map((x) => Result.fromJson(x))),
    resultCode: json["resultCode"],
  );

  Map<String, dynamic> toJson() => {
    "result": List<dynamic>.from(result.map((x) => x.toJson())),
    "resultCode": resultCode,
  };
}

class Result {
  Result({
    required this.changeVal,
    required this.frgnStock,
    required this.frgnPureBuyQuant,
    required this.frgnHoldRatio,
    required this.accQuant,
    required this.bizdate,
    required this.risefall,
    required this.itemcode,
    required this.listedStock,
    required this.closeVal,
    required this.sosok,
    required this.organPureBuyQuant,
    required this.indiPureBuyQuant,
  });

  int changeVal;
  int frgnStock;
  int frgnPureBuyQuant;
  double frgnHoldRatio;
  int accQuant;
  String bizdate;
  String risefall;
  String itemcode;
  int listedStock;
  int closeVal;
  String sosok;
  int organPureBuyQuant;
  int indiPureBuyQuant;

  factory Result.fromJson(Map<String, dynamic> json) => Result(
    changeVal: json["change_val"],
    frgnStock: json["frgn_stock"],
    frgnPureBuyQuant: json["frgn_pure_buy_quant"],
    frgnHoldRatio: json["frgn_hold_ratio"].toDouble(),
    accQuant: json["acc_quant"],
    bizdate: json["bizdate"],
    risefall: json["risefall"],
    itemcode: json["itemcode"],
    listedStock: json["listed_stock"],
    closeVal: json["close_val"],
    sosok: json["sosok"],
    organPureBuyQuant: json["organ_pure_buy_quant"],
    indiPureBuyQuant: json["indi_pure_buy_quant"],
  );

  Map<String, dynamic> toJson() => {
    "change_val": changeVal,
    "frgn_stock": frgnStock,
    "frgn_pure_buy_quant": frgnPureBuyQuant,
    "frgn_hold_ratio": frgnHoldRatio,
    "acc_quant": accQuant,
    "bizdate": bizdate,
    "risefall": risefall,
    "itemcode": itemcode,
    "listed_stock": listedStock,
    "close_val": closeVal,
    "sosok": sosok,
    "organ_pure_buy_quant": organPureBuyQuant,
    "indi_pure_buy_quant": indiPureBuyQuant,
  };
}
