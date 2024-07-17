// import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:gtp_app/audioplayer/audiomodel.dart';
import 'package:gtp_app/videoplayer/videomodel.dart';

class SermonController extends GetxController {
  List<String> tabList = ['Videos', 'Podcast'];
  Future<List<Video>>? videoData;
  Future<List<Audio>>? audioData;

  RxInt currentIndex = 0.obs;

  void onTabChanged(int index) {
    currentIndex(index);
    switchFetchedData();
    update();
  }

  @override
  void onInit() {
    switchFetchedData();
    super.onInit();
  }

  void switchFetchedData() {
    if (currentIndex.value == 0) {
      delayVideoData();
    }
    if (currentIndex.value == 1) {
      delayAudioData();
    }
  }

  Future<void> delayVideoData() async {
    Future.delayed(Duration(seconds: 4), () {
      videoData = MockData.fetchVideoData();
      update();
    });
  }

  Future<void> delayAudioData() async {
    Future.delayed(Duration(seconds: 4), () {
      audioData = MockData.fetchAudioData();
      update();
    });
  }
}
