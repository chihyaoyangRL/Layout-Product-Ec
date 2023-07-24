import 'package:flutter/material.dart';

class Functions extends State {
  Future<List<dynamic>> convertFutureList(List datas) async => datas;

  String removeReturnErrorString(String message) => message.replaceAll(RegExp(r'[\[\]]'), '');

  @override
  Widget build(BuildContext context) => Container();
}