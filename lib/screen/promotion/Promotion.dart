import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:prod_ec/utlis/constant.dart';
import 'package:prod_ec/screen/promotion/PromotionController.dart';

class Promotion extends StatefulWidget {
  const Promotion({Key? key}) : super(key: key);

  @override
  _PromotionState createState() => _PromotionState();
}

class _PromotionState extends State<Promotion> {
  final PromotionController controller = Get.put(PromotionController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryColor,
        title: Text('week_promotion'.tr),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () => controller.change(),
            icon: Icon(Icons.filter_list_outlined, color: Colors.white),
          )
        ],
      ),
      body: Obx(() => GridView(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: (controller.stateGri.value ? 2 : 1), mainAxisSpacing: 0, crossAxisSpacing: 0),
            children: List.generate(101, (index) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Stack(
                  children: [
                    Container(
                      width: Get.width,
                      decoration: BoxDecoration(color: Color(0xff7da5f5), borderRadius: BorderRadius.circular(16)),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Flexible(child: FittedBox(child: Text('Title', style: TextStyle(color: Colors.white)))),
                          Flexible(child: FittedBox(child: Text('Subtitle', style: TextStyle(color: Colors.white)))),
                        ],
                      ),
                    ),
                    Positioned(
                      right: 0,
                      top: 0,
                      child: Container(
                        decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.only(topLeft: Radius.circular(8), topRight: Radius.circular(16), bottomLeft: Radius.circular(8), bottomRight: Radius.circular(8))),
                        width: 32,
                        height: 32,
                        child: Center(child: Text('10%')),
                      ),
                    )
                  ],
                ),
              );
            }),
          )),
    );
  }
}