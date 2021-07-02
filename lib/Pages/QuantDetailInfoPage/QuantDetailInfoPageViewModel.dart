import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:quantlive_client/Common/Defines.dart';
import 'package:quantlive_client/Models/KangSuperValueModel.dart';

class QuantDetailInfoPageViewModel {

  Future<dynamic> fetchQuantItems(QuantType type) async {
    print("Hello");
    final response = await http.get(Uri.parse(type.dataUrl));
    if (response.statusCode == 200) {
      List responseJson = json.decode(response.body);

      //퀀트 타입별로 파싱을 다르게 한다.
      if(type == QuantType.KANG_SUPER_VALUE){
        List<KangSuperValueModel> items = <KangSuperValueModel>[];
        responseJson.forEach((element) {
          KangSuperValueModel model = KangSuperValueModel.fromJson(element);
          items.add(model);
        });
        return items;
      }

    }else{
      throw Exception("Failed to load Quant Items!");
    }
  }

}
