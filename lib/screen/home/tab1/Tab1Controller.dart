import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:prod_ec/base/api.dart';
import 'package:prod_ec/utlis/Functions.dart';
import 'package:prod_ec/model/Posts_model.dart';

class Tab1Controller extends GetxController {
  Functions fun = Functions();
  final searchController = TextEditingController().obs;
  final posts = Future.value([]).obs;
  RxList resultError = [].obs;

  getPosts() async {
    Api api = Api();
    api.getPosts().then((result) {
      posts.value = fun.convertFutureList((result['result']).map((itemWord) => Posts.fromJson(itemWord)).toList());
      resultError.add({'error': result['error'], 'message': result['message']});
    });
  }
}