import 'package:flutter/material.dart';
import 'package:get/get.dart';

class QuantDescriptionPage extends StatefulWidget {
  const QuantDescriptionPage({Key? key}) : super(key: key);

  @override
  _QuantDescriptionPageState createState() => _QuantDescriptionPageState();
}

class _QuantDescriptionPageState extends State<QuantDescriptionPage> {

  @override
  void initState() {
    print(Get.arguments);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: SafeArea(
        child: Container(
          margin: EdgeInsets.all(24),
          child: Text(
            "설명 페이지",
            style: TextStyle(
                fontFamily: "NanumSquareB",
                fontWeight: FontWeight.bold,
                fontSize: 24
            ),
          ),
        ),
      ),
    );
  }
}
