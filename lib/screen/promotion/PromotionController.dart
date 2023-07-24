import 'package:get/get.dart';

class PromotionController extends GetxController {
  RxBool stateGri = true.obs;

  change() => stateGri.value = !stateGri.value;
}