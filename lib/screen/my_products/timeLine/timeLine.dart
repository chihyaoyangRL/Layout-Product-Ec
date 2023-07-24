import 'package:get/get.dart';
import 'details/detailsPedido.dart';
import 'package:flutter/material.dart';
import 'package:prod_ec/utlis/constant.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:prod_ec/screen/my_products/timeLine/timeLineController.dart';

///Global value
const _airPlaneSize = 30.0;
const _dotSize = 15.0;
const _cardAnimationDuration = 100;

class TimeLine extends StatefulWidget {
  final int index;

  const TimeLine({Key? key, required this.index}) : super(key: key);

  @override
  _TimeLineState createState() => _TimeLineState();
}

class _TimeLineState extends State<TimeLine> {
  final TimeLineController controller = Get.put(TimeLineController());

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance!.addPostFrameCallback((timeStamp) => initAnimation());
  }

  void initAnimation() async {
    controller.animated.value = !controller.animated.value;
    await Future.delayed(Duration(milliseconds: 1200));
    controller.animatedCards.value = true;
    await Future.delayed(Duration(milliseconds: 500));
    controller.animatedButton.value = true;
  }

  @override
  void dispose() {
    super.dispose();
    controller.resetState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TweenAnimationBuilder<double>(
          tween: Tween(begin: 1.0, end: 0.0),
          duration: Duration(milliseconds: 1000),
          child: SizedBox(
            height: 40,
            child: Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text('Item ${widget.index}', style: TextStyle(fontSize: 20), overflow: TextOverflow.ellipsis),
              ),
            ),
          ),
          builder: (context, value, child) => Transform.translate(offset: Offset(0.0, Get.height * value), child: child),
        ),
        Expanded(
          child: LayoutBuilder(builder: (context, constraints) {
            final centerDot = constraints.maxWidth / 2 - _dotSize / 2;
            return Obx(() => Stack(
                  children: [
                    AnimatedPositioned(
                      duration: Duration(milliseconds: 400),
                      left: constraints.maxWidth / 2 - _airPlaneSize / 2,
                      top: controller.animated.value ? 20 : constraints.maxHeight - _airPlaneSize - 10,
                      bottom: 0.0,
                      child: SizedBox(
                        width: _airPlaneSize,
                        child: Column(
                          children: [
                            Icon(FontAwesomeIcons.truck, color: primaryColor, size: _airPlaneSize),
                            Expanded(child: Container(width: 5, color: Colors.grey[300])),
                          ],
                        ),
                      ),
                    ),
                    AnimatedPositioned(
                      duration: Duration(milliseconds: 600),
                      left: centerDot,
                      top: controller.animated.value ? 110 : constraints.maxHeight,
                      child: TimeLineDot(
                        delay: const Duration(milliseconds: _cardAnimationDuration),
                        title: '08:00 ~ 10:00',
                        selected: true,
                        displaycard: controller.animatedCards.value,
                      ),
                    ),
                    AnimatedPositioned(
                      duration: Duration(milliseconds: 800),
                      right: centerDot,
                      top: controller.animated.value ? 200 : constraints.maxHeight,
                      child: TimeLineDot(
                        left: true,
                        title: '10:00 ~ 12:00',
                        selected: true,
                        displaycard: controller.animatedCards.value,
                        delay: const Duration(milliseconds: _cardAnimationDuration * 2),
                      ),
                    ),
                    AnimatedPositioned(
                      duration: Duration(milliseconds: 1000),
                      left: centerDot,
                      top: controller.animated.value ? 290 : constraints.maxHeight,
                      child: TimeLineDot(
                        selected: true,
                        title: '12:00 ~ 14:00',
                        delay: const Duration(milliseconds: _cardAnimationDuration * 3),
                        displaycard: controller.animatedCards.value,
                      ),
                    ),
                    AnimatedPositioned(
                      duration: Duration(milliseconds: 1200),
                      right: centerDot,
                      top: controller.animated.value ? 420 : constraints.maxHeight,
                      child: TimeLineDot(
                        title: '14:00 ~ 17:00',
                        delay: const Duration(milliseconds: _cardAnimationDuration * 4),
                        left: true,
                        displaycard: controller.animatedCards.value,
                      ),
                    ),
                    if (controller.animatedButton.value)
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: TweenAnimationBuilder<double>(
                          tween: Tween(begin: 0.0, end: 1.0),
                          duration: Duration(milliseconds: 500),
                          builder: (context, value, child) => Transform.scale(scale: value, child: child),
                          child: FloatingActionButton(
                            onPressed: () => Navigator.of(context).push(PageRouteBuilder(pageBuilder: (_, animation1, __) => FadeTransition(opacity: animation1, child: DetailsPedido()))),
                            backgroundColor: primaryColor,
                            child: Icon(Icons.home, size: 35),
                          ),
                        ),
                      ),
                  ],
                ));
          }),
        ),
      ],
    );
  }
}

///進度條的圓圈
class TimeLineDot extends StatefulWidget {
  final bool selected, displaycard, left;
  final String title;
  final Duration delay;

  const TimeLineDot({Key? key, this.selected = false, required this.title, this.displaycard = false, this.left = false, required this.delay}) : super(key: key);

  @override
  _TimeLineDotState createState() => _TimeLineDotState();
}

class _TimeLineDotState extends State<TimeLineDot> {
  bool animated = false;

  void _animatedWithDelay() async {
    if (widget.displaycard) {
      await Future.delayed(widget.delay);
      setState(() => animated = true);
    }
  }

  ///Quando houver qualquer alteração de widget chama este function
  @override
  void didUpdateWidget(covariant TimeLineDot oldWidget) {
    super.didUpdateWidget(oldWidget);
    _animatedWithDelay();
  }

  Widget _buidCard() => TweenAnimationBuilder<double>(
        tween: Tween(begin: 0.0, end: 1.0),
        duration: Duration(milliseconds: _cardAnimationDuration),
        child: Container(
          width: Get.width / 2.5,
          color: Colors.grey[200],
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Text(widget.title, overflow: TextOverflow.ellipsis),
          ),
        ),
        builder: (context, value, child) => Transform.scale(alignment: widget.left ? Alignment.centerRight : Alignment.centerLeft, scale: value, child: child),
      );

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        if (animated && widget.left) ...[
          _buidCard(),
          Container(width: 10, height: 1, color: Colors.grey[400]),
        ],
        Container(
          width: _dotSize,
          height: _dotSize,
          decoration: BoxDecoration(border: Border.all(color: Colors.grey), shape: BoxShape.circle, color: Colors.white),
          child: Padding(
            padding: const EdgeInsets.all(3.0),
            child: CircleAvatar(backgroundColor: widget.selected ? Colors.green : Colors.red),
          ),
        ),
        if (animated && !widget.left) ...[Container(width: 10, height: 1, color: Colors.grey[400]), _buidCard()]
      ],
    );
  }
}