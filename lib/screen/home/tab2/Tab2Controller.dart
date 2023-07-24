import 'package:get/get.dart';

class Tab2Controller extends GetxController {
  RxBool stateGri = true.obs;

  change() => stateGri.value = !stateGri.value;
}