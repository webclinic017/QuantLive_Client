
import 'package:flutter/material.dart';
import 'package:get/get.dart';

Widget quantListItem(String title,
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
      height: 80,
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

              Text(
                "${content}",
                style: TextStyle(
                    fontFamily: "NanumSquare",
                    color: Colors.white,
                    fontSize: 14
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