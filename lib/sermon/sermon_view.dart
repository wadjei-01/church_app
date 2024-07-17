import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:gtp_app/sermon/sermon_controller.dart';
import 'package:gtp_app/widgets/widgets.dart';

class SermonView extends GetView<SermonController> {
  const SermonView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: getAppBar("Sermons", color: Colors.black),
        backgroundColor: Colors.black,
        body: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(0),
                  child: getTabs(controller),
                ),
                Container(
                  height: 40.h,
                  color: Colors.black,
                ),
                Expanded(
                  child: GetBuilder(
                      init: controller,
                      builder: (controller) {
                        if (controller.currentIndex.value == 0) {
                          return videoListView(controller);
                        } else {
                          return podcastListView(controller);
                        }
                      }),
                ),
                SizedBox(
                  height: 250.h,
                )
              ],
            ),
          ],
        ));
  }
}
