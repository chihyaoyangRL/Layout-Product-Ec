import 'tab2/Tab2.dart';
import 'tab3/Tab3.dart';
import 'homeController.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:prod_ec/utlis/constant.dart';
import 'package:prod_ec/screen/home/tab1/Tab1.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final HomeController controller = Get.put(HomeController());

  List<Widget> pages() => [Tab1(), Tab2(), Tab3()];

  @override
  void dispose() {
    super.dispose();
    controller.selectedIndex.value = 0;
  }

  @override
  Widget build(BuildContext context) {
    final List<Widget> page = pages();
    return Scaffold(
      body: Obx(() => page[controller.selectedIndex.value]),
      bottomNavigationBar: Obx(() => BottomNavigationBar(
        backgroundColor: primaryColor,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'home'.tr),
          BottomNavigationBarItem(icon: Icon(Icons.category), label: 'category'.tr),
          BottomNavigationBarItem(icon: Icon(Icons.account_box_rounded), label: 'account'.tr),
        ],
        currentIndex: controller.selectedIndex.value,
        selectedItemColor: Color(0xffdcf317),
        selectedIconTheme: IconThemeData(color: Color(0xffdcf317)),
        unselectedItemColor: Colors.white,
        onTap: (value) => controller.onItemTapped(value),
      )),
    );
  }
}