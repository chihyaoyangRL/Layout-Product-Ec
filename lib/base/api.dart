import 'dart:io';
import 'dart:async';
import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:prod_ec/utlis/constant.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';

class Api {
  Future getHeaders() async {
    Map<String, String> headers = {'Content-Type': 'application/json', 'Accept': 'application/json', 'locale': Get.deviceLocale.toString()};
    return headers;
  }

  Future getHeadersToken() async {
    SharedPreferences shp = await SharedPreferences.getInstance();
    Map<String, String> headers = {'Content-Type': 'application/json', 'Accept': 'application/json', 'locale': Get.deviceLocale.toString(), 'token': shp.getString('token') ?? 'null'};
    return headers;
  }

  Future login(data) async {
    try {
      http.Response response = await http.post(Uri.parse(BASE_URL + "auth"), body: jsonEncode(data), headers: await getHeaders()).timeout(Duration(seconds: timeout));
      if (response.statusCode == 200 || response.statusCode == 201) {
        return jsonDecode(response.body);
      } else {
        return jsonDecode(response.body);
      }
    } on TimeoutException {
      return {"error": true, "message": "timeout_408".tr, "result": []};
    } on SocketException {
      return {"error": true, "message": "connectionFailed".tr, "result": []};
    }
  }

  Future store(data) async {
    try {
      http.Response response = await http.post(Uri.parse(BASE_URL + "auth/store"), body: jsonEncode(data), headers: await getHeaders()).timeout(Duration(seconds: timeout));
      if (response.statusCode == 200 || response.statusCode == 201) {
        return jsonDecode(response.body);
      } else {
        return jsonDecode(response.body);
      }
    } on TimeoutException {
      return {"error": true, "message": "timeout_408".tr, "result": []};
    } on SocketException {
      return {"error": true, "message": "connectionFailed".tr, "result": []};
    }
  }

  Future getPosts() async {
    try {
      http.Response response = await http.get(Uri.parse(BASE_URL + "posts"), headers: await getHeadersToken()).timeout(Duration(seconds: timeout));
      if (response.statusCode == 200 || response.statusCode == 201) {
        return jsonDecode(response.body);
      } else {
        return jsonDecode(response.body);
      }
    } on TimeoutException {
      return {"error": true, "message": "timeout_408".tr, "result": []};
    } on SocketException {
      return {"error": true, "message": "connectionFailed".tr, "result": []};
    }
  }
}