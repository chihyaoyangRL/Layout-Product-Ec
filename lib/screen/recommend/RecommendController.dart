import 'package:get/get.dart';

class RecommendController extends GetxController {
  RxBool stateGri = true.obs;

  change() => stateGri.value = !stateGri.value;
}