import 'package:get/get.dart';

class TimeLineController extends GetxController {
  RxBool animated = false.obs;
  RxBool animatedCards = false.obs;
  RxBool animatedButton = false.obs;

  void resetState() {
    animated.value = false;
    animatedCards.value = false;
    animatedButton.value = false;
  }
}