import 'package:get/get.dart';

class PrayerRequestController extends GetxController {
  RxBool isTrue = false.obs;
  void onTap() => isTrue(!isTrue.value);
}
