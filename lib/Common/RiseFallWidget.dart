import 'package:flutter/material.dart';

Widget RiseFallStatusWidget(int value){
  return Container(
      margin: EdgeInsets.only(left: 8),
      child: Row(
        children: [
          getRiseFallStatusIcon(value),
          getRiseFallValueText(value)
        ],
      )
  );
}

Widget getRiseFallStatusIcon(int value){
  if (value > 0) {
    return Icon(
      Icons.keyboard_arrow_up_outlined,
      color: Colors.redAccent,
    );
  }else if (value == 0){
    return Icon(
      Icons.keyboard_arrow_up_outlined,
      color: Colors.grey,
    );
  }else{
    return Icon(
      Icons.keyboard_arrow_down_outlined,
      color: Colors.blueAccent,
    );
  }
}

Widget getRiseFallValueText(int value){
  if (value > 0) {
    return Text(
      "${value}",
      style: TextStyle(
          color: Colors.redAccent,
          fontFamily: "NanumSquareB",
          fontWeight: FontWeight.bold,
          fontSize: 16
      ),
    );
  }else if (value == 0){
    return Text(
      "${value}",
      style: TextStyle(
          color: Colors.grey,
          fontFamily: "NanumSquareB",
          fontWeight: FontWeight.bold,
          fontSize: 16
      ),
    );
  }else{
    return Text(
      "${value}",
      style: TextStyle(
          color: Colors.blue,
          fontFamily: "NanumSquareB",
          fontWeight: FontWeight.bold,
          fontSize: 16
      ),
    );
  }
}
