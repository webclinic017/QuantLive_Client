import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quantlive_client/Common/Defines.dart';
import 'package:quantlive_client/Common/Widgets.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: SafeArea(
        child: Container(
          margin: EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              Text(
                "퀀트 타입을 선택해주세요.",
                style: TextStyle(
                    fontFamily: "NanumSquareB",
                    fontWeight: FontWeight.bold,
                    fontSize: 24
                ),
              ),

              SizedBox(height: 8),

              Text(
                "열람하고 싶은 퀀트의 타입을 선택해주세요.",
                style: TextStyle(
                    fontFamily: "NanumSquareB",
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    color: Colors.grey
                ),
              ),

              SizedBox(height: 8),

              ListItemWidgetForMenu(
                  "강환국 👊슈퍼가치전략", QuantType.KANG_SUPER_VALUE.quantDescription,
                onItemTapped: (){
                    print("콜밲!");
                    Get.toNamed("/quantDetailInfoPage",arguments: QuantType.KANG_SUPER_VALUE);
                },
                onTooltipTapped: (){
                    print("툴팁!");
                }
              ),

              ListItemWidgetForMenu(
                  "슈퍼벨류모멘텀", QuantType.SUPER_VALUE_MOMENTUM.quantDescription,
                  onItemTapped: (){
                    print("콜밲!");
                    Get.toNamed("/quantDetailInfoPage",arguments: QuantType.SUPER_VALUE_MOMENTUM);
                  },
                  onTooltipTapped: (){
                    print("툴팁!");
                  }
              ),

              Visibility(
                visible: false,
                child: ListItemWidgetForMenu(
                    "NCAV", QuantType.NCAV.quantDescription,
                    onItemTapped: (){
                      print("콜밲!");
                      Get.toNamed("/quantDetailInfoPage",arguments: QuantType.NCAV);
                    },
                    onTooltipTapped: (){
                      print("툴팁!");
                    }
                ),
              ),

              ListItemWidgetForMenu(
                  "신마법공식 2.0", QuantType.NEW_MAGIC_FORMULA_2.quantDescription,
                  onItemTapped: (){
                    print("콜밲!");
                    Get.toNamed("/quantDetailInfoPage",arguments: QuantType.NEW_MAGIC_FORMULA_2);
                  },
                  onTooltipTapped: (){
                    print("툴팁!");
                  }
              ),

              Visibility(
                visible: false,
                child: ListItemWidgetForMenu(
                    "슈퍼퀄리티 2.0", QuantType.SUPER_QUALITY_2.quantDescription,
                    onItemTapped: (){
                      print("콜밲!");
                      Get.toNamed("/quantDetailInfoPage",arguments: QuantType.SUPER_QUALITY_2);
                    },
                    onTooltipTapped: (){
                      print("툴팁!");
                    }
                ),
              ),

              Expanded(
                child: Container(),
              ),

              InvestmentCautionWidget()


            ],
          ),
        ),
      ),
    );
  }
}


