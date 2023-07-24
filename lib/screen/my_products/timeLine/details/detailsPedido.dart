import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:prod_ec/utlis/constant.dart';

class DetailsPedido extends StatelessWidget {
  const DetailsPedido({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            height: Get.height * 0.25,
            child: Container(
              child: DecoratedBox(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [primaryColor, Colors.greenAccent],
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            top: 55,
            left: 10,
            child: BackButton(color: Colors.white),
          ),
          Positioned(
            left: 10,
            right: 10,
            top: Get.height * 0.15,
            child: Column(
              children: [
                RouteItem(duration: Duration(milliseconds: 400)),
                RouteItem(duration: Duration(milliseconds: 600)),
                RouteItem(duration: Duration(milliseconds: 800)),
                RouteItem(duration: Duration(milliseconds: 1000)),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class RouteItem extends StatelessWidget {
  final Duration duration;

  const RouteItem({Key? key, required this.duration}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder<double>(
      tween: Tween(begin: 1.0, end: 0.0),
      duration: duration,
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
                    Text('dsadsa'),
                    Text('dsadsa'),
                  ],
                ),
              ),
              Expanded(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.add),
                    Text('dsadsa'),
                  ],
                ),
              ),
              Expanded(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text('dsadsa'),
                    Text('dsadsa'),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}