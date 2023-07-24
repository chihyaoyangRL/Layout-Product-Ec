import 'package:flutter/material.dart';
import 'package:prod_ec/utlis/constant.dart';

class CustomIconButton extends StatelessWidget {
  final String title;
  final IconData icon;
  final VoidCallback onPressed;

  const CustomIconButton({Key? key, required this.title, required this.icon, required this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: primaryColor, borderRadius: BorderRadius.all(Radius.circular(15))),
      child: TextButton(
        onPressed: onPressed,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, color: Colors.white),
            Flexible(child: Text(title, style: TextStyle(color: Colors.white))),
          ],
        ),
      ),
    );
  }
}