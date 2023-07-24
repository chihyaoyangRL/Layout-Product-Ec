import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:prod_ec/base/api.dart';
import 'package:prod_ec/widget/Dialogs.dart';
import 'package:prod_ec/utlis/Functions.dart';
import 'package:prod_ec/screen/home/home.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthController extends GetxController {
  Rx<TextEditingController> usuarioController = TextEditingController().obs;
  Rx<TextEditingController> senhaController = TextEditingController().obs;
  Functions fun = Functions();
  Dialogs dialog = Dialogs();

  login() {
    Api api = Api();
    var parametro = {'email': usuarioController.value.text, 'password': senhaController.value.text};
    api.login(parametro).then((result) async {
      if (result['error'] == true) {
        dialog.showSnackBar(result['message'], Icons.warning);
        return;
      }
      if (result['errors'] != null) { /// Validation forms
        List<String> error = [];
        result['errors'].forEach((key, value) => error.add('$value'));
        dialog.showSnackBar(fun.removeReturnErrorString(error.toString()), Icons.warning);
      } else {
        SharedPreferences shp = await SharedPreferences.getInstance();
        shp.setInt('session', 1);
        shp.setString('token', result['result']['name']);
        Get.offAll(() => Home());
        usuarioController.value.clear();
        senhaController.value.clear();
      }
    });
  }
}