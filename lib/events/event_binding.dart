import 'package:get/get.dart';
import 'package:gtp_app/events/event_controller.dart';

class EventBinding extends Bindings {
  @override
  void dependencies() {
    Get.create<EventController>(() => EventController());
  }
}
