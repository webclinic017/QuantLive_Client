import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:quantlive_client/Common/Defines.dart';
import 'package:quantlive_client/Models/QuantItemModel/KangSuperValueModel.dart';
import 'package:quantlive_client/Models/QuantItemModel/MagicFormulaQuantModel.dart';
import 'package:quantlive_client/Models/QuantItemModel/NaverStockPriceInfoModel.dart';
import 'package:quantlive_client/Models/QuantItemModel/SuperValueMomentumQuantModel.dart';

class QuantDetailInfoPageViewModel {

  Future<dynamic> fetchQuantItems(QuantType type) async {
    print("Hello");
    final response = await http.get(Uri.parse(type.dataUrl));
    if (response.statusCode == 200) {
      List responseJson = json.decode(response.body);

      print(responseJson);

      //퀀트 타입별로 파싱을 다르게 한다.
      //강환국 슈퍼가치전략
      if(type == QuantType.KANG_SUPER_VALUE){
        List<KangSuperValueModel> items = <KangSuperValueModel>[];
        responseJson.forEach((element) {
          KangSuperValueModel model = KangSuperValueModel.fromJson(element);
          items.add(model);
        });
        return items;
      }
      //슈퍼 밸류 모멘텀
      else if(type == QuantType.SUPER_VALUE_MOMENTUM){
        List<SuperValueMomentumQuantModel> items = <SuperValueMomentumQuantModel>[];
        responseJson.forEach((element) {
          SuperValueMomentumQuantModel model = SuperValueMomentumQuantModel.fromJson(element);
          items.add(model);
        });
        return items;
      }
      //신마법공식 2.0
      else if(type == QuantType.NEW_MAGIC_FORMULA_2){
        List<MagicFormulaQuantModel> items = <MagicFormulaQuantModel>[];
        responseJson.forEach((element) {
          MagicFormulaQuantModel model = MagicFormulaQuantModel.fromJson(element);
          items.add(model);
        });
        return items;
      }

    }else{
      throw Exception("Failed to load Quant Items!");
    }
  }

  //네이버에서 종가 및 변동가격을 가져오는 함수인데 사용하지 않음
  @deprecated
  Future<NaverStockPriceInfoModel> fetchRiseFallValue(String stockCode) async {
    String NAVER_STOCK_INFO_URL = "https://m.stock.naver.com/api/item/getTrendList.nhn?code=${stockCode}&size=1";
    print("NAVER_STOCK_INFO_URL : ${NAVER_STOCK_INFO_URL}");
    final response = await http.get(Uri.parse(NAVER_STOCK_INFO_URL));
    if (response.statusCode == 200) {
      var responseJson = json.decode(response.body);
      NaverStockPriceInfoModel stockPriceInfoItem = NaverStockPriceInfoModel.fromJson(responseJson);
      return stockPriceInfoItem;
    }else{
      throw Exception("Failed to load Quant Items!");
    }
  }

}
