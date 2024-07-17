import 'package:get/get.dart';

class GiveController extends GetxController {
  RxBool isTrue = false.obs;
  void onTap() => isTrue(!isTrue.value);
}
