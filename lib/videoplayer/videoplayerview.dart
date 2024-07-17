import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:gtp_app/theme/appcolors.dart';
import 'package:gtp_app/theme/fontsfamily.dart';
import 'package:gtp_app/videoplayer/comment.dart';
import 'package:gtp_app/videoplayer/videoplayercontroller.dart';
import 'package:gtp_app/widgets/utils/functions.dart';
import 'package:gtp_app/widgets/widgets.dart';
import 'package:ionicons/ionicons.dart';
import 'package:timeago/timeago.dart' as timeago;

class VideoPlayerView extends GetView<VideoPlayerController> {
  const VideoPlayerView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GetBuilder(
                init: controller,
                builder: (controller) {
                  return Stack(children: [
                    Container(
                      height: 600.h,
                      width: 1.sw,
                      color: AppColors.darkGrey,
                      child: Image.asset(
                        controller.selectedVideo.img,
                        fit: BoxFit.fitWidth,
                      ),
                    ),
                    Positioned(
                        top: 30.r,
                        left: 30.r,
                        child: getBack(onTap: () {
                          Get.until((route) => Get.currentRoute == '/nav');
                        }))
                  ]);
                }),
            SizedBox(
              height: 30.h,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 30.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    controller.selectedVideo.title,
                    maxLines: 1,
                    style: Fonts.getBoldStyle(
                        fontSize: 50.sp, color: Colors.white),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        '${estimateValue(controller.selectedVideo.views)} Views',
                        maxLines: 1,
                        style: Fonts.getRegularStyle(
                            fontSize: 35.sp, color: Colors.white),
                      ),
                      SizedBox(
                        width: 20.w,
                      ),
                      Text(
                        timeago.format(controller.selectedVideo.dateTime),
                        maxLines: 1,
                        style: Fonts.getRegularStyle(
                            fontSize: 35.sp, color: Colors.white),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 30.h,
                  ),
                  Container(
                    height: 100.h,
                    padding: EdgeInsets.symmetric(horizontal: 50.w),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50.r),
                      color: AppColors.darkGrey,
                    ),
                    child: IntrinsicWidth(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          InkWell(
                            onTap: () {},
                            child: Row(
                              children: [
                                Icon(
                                  Ionicons.thumbs_up_outline,
                                  size: 50.r,
                                ),
                                SizedBox(
                                  width: 30.w,
                                ),
                                SizedBox(
                                  width: 95.w,
                                  child: Text(
                                    controller.selectedVideo.likes.toString(),
                                    style: Fonts.getMediumStyle(
                                        fontSize: 45.sp, color: Colors.white),
                                  ),
                                )
                              ],
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              SizedBox(
                                width: 85.r,
                                child: Text(
                                  controller.selectedVideo.dislikes.toString(),
                                  textAlign: TextAlign.end,
                                  style: Fonts.getMediumStyle(
                                      fontSize: 45.sp, color: Colors.white),
                                ),
                              ),
                              SizedBox(
                                width: 30.w,
                              ),
                              Icon(Ionicons.thumbs_down_outline, size: 50.r),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 30.h,
                  ),
                  getContainer(
                      color: AppColors.darkGrey,
                      onTap: () {
                        Get.bottomSheet(
                            Container(
                              padding: EdgeInsets.only(
                                  top: 40.r, left: 30.w, right: 30.r),
                              height: 1.sh,
                              width: 1.sw,
                              color: AppColors.darkGrey,
                              child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          'Comments',
                                          style: Fonts.getBoldStyle(
                                              fontSize: 45.sp,
                                              color: Colors.white),
                                        ),
                                        InkWell(
                                          child: Icon(Icons.close),
                                          onTap: () => Get.back(),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 30.h,
                                    ),
                                    SizedBox(
                                      width: 1.sw,
                                      child: FutureBuilder<List<Comment>>(
                                          future:
                                              Get.find<VideoPlayerController>()
                                                  .commentsList(),
                                          builder: (context, snapshot) {
                                            if (snapshot.hasError) {
                                              return Center(
                                                child: Text('Error 404'),
                                              );
                                            }
                                            if (snapshot.hasData) {
                                              return ListView(
                                                  shrinkWrap: true,
                                                  children: [
                                                    for (int index = 0;
                                                        index <
                                                            snapshot
                                                                .data!.length;
                                                        index++)
                                                      Padding(
                                                        padding: EdgeInsets
                                                            .symmetric(
                                                                vertical: 20.h),
                                                        child: Row(
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Container(
                                                              clipBehavior:
                                                                  Clip.hardEdge,
                                                              height: 120.r,
                                                              width: 120.r,
                                                              decoration: BoxDecoration(
                                                                  color:
                                                                      AppColors
                                                                          .grey,
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              60.r)),
                                                              child:
                                                                  Image.asset(
                                                                snapshot
                                                                    .data![
                                                                        index]
                                                                    .profileIcon,
                                                                fit: BoxFit
                                                                    .contain,
                                                              ),
                                                            ),
                                                            SizedBox(
                                                              width: 20.w,
                                                            ),
                                                            Column(
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .start,
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .start,
                                                              children: [
                                                                Text(
                                                                  snapshot
                                                                      .data![
                                                                          index]
                                                                      .profileName,
                                                                  maxLines: 1,
                                                                  overflow:
                                                                      TextOverflow
                                                                          .ellipsis,
                                                                  style: Fonts.getSemiBoldStyle(
                                                                      color: Colors
                                                                          .white
                                                                          .withOpacity(
                                                                              0.5),
                                                                      fontSize:
                                                                          38.sp),
                                                                ),
                                                                SizedBox(
                                                                  height: 10.h,
                                                                ),
                                                                SizedBox(
                                                                  width: 835.w,
                                                                  child:
                                                                      IntrinsicHeight(
                                                                    child: Text(
                                                                      snapshot
                                                                          .data![
                                                                              index]
                                                                          .text,
                                                                      maxLines:
                                                                          4,
                                                                      style: Fonts.getRegularStyle(
                                                                          color: Colors
                                                                              .white,
                                                                          fontSize:
                                                                              35.sp),
                                                                    ),
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ],
                                                        ),
                                                      )
                                                  ]);
                                            } else {
                                              return Center(
                                                  child:
                                                      CircularProgressIndicator(
                                                color: AppColors.red,
                                              ));
                                            }
                                          }),
                                    ),
                                  ]),
                            ),
                            backgroundColor: Colors.black.withOpacity(0));
                      },
                      padding: EdgeInsets.all(40.r),
                      height: 250.h,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Comments",
                                style: Fonts.getSemiBoldStyle(
                                    color: Colors.white, fontSize: 40.sp),
                              ),
                              Icon(CupertinoIcons.chevron_down)
                            ],
                          ),
                          SizedBox(
                            height: 10.h,
                          ),
                          Row(
                            children: [
                              Container(
                                clipBehavior: Clip.hardEdge,
                                height: 80.r,
                                width: 80.r,
                                decoration: BoxDecoration(
                                    color: AppColors.grey,
                                    borderRadius: BorderRadius.circular(40.r)),
                                child: Image.asset(controller
                                    .selectedVideo.commentsList[0].profileIcon),
                              ),
                              SizedBox(
                                width: 20.w,
                              ),
                              SizedBox(
                                width: 830.w,
                                height: 90.h,
                                child: Text(
                                  controller.selectedVideo.commentsList[0].text,
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  style: Fonts.getRegularStyle(
                                      color: Colors.white, fontSize: 35.sp),
                                ),
                              ),
                            ],
                          ),
                        ],
                      )),
                  SizedBox(
                    height: 30.h,
                  ),
                  SizedBox(
                      height: 0.45.sh,
                      child: GetBuilder(
                          init: controller,
                          builder: (controller) => videoListView(controller))),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
