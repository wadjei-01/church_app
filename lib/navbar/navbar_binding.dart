import 'package:get/get.dart';
import 'package:gtp_app/home/home_controller.dart';
import 'package:gtp_app/navbar/navbar_controller.dart';
import 'package:gtp_app/sermon/sermon_controller.dart';

class NavBarBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<NavBarController>(() => NavBarController());
    Get.lazyPut<HomeController>(() => HomeController());
    Get.put<SermonController>(SermonController());
  }
}
