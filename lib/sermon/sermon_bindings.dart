import 'package:get/get.dart';

import 'package:gtp_app/sermon/sermon_controller.dart';

class SermonBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<SermonController>(SermonController());
  }
}
