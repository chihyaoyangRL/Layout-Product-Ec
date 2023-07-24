import 'package:get/get.dart';
import 'package:flutter/material.dart';

class ListCompra extends StatelessWidget {
  final int index;

  const ListCompra({Key? key, required this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder<double>(
      tween: Tween(begin: 1.0, end: 0.0),
      duration: Duration(milliseconds: 800),
      curve: Curves.decelerate,
      builder: (_, value, child) => Transform.translate(offset: Offset(0.0, Get.height * value), child: child),
      child: Card(
        elevation: 10,
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Row(
            children: [
              Expanded(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text('Number: $index'),
                    Text('Price: \$95132'),
                  ],
                ),
              ),
              Expanded(child: Icon(Icons.shopping_cart_outlined)),
            ],
          ),
        ),
      ),
    );
  }
}