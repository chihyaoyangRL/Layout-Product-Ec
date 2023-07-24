import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:prod_ec/utlis/constant.dart';
import 'package:prod_ec/widget/TabButtons.dart';
import 'package:prod_ec/widget/ListaCompra.dart';
import 'package:prod_ec/widget/CarrinhoCompra.dart';
import 'package:prod_ec/screen/my_products/timeLine/timeLine.dart';
import 'package:prod_ec/screen/my_products/MyProductController.dart';

class MyProduct extends StatefulWidget {
  const MyProduct({Key? key}) : super(key: key);

  @override
  _MyProductState createState() => _MyProductState();
}

enum listState { list, timeline }

class _MyProductState extends State<MyProduct> {
  final MyProductController controller = Get.put(MyProductController());
  listState listS = listState.list;

  void _onStart(int index) {
    controller.selectIndex.value = index;
    setState(() => listS = listState.timeline);
  }

  void _onReset() => setState(() => listS = listState.list);

  void _onBack() {
    if (listS == listState.timeline) {
      _onReset();
    } else {
      Get.back();
    }
  }

  Future<bool> _willPopCallback() async {
    _onBack();
    return Future.value(false);
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _willPopCallback,
      child: Scaffold(
        body: Stack(
          fit: StackFit.expand,
          children: [
            Positioned(
              height: Get.height * 0.32,
              left: 0,
              right: 0,
              child: SizedBox(
                height: Get.height * 0.32,
                width: Get.width,
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(begin: Alignment.topCenter, end: Alignment.bottomCenter, colors: [primaryColor, Colors.greenAccent]),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 15.0, right: 15.0, bottom: 15.0, top: 50.0),
                    child: Column(
                      children: [
                        Text('my_pedido'.tr, style: TextStyle(color: Colors.white, fontSize: 25), textAlign: TextAlign.center),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              left: 10,
              right: 10,
              top: (Get.height * 0.2) / 1.5,
              bottom: 0,
              child: Card(
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: InkWell(
                            onTap: () {
                              controller.tabButton1.value = true;
                              controller.tabButton2.value = false;
                            },
                            child: Obx(
                              () => TabButton(title: listS == listState.list ? 'sp_car'.tr : 'line_time'.tr, selected: controller.tabButton1.value),
                            ),
                          ),
                        ),
                        Expanded(
                          child: InkWell(
                            onTap: () {
                              controller.tabButton1.value = false;
                              controller.tabButton2.value = true;
                            },
                            child: Obx(
                              () => TabButton(title: 'sp_list'.tr, selected: controller.tabButton2.value),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 10),
                    Expanded(
                      child: Obx(() => (controller.tabButton1.value)
                            ? listS == listState.list
                                ? ListView.builder(
                                    itemCount: 20,
                                    itemBuilder: (context, index) => CarrinhoCompra(onTap: () => _onStart(index), index: index),
                                  )
                                : TimeLine(index: controller.selectIndex.value)
                            : ListView.builder(
                                itemCount: 20,
                                itemBuilder: (context, index) => ListCompra(index: index),
                              ),
                      ),
                    )
                  ],
                ),
              ),
            ),
            Positioned(
              top: 40,
              child: BackButton(color: Colors.white, onPressed: _onBack),
            ),
          ],
        ),
      ),
    );
  }
}