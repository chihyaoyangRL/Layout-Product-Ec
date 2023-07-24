import 'package:flutter/material.dart';
import 'package:prod_ec/utlis/constant.dart';

class CustomTitleWidget extends StatelessWidget {
  final String title, subtitle;
  final VoidCallback onPressed;

  const CustomTitleWidget({Key? key, required this.title, required this.subtitle, required this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(title, style: TextStyle(fontSize: 21)),
            InkWell(onTap: onPressed, child: Text(subtitle, style: TextStyle(color: primaryColor, fontSize: 18))),
          ],
        ),
      ),
    );
  }
}