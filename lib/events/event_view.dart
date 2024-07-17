import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:gtp_app/events/event_controller.dart';
import 'package:gtp_app/theme/appcolors.dart';
import 'package:gtp_app/widgets/widgets.dart';
import 'package:intl/intl.dart';
import '../theme/fontsfamily.dart';

class EventView extends GetView<EventController> {
  const EventView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      floatingActionButton: getBack(
          margin: EdgeInsets.symmetric(vertical: 40.h),
          onTap: () => Get.back()),
      floatingActionButtonLocation: FloatingActionButtonLocation.startTop,
      body: SafeArea(
        child: GetBuilder<EventController>(
            init: controller,
            builder: (controller) {
              return SingleChildScrollView(
                child: Column(children: [
                  Container(
                    clipBehavior: Clip.antiAlias,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30.r),
                        color: Colors.grey),
                    height: 0.45.sh,
                    width: 1.sw,
                    child: Stack(
                      fit: StackFit.expand,
                      children: [
                        Image.asset(
                          controller.event.img,
                          fit: BoxFit.fitHeight,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 30.h,
                  ),
                  Padding(
                      padding: EdgeInsets.symmetric(horizontal: 40.w),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            height: 300.h,
                            width: 1.sw,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30.r),
                              color: AppColors.darkGrey,
                            ),
                            padding: EdgeInsets.all(40.r),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(
                                        width: 650.w,
                                        child: Text(
                                          controller.event.title,
                                          style: Fonts.getMediumStyle(
                                              fontSize: 60.sp,
                                              color: Colors.white),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 20.h,
                                      ),
                                      Row(
                                        children: [
                                          Icon(
                                            Icons.access_time,
                                            color: AppColors.red,
                                            size: 50.r,
                                          ),
                                          SizedBox(
                                            width: 10.w,
                                          ),
                                          Text(
                                            DateFormat.Hm().format(
                                                controller.event.dateTime),
                                            style: Fonts.getRegularStyle(
                                                fontSize: 37.sp,
                                                color: Colors.white),
                                          )
                                        ],
                                      ),
                                    ]),
                                Container(
                                  height: 200.r,
                                  width: 200.r,
                                  decoration: BoxDecoration(
                                      color: Colors.white.withOpacity(0.05),
                                      borderRadius:
                                          BorderRadius.circular(20.r)),
                                  child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          controller.event.dateTime.day
                                              .toString(),
                                          style: Fonts.getMediumStyle(
                                              fontSize: 65.sp,
                                              color: Colors.white),
                                        ),
                                        SizedBox(
                                          height: 5.h,
                                        ),
                                        Text(
                                          DateFormat.MMM().format(
                                              controller.event.dateTime),
                                          maxLines: 2,
                                          style: Fonts.getBoldStyle(
                                              color: AppColors.red,
                                              fontSize: 40.sp),
                                        ),
                                      ]),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 40.h,
                          ),
                          Text(
                            'Details',
                            style: Fonts.getBoldStyle(
                                fontSize: 40.sp, color: Colors.white),
                          ),
                          SizedBox(
                            height: 20.h,
                          ),
                          //
                          AutoSizeText(
                            controller.event.description,
                            maxLines: 4,
                            overflowReplacement: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    controller.event.description,
                                    maxLines: controller.isTextExtended.isFalse
                                        ? 4
                                        : 20,
                                    overflow: TextOverflow.ellipsis,
                                    style: Fonts.getRegularStyle(
                                        fontSize: 35.sp,
                                        color: Colors.white,
                                        height: 4.h),
                                  ),
                                  InkWell(
                                    onTap: () {
                                      controller.extendText();
                                    },
                                    child: SizedBox(
                                      height: 50.h,
                                      child: Text(
                                        controller.isTextExtended.isFalse
                                            ? "Read More"
                                            : "Hide",
                                        style: Fonts.getMediumStyle(
                                            color: AppColors.red,
                                            fontSize: 35.sp),
                                      ),
                                    ),
                                  )
                                ]),
                            style: Fonts.getRegularStyle(
                                fontSize: 35.sp,
                                color: Colors.white,
                                height: 4.h),
                          ),
                          SizedBox(
                            height: 40.h,
                          ),
                          Text(
                            'Location',
                            style: Fonts.getBoldStyle(
                                fontSize: 40.sp, color: Colors.white),
                          ),
                          SizedBox(
                            height: 40.h,
                          ),
                          Container(
                            height: 400.h,
                            clipBehavior: Clip.antiAlias,
                            decoration: BoxDecoration(
                                color: AppColors.darkGrey,
                                borderRadius: BorderRadius.circular(30.r)),
                            child: SvgPicture.asset(
                              'assets/img/map.svg',
                              fit: BoxFit.cover,
                            ),
                          )
                        ],
                      )),
                ]),
              );
            }),
      ),
    );
  }
}
