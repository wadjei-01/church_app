import 'package:get/get.dart';
import 'package:gtp_app/give/give_controller.dart';

class GiveBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<GiveController>(() => GiveController());
  }
}
