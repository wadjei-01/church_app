import 'package:get/get.dart';
import 'package:gtp_app/videoplayer/comment.dart';
import 'package:gtp_app/videoplayer/videomodel.dart';

class VideoPlayerController extends GetxController {
  late Video selectedVideo = Get.arguments;
  Future<List<Video>>? videoData;

  @override
  void onInit() {
    delayData();
    super.onInit();
  }

  Future<List<Comment>> commentsList() async {
    return selectedVideo.commentsList;
  }

  Future<void> delayData() async {
    Future.delayed(const Duration(seconds: 2), () {
      videoData = MockData.fetchVideoData();
      update();
    });
  }
}
