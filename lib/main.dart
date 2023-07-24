import 'package:get/get.dart';
import 'screen/auth/Auth.dart';
import 'screen/home/home.dart';
import 'package:flutter/material.dart';
import 'translations/translations.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Prod-Ec',
      debugShowCheckedModeBanner: false,
      home: FutureBuilder<bool>(
        future: checkSession(),
        builder: (BuildContext context, AsyncSnapshot<bool> snapshot) => (snapshot.data == true) ? Home() : Auth(),
      ),
      translations: Translation(),
      locale: Get.deviceLocale,
      fallbackLocale: Get.deviceLocale,
    );
  }

  Future<bool> checkSession() async {
    SharedPreferences shp = await SharedPreferences.getInstance();
    if (shp.getInt('session') != null) {
      return true;
    } else {
      return false;
    }
  }
}