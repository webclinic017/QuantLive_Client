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

              quantListItem(
                  "강환국 슈퍼가치전략", "PBR, PER 등을 통한 가치투자 전략입니다.",
                onItemTapped: (){
                    print("콜밲!");
                    Get.toNamed("/quantDetailInfoPage",arguments: QuantType.KANG_SUPER_VALUE);
                },
                onTooltipTapped: (){
                    print("툴팁!");
                }
              ),

              quantListItem(
                  "슈퍼벨류모멘텀", "순유동자산 전략입니다.",
                  onItemTapped: (){
                    print("콜밲!");
                    Get.toNamed("/quantDetailInfoPage",arguments: QuantType.SUPER_VALUE_MOMENTUM);
                  },
                  onTooltipTapped: (){
                    print("툴팁!");
                  }
              ),

              quantListItem(
                  "NCAV", "PBR, PER 등을 통한 가치투자 전략입니다.",
                  onItemTapped: (){
                    print("콜밲!");
                    Get.toNamed("/quantDetailInfoPage",arguments: QuantType.NCAV);
                  },
                  onTooltipTapped: (){
                    print("툴팁!");
                  }
              ),
              quantListItem(
                  "신마법공식 2.0", "PBR, PER 등을 통한 가치투자 전략입니다.",
                  onItemTapped: (){
                    print("콜밲!");
                    Get.toNamed("/quantDetailInfoPage",arguments: QuantType.NEW_MAGIC_FORMULA_2);
                  },
                  onTooltipTapped: (){
                    print("툴팁!");
                  }
              ),

              quantListItem(
                  "슈퍼퀄리티 2.0", "PBR, PER 등을 통한 가치투자 전략입니다.",
                  onItemTapped: (){
                    print("콜밲!");
                    Get.toNamed("/quantDetailInfoPage",arguments: QuantType.SUPER_QUALITY_2);
                  },
                  onTooltipTapped: (){
                    print("툴팁!");
                  }
              ),


            ],
          ),
        ),
      ),
    );
  }
}


