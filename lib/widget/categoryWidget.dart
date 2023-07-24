import 'package:get/get.dart';
import 'package:flutter/material.dart';

class CustomCategoryWidget extends StatelessWidget {
  final String imagePath, title;

  const CustomCategoryWidget({Key? key, required this.imagePath, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          width: Get.width,
          height: Get.height,
          child: Image.network(
            imagePath,
            fit: BoxFit.cover,
            color: Colors.black.withOpacity(0.6),
            colorBlendMode: BlendMode.hardLight,
          ),
        ),
        Align(
          child: Text(title, style: TextStyle(color: Colors.white)),
        )
      ],
    );
  }
}