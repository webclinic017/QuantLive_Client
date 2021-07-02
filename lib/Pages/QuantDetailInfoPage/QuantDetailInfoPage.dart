import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quantlive_client/Common/Defines.dart';
import 'package:quantlive_client/Common/Widgets.dart';
import 'package:quantlive_client/Pages/QuantDetailInfoPage/QuantDetailInfoPageViewModel.dart';

class QuantDetailInfoPage extends StatefulWidget {
  const QuantDetailInfoPage({Key? key}) : super(key: key);

  @override
  _QuantDetailInfoPageState createState() => _QuantDetailInfoPageState();
}

class _QuantDetailInfoPageState extends State<QuantDetailInfoPage> {

  QuantDetailInfoPageViewModel viewModel = QuantDetailInfoPageViewModel();
  QuantType? quantType;
  bool isLoading = false;

  @override
  void initState() {
    this.quantType = Get.arguments as QuantType;
    super.initState();

    loadQuantContents();

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [

          SafeArea(
              child: Container(
                  margin: EdgeInsets.all(24),
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

                      getItemList()

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
          itemCount: 50,
          itemBuilder: (BuildContext context, int index) {
            return quantListItem("${index}", "${index}");
          },
        ),
      ),
    );
  }

  Widget DimView(){
    return Visibility(
      visible: this.isLoading,
      child: GestureDetector(
        onTap: (){
          setState(() {
            this.isLoading = false;
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
        this.isLoading = true;
      });

      var items = await viewModel.fetchQuantItems(this.quantType!);
      print("items : ${items}");

      setState(() {
        this.isLoading = false;
      });
    }
  }

}
