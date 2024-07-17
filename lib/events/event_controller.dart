import 'package:get/get.dart';
import 'package:gtp_app/events/events_model.dart';

class EventController extends GetxController {
  Event event = Get.arguments;

  RxBool isTextExtended = false.obs;

  void extendText() {
    isTextExtended(!isTextExtended.value);
    update();
  }
}
