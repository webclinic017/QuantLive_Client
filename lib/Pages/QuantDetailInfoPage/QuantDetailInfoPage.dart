import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:quantlive_client/Common/Defines.dart';
import 'package:quantlive_client/Common/Util.dart';
import 'package:quantlive_client/Common/Widgets.dart';
import 'package:quantlive_client/Models/QuantItemModel/KangSuperValueModel.dart';
import 'package:quantlive_client/Models/QuantItemModel/MagicFormulaQuantModel.dart';
import 'package:quantlive_client/Models/QuantItemModel/NaverStockPriceInfoModel.dart';
import 'package:quantlive_client/Models/QuantItemModel/SuperValueMomentumQuantModel.dart';
import 'package:quantlive_client/Pages/QuantDetailInfoPage/QuantDetailInfoPageViewModel.dart';
import 'package:webview_flutter/webview_flutter.dart';

class QuantDetailInfoPage extends StatefulWidget {
  const QuantDetailInfoPage({Key? key}) : super(key: key);

  @override
  _QuantDetailInfoPageState createState() => _QuantDetailInfoPageState();
}

class _QuantDetailInfoPageState extends State<QuantDetailInfoPage> {

  QuantDetailInfoPageViewModel viewModel = QuantDetailInfoPageViewModel();
  QuantType? quantType;
  bool isLoadingQuantData = false;
  bool isLoadingQuantWebView = false;
  List<dynamic> quantItemList = <dynamic>[];

  @override
  void initState() {




    this.quantType = Get.arguments as QuantType;
    super.initState();

    loadQuantContents();

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: QuantLiveAppBar(title: "종목보기"),
      body: Stack(
        children: [

          SafeArea(
              child: Container(
                  margin: EdgeInsets.only(left: 24, right: 24, top: 8, bottom: 24),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [

                      Text(
                        "${this.quantType?.name}",
                        style: TextStyle(
                            fontFamily: "NanumSquareB",
                            fontWeight: FontWeight.bold,
                            fontSize: 24
                        ),
                      ),

                      SizedBox(height: 8),

                      getQuantDescription(quantType),

                      SizedBox(height: 8),

                      getItemList(),

                      InvestmentCautionWidget()


                    ],
                  )
              )
          ),

          DimView()

        ],
      ),
    );
  }

  Widget getItemList(){
    return Expanded(
      child: Container(
        child: ListView.builder(
          itemCount: quantItemList.length,
          itemBuilder: (BuildContext context, int index) {
            return configureQuantListItem(index);
            //return quantListItem("${index}", "${index}");
          },
        ),
      ),
    );
  }

  Widget DimView(){
    return Visibility(
      visible: this.isLoadingQuantData,
      child: GestureDetector(
        onTap: (){
          setState(() {
            this.isLoadingQuantData = false;
          });
        },
        child: Container(
          width: Get.width,
          height: Get.height,
          color: Colors.black45,
          child: Center(
            child: CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(Colors.amberAccent),
            ),
          ),
        ),
      ),
    );
  }

  void loadQuantContents() async {
    if (this.quantType != null){

      setState(() {
        this.isLoadingQuantData = true;
      });

      //아이템 리스트가 나온다.
      this.quantItemList = await viewModel.fetchQuantItems(this.quantType!);

      setState(() {
        this.isLoadingQuantData = false;
      });

    }
  }

  Widget configureQuantListItem(int index) {
    //강환국 슈퍼가치전략
    if (this.quantType == QuantType.KANG_SUPER_VALUE) {
      KangSuperValueModel quantData = (this.quantItemList as List<KangSuperValueModel>)[index];
      return ListItemForKangSuperValue(index, quantData,
          onItemTapped: (){
            showNaverStockInfoBottomSheet(quantData.quantJcode);
          },
          onTooltipTapped: (){
            Clipboard.setData(ClipboardData(text: quantData.quantJname));
            Get.snackbar("알림",
                "'${quantData.quantJname}' 종목명이 복사되었습니다.",
                animationDuration: Duration(seconds: 1),
              snackPosition: SnackPosition.BOTTOM
            );
            launchVibrate();
          }
      );
    }
    //슈퍼벨류모멘텀
    else if (this.quantType == QuantType.SUPER_VALUE_MOMENTUM) {
      SuperValueMomentumQuantModel quantData = (this.quantItemList as List<SuperValueMomentumQuantModel>)[index];
      return ListItemForSuperValueMomentum(index, quantData,
          onItemTapped: (){
            showNaverStockInfoBottomSheet(quantData.quantJcode);
          },
          onTooltipTapped: (){
            Clipboard.setData(ClipboardData(text: quantData.quantJname));
            Get.snackbar("알림",
                "'${quantData.quantJname}' 종목명이 복사되었습니다.",
                animationDuration: Duration(seconds: 1),
                snackPosition: SnackPosition.BOTTOM
            );
            launchVibrate();
          }
      );
    }
    //신마법공식 2.0
    else if (this.quantType == QuantType.NEW_MAGIC_FORMULA_2) {
      MagicFormulaQuantModel quantData = (this.quantItemList as List<MagicFormulaQuantModel>)[index];
      return ListItemForMagicFormula(index, quantData,
          onItemTapped: (){
            showNaverStockInfoBottomSheet(quantData.quantJcode);
          },
          onTooltipTapped: (){
            Clipboard.setData(ClipboardData(text: quantData.quantJname));
            Get.snackbar("알림",
                "'${quantData.quantJname}' 종목명이 복사되었습니다.",
                animationDuration: Duration(seconds: 1),
                snackPosition: SnackPosition.BOTTOM
            );
            launchVibrate();
          }
      );
    }

    return ListItemWidgetForMenu("타이틀${index}", "컨텐츠${index}");

  }

  Widget getQuantDescription(QuantType? quantType){
    if(quantType == QuantType.KANG_SUPER_VALUE){
      return Text(
        QuantType.KANG_SUPER_VALUE.quantDescription,
        style: TextStyle(
            fontFamily: "NanumSquareB",
            fontWeight: FontWeight.bold,
            fontSize: 16,
            color: Colors.grey
        ),
      );
    }if(quantType == QuantType.SUPER_VALUE_MOMENTUM){
      return Text(
        QuantType.SUPER_VALUE_MOMENTUM.quantDescription,
        style: TextStyle(
            fontFamily: "NanumSquareB",
            fontWeight: FontWeight.bold,
            fontSize: 16,
            color: Colors.grey
        ),
      );
    }if(quantType == QuantType.NEW_MAGIC_FORMULA_2){
      return Text(
        QuantType.NEW_MAGIC_FORMULA_2.quantDescription,
        style: TextStyle(
            fontFamily: "NanumSquareB",
            fontWeight: FontWeight.bold,
            fontSize: 16,
            color: Colors.grey
        ),
      );
    }

    return Container();
  }


}
