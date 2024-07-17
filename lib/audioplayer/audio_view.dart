import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:gtp_app/audioplayer/audio_controller.dart';
import 'package:gtp_app/theme/appcolors.dart';
import 'package:gtp_app/theme/fontsfamily.dart';
import 'package:gtp_app/widgets/widgets.dart';

class AudioView extends GetView<AudioController> {
  const AudioView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Stack(
        fit: StackFit.expand,
        children: [
          Positioned(
            top: 0,
            child: Container(
              height: 0.75.sh,
              width: 1.sw,
              child: Image.asset(
                controller.audio.img,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Positioned(
              left: 0,
              top: 0,
              child: getBack(
                  onTap: () => Get.back(), margin: EdgeInsets.all(40.r))),
          Positioned(
            bottom: 0,
            child: Container(
              height: 0.4.sh,
              width: 1.sw,
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: FractionalOffset.topCenter,
                      end: FractionalOffset.bottomCenter,
                      colors: [
                    Colors.black.withOpacity(0.0),
                    Colors.black.withOpacity(0.9),
                    Colors.black,
                    Colors.black
                  ],
                      stops: [
                    0.0,
                    0.3,
                    0.5,
                    1.0
                  ])),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 40.w),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: 0.15.sh,
                      ),
                      Text(
                        controller.audio.title,
                        maxLines: 1,
                        style: Fonts.getBoldStyle(
                            fontSize: 60.sp, color: Colors.white),
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      Text(
                        controller.audio.description,
                        style: Fonts.getMediumStyle(
                            fontSize: 50.sp,
                            color: AppColors.lighten(AppColors.darkGrey, 0.3)),
                      )
                    ]),
              ),
            ),
          )
        ],
      ),
    ));
  }
}
