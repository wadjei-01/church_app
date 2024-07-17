import 'package:get/get.dart';
import 'package:gtp_app/prayer_request/prayer_request_controller.dart';

class PrayerRequestBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PrayerRequestController>(() => PrayerRequestController());
  }
}
