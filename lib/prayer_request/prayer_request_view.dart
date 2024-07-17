import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:gtp_app/prayer_request/prayer_request_controller.dart';
import 'package:gtp_app/theme/appcolors.dart';
import 'package:gtp_app/theme/fontsfamily.dart';
import 'package:gtp_app/widgets/widgets.dart';
import 'package:multi_dropdown/multiselect_dropdown.dart';

class PrayerRequestView extends GetView<PrayerRequestController> {
  const PrayerRequestView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: getAppBar("Prayer Request"),
        backgroundColor: Colors.black,
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 40.w),
          child: Column(
            children: [
              getLabeledTextField(
                  title: "Message",
                  hintText: "Type your message here",
                  maxLength: 150,
                  maxLines: 5,
                  height: 400.h,
                  keyboardType: TextInputType.multiline),
              SizedBox(
                height: 60.h,
              ),
            ],
          ),
        ),
        bottomNavigationBar: getContainer(
            splashColor: AppColors.red,
            onTap: controller.onTap,
            margin: EdgeInsets.all(60.r),
            height: 150.h,
            color: AppColors.red,
            child: Center(
                child: Text(
              'Proceed',
              style:
                  Fonts.getSemiBoldStyle(fontSize: 45.sp, color: Colors.white),
            )))
        // Container(
        //   margin: EdgeInsets.all(60.r),
        //   color: AppColors.innerContainer,
        //   height: 150.h,
        // ),
        );
  }
}
