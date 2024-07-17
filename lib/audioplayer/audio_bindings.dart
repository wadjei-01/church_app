import 'package:get/get.dart';
import 'package:gtp_app/audioplayer/audio_controller.dart';

class AudioBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AudioController>(() => AudioController());
  }
}
