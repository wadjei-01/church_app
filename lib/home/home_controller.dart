import 'package:get/get.dart';
import 'package:gtp_app/events/events_model.dart';
import 'package:gtp_app/videoplayer/videomodel.dart';

class HomeController extends GetxController {
  Future<List<Event>>? data;

  @override
  void onInit() {
    fetchEventData();
    super.onInit();
  }

  Future<void> fetchEventData() async {
    data = MockData.fetchEventData();
  }

  RxBool switchBoolean(bool isBookmarked) {
    RxBool boolean = (!isBookmarked).obs;
    print(isBookmarked);
    update();
    return boolean;
  }
}
