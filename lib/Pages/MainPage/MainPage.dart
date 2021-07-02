import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

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

              quantListItem("강환국 슈퍼가치전략", "PBR, PER 등을 통한 가치투자 전략입니다."),

              quantListItem("강환국 슈퍼가치전략", "PBR, PER 등을 통한 가치투자 전략입니다."),

              quantListItem("강환국 슈퍼가치전략", "PBR, PER 등을 통한 가치투자 전략입니다."),

              quantListItem("강환국 슈퍼가치전략", "PBR, PER 등을 통한 가치투자 전략입니다."),

            ],
          ),
        ),
      ),
    );
  }
}

Widget quantListItem(String title, String content){
  return Container(
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
              "강환국 슈퍼가치전략",
              style: TextStyle(
                  fontFamily: "NanumSquareB",
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  fontSize: 20
              ),
            ),

            SizedBox(height: 4),

            Text(
              "PER, PBR 등을 통한 가치투자 전략입니다.",
              style: TextStyle(
                  fontFamily: "NanumSquare",
                  color: Colors.white,
                  fontSize: 14
              ),
            ),

          ],
        ),

        Container(
          width: 40,
          child: Center(
            child: IconButton(
              icon: Icon(Icons.info_outline),
              color: Colors.white,
              onPressed: () {
                print("Hello!");
              },
            ),
          )
        )

      ],
    ),
  );
}

