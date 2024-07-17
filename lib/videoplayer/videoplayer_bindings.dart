import 'package:get/get.dart';
import 'package:gtp_app/videoplayer/videoplayercontroller.dart';

class VideoPlayerBinding extends Bindings {
  @override
  void dependencies() {
    Get.create<VideoPlayerController>(() => VideoPlayerController(),
        permanent: true);
  }
}
