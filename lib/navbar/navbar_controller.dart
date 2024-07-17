import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:gtp_app/home/home_view.dart';
import 'package:gtp_app/sermon/sermon_view.dart';
import 'package:gtp_app/settings/settings_view.dart';

class NavBarController extends GetxController {
  List<Widget> pages = [
    const HomeView(),
    const SermonView(),
    const SettingsView(),
  ];

  final double navBarHeight = 260.h;
  RxDouble btm = 0.0.obs;

  RxBool isExpanded = false.obs;

  void onExpand(double percentage) {
    if (percentage > 0.5) {
      btm.value = -260.h;
    } else {
      btm.value = 0.h;
    }
  }

  RxInt currentPage = 0.obs;

  void changePageIndex(int index) {
    currentPage(index);
    update();
  }
}
