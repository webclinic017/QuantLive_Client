
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quantlive_client/Common/Defines.dart';
import 'package:quantlive_client/Models/QuantItemModel/KangSuperValueModel.dart';
import 'package:quantlive_client/Models/QuantItemModel/MagicFormulaQuantModel.dart';
import 'package:quantlive_client/Models/QuantItemModel/SuperValueMomentumQuantModel.dart';
import 'package:webview_flutter/webview_flutter.dart';

import 'RiseFallWidget.dart';

Widget ListItemWidgetForMenu(String title,
    String content,
    {Function? onItemTapped = null,
      bool? visibleTooltip = false,
      Function? onTooltipTapped = null})
{
  return GestureDetector(
    onTap: (){
      if (onItemTapped != null) {
        onItemTapped();
      }
    },
    child: Container(
      width: Get.width,
      height: 120,
      decoration: BoxDecoration(
          color: Colors.yellow,
          borderRadius: BorderRadius.all(Radius.circular(8)),
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [
              Color.fromARGB(255, 45, 115, 231),
              Color.fromARGB(255, 71, 188, 238),
            ],
          )
      ),
      padding: EdgeInsets.all(16),
      margin: EdgeInsets.only(top: 8, bottom: 8),
      //color: Colors.red,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [

          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: [

              Text(
                "${title}",
                style: TextStyle(
                    fontFamily: "NanumSquareB",
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontSize: 20
                ),
              ),

              SizedBox(height: 4),

              Container(
                width: Get.width * 0.7,
                child: Text(
                  "${content}",
                  maxLines: 3,
                  style: TextStyle(
                      fontFamily: "NanumSquare",
                      color: Colors.white,
                      fontSize: 14
                  ),
                ),
              ),

            ],
          ),

          Visibility(
            visible: visibleTooltip == null ? false : visibleTooltip,
            child: Container(
                width: 40,
                child: Center(
                  child: IconButton(
                    icon: Icon(Icons.info_outline),
                    color: Colors.white,
                    onPressed: () {
                      if (onTooltipTapped != null){
                        onTooltipTapped();
                      }
                    },
                  ),
                )
            ),
          )

        ],
      ),
    ),
  );
}

Widget ListItemForKangSuperValue(
    int index,
    KangSuperValueModel data,
    {Function? onItemTapped = null,
      bool? visibleTooltip = false,
      Function? onTooltipTapped = null})
{
  return GestureDetector(
    onTap: (){
      if (onItemTapped != null) {
        onItemTapped();
      }
    },
    child: Container(
      width: Get.width,
      height: 120,
      decoration: BoxDecoration(
          color: Colors.yellow,
          borderRadius: BorderRadius.all(Radius.circular(8)),
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [
              Color.fromARGB(255, 45, 115, 231),
              Color.fromARGB(255, 71, 188, 238),
            ],
          )
      ),
      padding: EdgeInsets.all(16),
      margin: EdgeInsets.only(top: 8, bottom: 8),
      //color: Colors.red,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [

          Container(
            width: 20,
            margin: EdgeInsets.only(right: 16),
            child: Center(
              child: Text(
                "${index+1}",
                style: TextStyle(
                    fontFamily: "NanumSquareB",
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontSize: 16
                ),
              ),
            ),
          ),

          Expanded (
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: [

                Row(
                  children: [

                    Text(
                      "${data.quantJname}",
                      style: TextStyle(
                          fontFamily: "NanumSquareB",
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          fontSize: 20
                      ),
                    ),
                    //RiseFallStatusWidget(100)

                  ],
                ),

                SizedBox(height: 8),

                Text(
                  "기준일 : ${data.quantDate.year}/${data.quantDate.month}/${data.quantDate.day}",
                  style: TextStyle(
                      fontFamily: "NanumSquare",
                      color: Colors.white,
                      fontSize: 12
                  ),
                ),

                SizedBox(height: 8),

                Row(

                  children: [

                    Text(
                      "PER : ${data.quantPer}",
                      style: TextStyle(
                          fontFamily: "NanumSquare",
                          color: Colors.white,
                          fontSize: 14
                      ),
                    ),

                    SizedBox(width: 16),

                    Text(
                      "PBR : ${data.quantPbr}",
                      style: TextStyle(
                          fontFamily: "NanumSquare",
                          color: Colors.white,
                          fontSize: 14
                      ),
                    ),

                  ],
                ),

                Row(
                  children: [
                    Text(
                      "PCR : ${data.quantPcr}",
                      style: TextStyle(
                          fontFamily: "NanumSquare",
                          color: Colors.white,
                          fontSize: 14
                      ),
                    ),

                    SizedBox(width: 16),

                    Text(
                      "PSR : ${data.quantPsr}",
                      style: TextStyle(
                          fontFamily: "NanumSquare",
                          color: Colors.white,
                          fontSize: 14
                      ),
                    ),

                  ],
                ),

              ],
            ),
          ),

          Visibility(
            visible: true,
            child: Container(
                width: 40,
                child: Center(
                  child: IconButton(
                    icon: Icon(Icons.paste),
                    color: Colors.white,
                    onPressed: () {
                      if (onTooltipTapped != null){
                        onTooltipTapped();
                      }
                    },
                  ),
                )
            ),
          )

        ],
      ),
    ),
  );
}

Widget ListItemForSuperValueMomentum(
    int index,
    SuperValueMomentumQuantModel data,
    {Function? onItemTapped = null,
      bool? visibleTooltip = false,
      Function? onTooltipTapped = null})
{
  return GestureDetector(
    onTap: (){
      if (onItemTapped != null) {
        onItemTapped();
      }
    },
    child: Container(
      width: Get.width,
      height: 120,
      decoration: BoxDecoration(
          color: Colors.yellow,
          borderRadius: BorderRadius.all(Radius.circular(8)),
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [
              Color.fromARGB(255, 45, 115, 231),
              Color.fromARGB(255, 71, 188, 238),
            ],
          )
      ),
      padding: EdgeInsets.all(16),
      margin: EdgeInsets.only(top: 8, bottom: 8),
      //color: Colors.red,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [

          Container(
            width: 20,
            margin: EdgeInsets.only(right: 16),
            child: Center(
              child: Text(
                "${index+1}",
                style: TextStyle(
                    fontFamily: "NanumSquareB",
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontSize: 16
                ),
              ),
            ),
          ),

          Expanded (
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: [

                Row(
                  children: [

                    Text(
                      "${data.quantJname}",
                      style: TextStyle(
                          fontFamily: "NanumSquareB",
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          fontSize: 20
                      ),
                    ),
                    //RiseFallStatusWidget(100)

                  ],
                ),

                SizedBox(height: 8),

                Text(
                  "기준일 : ${data.quantDate.year}/${data.quantDate.month}/${data.quantDate.day}",
                  style: TextStyle(
                      fontFamily: "NanumSquare",
                      color: Colors.white,
                      fontSize: 12
                  ),
                ),

                SizedBox(height: 8),

                Row(

                  children: [

                    Text(
                      "PER : ${data.quantPer}",
                      style: TextStyle(
                          fontFamily: "NanumSquare",
                          color: Colors.white,
                          fontSize: 14
                      ),
                    ),

                    SizedBox(width: 16),

                    Text(
                      "PBR : ${data.quantPbr}",
                      style: TextStyle(
                          fontFamily: "NanumSquare",
                          color: Colors.white,
                          fontSize: 14
                      ),
                    ),

                  ],
                ),

                Row(
                  children: [
                    Text(
                      "PCR : ${data.quantPcr}",
                      style: TextStyle(
                          fontFamily: "NanumSquare",
                          color: Colors.white,
                          fontSize: 14
                      ),
                    ),

                    SizedBox(width: 16),

                    Text(
                      "GP/A : ${data.quantGpa}",
                      style: TextStyle(
                          fontFamily: "NanumSquare",
                          color: Colors.white,
                          fontSize: 14
                      ),
                    ),

                  ],
                ),

              ],
            ),
          ),

          Visibility(
            visible: true,
            child: Container(
                width: 40,
                child: Center(
                  child: IconButton(
                    icon: Icon(Icons.paste),
                    color: Colors.white,
                    onPressed: () {
                      if (onTooltipTapped != null){
                        onTooltipTapped();
                      }
                    },
                  ),
                )
            ),
          )

        ],
      ),
    ),
  );
}

Widget ListItemForMagicFormula(
    int index,
    MagicFormulaQuantModel data,
    {Function? onItemTapped = null,
      bool? visibleTooltip = false,
      Function? onTooltipTapped = null})
{
  return GestureDetector(
    onTap: (){
      if (onItemTapped != null) {
        onItemTapped();
      }
    },
    child: Container(
      width: Get.width,
      height: 120,
      decoration: BoxDecoration(
          color: Colors.yellow,
          borderRadius: BorderRadius.all(Radius.circular(8)),
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [
              Color.fromARGB(255, 45, 115, 231),
              Color.fromARGB(255, 71, 188, 238),
            ],
          )
      ),
      padding: EdgeInsets.all(16),
      margin: EdgeInsets.only(top: 8, bottom: 8),
      //color: Colors.red,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [

          Container(
            width: 20,
            margin: EdgeInsets.only(right: 16),
            child: Center(
              child: Text(
                "${index+1}",
                style: TextStyle(
                    fontFamily: "NanumSquareB",
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontSize: 16
                ),
              ),
            ),
          ),

          Expanded (
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: [

                Row(
                  children: [

                    Text(
                      "${data.quantJname}",
                      style: TextStyle(
                          fontFamily: "NanumSquareB",
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          fontSize: 20
                      ),
                    ),
                    //RiseFallStatusWidget(100)

                  ],
                ),

                SizedBox(height: 8),

                Text(
                  "기준일 : ${data.quantDate.year}/${data.quantDate.month}/${data.quantDate.day}",
                  style: TextStyle(
                      fontFamily: "NanumSquare",
                      color: Colors.white,
                      fontSize: 12
                  ),
                ),

                SizedBox(height: 8),

                Row(

                  children: [

                    Text(
                      "PBR : ${data.quantPbr}",
                      style: TextStyle(
                          fontFamily: "NanumSquare",
                          color: Colors.white,
                          fontSize: 14
                      ),
                    ),

                    SizedBox(width: 16),

                    Text(
                      "GP/A : ${data.quantGpa}",
                      style: TextStyle(
                          fontFamily: "NanumSquare",
                          color: Colors.white,
                          fontSize: 14
                      ),
                    ),

                  ],
                ),
              ],
            ),
          ),

          Visibility(
            visible: true,
            child: Container(
                width: 40,
                child: Center(
                  child: IconButton(
                    icon: Icon(Icons.paste),
                    color: Colors.white,
                    onPressed: () {
                      if (onTooltipTapped != null){
                        onTooltipTapped();
                      }
                    },
                  ),
                )
            ),
          )

        ],
      ),
    ),
  );
}



AppBar QuantLiveAppBar({String title = ""}){
  return AppBar(
    bottom: null,
    elevation: 0,
    backgroundColor: Color(0xfff9f9f9),
    title: Text(
      "${title}",
      style: TextStyle(
          color: Colors.black,
          fontFamily: "NanumSquareB",
          fontWeight: FontWeight.bold,
          fontSize: 20
      ),
    ),
    leading: Container(
      margin: EdgeInsets.only(left: 16),
      child: BackButton(
        color: Colors.black,
      ),
    ),
  );
}

void showNaverStockInfoBottomSheet(String stockCode){
  Get.bottomSheet(
      ListView(
        physics: BouncingScrollPhysics(),
        children: [
          Container(
            height: Get.height * 0.5,
            child: ConstrainedBox(
              constraints: BoxConstraints(maxHeight: 10000),
              child: WebView(
                gestureRecognizers: Set()
                  ..add(
                    Factory<VerticalDragGestureRecognizer>(
                          () => VerticalDragGestureRecognizer(),
                    ), // or null
                  ),
                initialUrl: "https://m.stock.naver.com/item/main.nhn#/stocks/${stockCode}/total",
                javascriptMode: JavascriptMode.unrestricted,
              ),
            ),
          )

        ],
      ),

      elevation: 20.0,
      enableDrag: true,
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(8.0),
            topRight: Radius.circular(8.0),
          )
      )
  );
}

Widget InvestmentCautionWidget(){
  return Container(
    margin: EdgeInsets.only(top: 16),
    width: Get.width,
    alignment: Alignment.center,
    child: Text(
      "모든 투자에 대한 책임은 투자자 본인에게 있습니다.",
      style: TextStyle(
          fontFamily: "NanumSquareB",
          fontWeight: FontWeight.bold,
          fontSize: 12,
          color: Colors.grey
      ),
    ),
  );
}