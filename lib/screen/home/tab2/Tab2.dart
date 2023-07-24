import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:prod_ec/utlis/constant.dart';
import 'package:prod_ec/screen/home/tab2/Tab2Controller.dart';

class Tab2 extends StatefulWidget {
  const Tab2({Key? key}) : super(key: key);

  @override
  _Tab2State createState() => _Tab2State();
}

class _Tab2State extends State<Tab2> {
  final Tab2Controller controller = Get.put(Tab2Controller());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryColor,
        title: Text('category'.tr),
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
            children: List.generate(21, (index) {
              return Stack(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: SizedBox(
                      width: Get.width,
                      height: Get.height,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(8.0),
                        child: Image.network(
                          'https://emojipedia-us.s3.amazonaws.com/source/skype/289/books_1f4da.png',
                          fit: BoxFit.cover,
                          color: Colors.black.withOpacity(0.6),
                          colorBlendMode: BlendMode.hardLight,
                        ),
                      ),
                    ),
                  ),
                  Align(child: Text('Item $index', style: TextStyle(color: Colors.white)))
                ],
              );
            }),
          )),
    );
  }
}