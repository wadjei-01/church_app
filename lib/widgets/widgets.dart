import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:gtp_app/audioplayer/audiomodel.dart';
import 'package:gtp_app/events/events_model.dart';
import 'package:gtp_app/home/home_controller.dart';
import 'package:intl/intl.dart';
import 'package:gtp_app/theme/appcolors.dart';
import 'package:gtp_app/theme/fontsfamily.dart';
import 'package:gtp_app/videoplayer/videomodel.dart';
import 'package:ionicons/ionicons.dart';
import 'package:timeago/timeago.dart' as timeago;

AppBar getAppBar(String title, {Color? color}) {
  return AppBar(
    backgroundColor: color ?? Colors.transparent,
    surfaceTintColor: Colors.black,
    elevation: 0,
    title: Text(
      title,
      style: Fonts.getBoldStyle(color: Colors.white, fontSize: 60.sp),
    ),
  );
}

Container getContainer(
        {required Color color,
        Color? splashColor,
        dynamic onTap,
        EdgeInsets? padding,
        EdgeInsets? margin,
        double? height,
        double? width,
        double? radius,
        Widget? child}) =>
    Container(
      clipBehavior: Clip.hardEdge,
      alignment: Alignment.center,
      margin: margin,
      height: height,
      width: width,
      decoration:
          BoxDecoration(borderRadius: BorderRadius.circular(radius ?? 20.r)),
      child: Stack(
        fit: StackFit.expand,
        alignment: Alignment.center,
        children: [
          Material(
            color: color,
            child: InkWell(
                onTap: onTap,
                splashColor: splashColor ?? AppColors.darken(color, 0.2),
                borderRadius: BorderRadius.circular(radius ?? 20.r),
                child: Padding(
                  padding: padding ?? EdgeInsets.symmetric(horizontal: 30.w),
                  child: child,
                )),
          ),
        ],
      ),
    );

Row searchBar() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      getTextfield(
          width: 296.w,
          hintText: "Search",
          prefixIcon: SizedBox(
            height: 40.r,
            width: 40.r,
            child: Center(
              child: SvgPicture.asset(
                'assets/icons/search.svg',
              ),
            ),
          )),
      SizedBox(
        width: 4.w,
      ),
      InkWell(
          //method to navigate to filter goes here
          onTap: () {},
          borderRadius: BorderRadius.circular(20.r),
          child: SvgPicture.asset('assets/icons/filter.svg'))
    ],
  );
}

Container getTextfield(
    {double? height,
    double? width,
    int? maxLines,
    int? maxLength,
    String? hintText,
    Widget? prefixIcon,
    TextInputType? keyboardType,
    List<TextInputFormatter>? inputformatters,
    Color? color}) {
  return Container(
    width: width,
    height: height ?? 150.h,
    padding: EdgeInsets.symmetric(horizontal: 30.w),
    alignment: maxLength != null ? Alignment.topLeft : Alignment.center,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(20.r),
      color: color ?? Colors.white,
    ),
    child: TextField(
      maxLines: maxLines,
      style: Fonts.getRegularStyle(
          fontSize: 40.sp, color: AppColors.darkGrey, height: 3.5.h),
      inputFormatters: inputformatters,
      keyboardType: keyboardType ?? TextInputType.text,
      maxLength: maxLength,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: Fonts.getMediumStyle(
          fontSize: 40.sp,
          color: AppColors.lightGrey,
        ),
        prefixIcon: prefixIcon,
        border: InputBorder.none,
      ),
    ),
  );
}

FutureBuilder<List<Video>> videoListView(var controller) {
  return FutureBuilder<List<Video>>(
      future: controller.videoData as Future<List<Video>>?,
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return const Center(
            child: Text('There was an error'),
          );
        }
        if (snapshot.hasData) {
          return AnimationLimiter(
            child: ListView.builder(
                shrinkWrap: true,
                physics: const ClampingScrollPhysics(),
                itemCount: snapshot.data!.length,
                itemBuilder: (context, index) {
                  return AnimationConfiguration.staggeredList(
                      position: index,
                      child: SlideAnimation(
                          delay: const Duration(milliseconds: 75),
                          child: FadeInAnimation(
                              delay: const Duration(milliseconds: 75),
                              child: videoContainer(
                                  snapshot.data![index], index))));
                }),
          );
        } else {
          return Center(
              child: CircularProgressIndicator(
            color: AppColors.red,
          ));
        }
      });
}

FutureBuilder<List<Event>> futureBuilderListView(var controller) {
  return FutureBuilder<List<Event>>(
      future: controller.data as Future<List<Event>>?,
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return const Center(
            child: Text('There was an error'),
          );
        }

        if (snapshot.hasData) {
          return AnimationLimiter(
            child: ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: snapshot.data!.length,
                itemBuilder: (context, index) {
                  return AnimationConfiguration.staggeredList(
                      position: index,
                      child: SlideAnimation(
                          delay:const Duration(milliseconds: 75),
                          child: FadeInAnimation(
                              delay:const Duration(milliseconds: 75),
                              child: eventContainer(snapshot.data![index]))));
                }),
          );
        } else {
          return Center(
              child: CircularProgressIndicator(
            color: AppColors.red,
          ));
        }
      });
}
// FutureBuilder<T> futureBuildListView<T extends AsyncSnapshot >(T controller) {
//   return FutureBuilder<T>(
//       future: controller.data ,
//       builder: (context, snapshot) {
//         if (snapshot.hasError) {
//           return const Center(
//             child: Text('There was an error'),
//           );
//         }

//         if (snapshot.hasData) {
//           return AnimationLimiter(
//             child: ListView.builder(
//                 shrinkWrap: true,
//                 physics: NeverScrollableScrollPhysics(),
//                 itemCount: snapshot.data!.length,
//                 itemBuilder: (context, index) {
//                   return AnimationConfiguration.staggeredList(
//                       position: index,
//                       child: SlideAnimation(
//                           delay: Duration(milliseconds: 75),
//                           child: FadeInAnimation(
//                               delay: Duration(milliseconds: 75),
//                               child: eventContainer(snapshot.data![index]))));
//                 }),
//           );
//         } else {
//           return Center(
//               child: CircularProgressIndicator(
//             color: AppColors.red,
//           ));
//         }
//       });
// }

FutureBuilder<List<Audio>> podcastListView(var controller) {
  return FutureBuilder<List<Audio>>(
      future: controller.audioData as Future<List<Audio>>?,
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return const Center(
            child: Text('There was an error'),
          );
        }

        if (snapshot.hasData) {
          return AnimationLimiter(
            child: ListView.builder(
                shrinkWrap: true,
                physics:const ClampingScrollPhysics(),
                itemCount: snapshot.data!.length,
                itemBuilder: (context, index) {
                  return AnimationConfiguration.staggeredList(
                      position: index,
                      child: SlideAnimation(
                          delay:const Duration(milliseconds: 75),
                          child: FadeInAnimation(
                              delay:const Duration(milliseconds: 75),
                              child: podcastList(
                                  snapshot.data![index], index, 0))));
                }),
          );
        } else {
          return Center(
              child: CircularProgressIndicator(
            color: AppColors.red,
          ));
        }
      });
}

podcastList(Audio audio, int index, int selectedIndex) {
  return getContainer(
    margin: EdgeInsets.symmetric(vertical: 10.h),
    padding: EdgeInsets.symmetric(horizontal: 30.w),
    height: 200.h,
    radius: 0.r,
    onTap: () {
      Get.toNamed('/audio', arguments: audio);
    },
    width: 1.sw,
    color: index == selectedIndex ? AppColors.darkGrey : Colors.black,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Container(
                clipBehavior: Clip.hardEdge,
                width: 150.r,
                height: 150.r,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.r),
                ),
                child: Image.asset(
                  audio.img,
                  fit: BoxFit.cover,
                )),
            SizedBox(
              width: 30.w,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: 0.45.sw,
                  child: Text(
                    audio.title,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: Fonts.getBoldStyle(
                        color: Colors.white, fontSize: 35.sp),
                  ),
                ),
                SizedBox(
                  width: 0.35.sw,
                  child: Text(
                    audio.description,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: Fonts.getRegularStyle(
                        color: Colors.white, fontSize: 30.sp),
                  ),
                ),
              ],
            )
          ],
        ),
        Container(
          height: 100.r,
          width: 100.r,
          decoration: BoxDecoration(
              color: AppColors.lighten(AppColors.darkGrey, 0.1),
              borderRadius: BorderRadius.circular(50.r)),
          child: Stack(
            children: [
              CircularProgressIndicator(
                value: 0,
                backgroundColor: AppColors.lighten(AppColors.darkGrey, 0.2),
              ),
              const Center(child: Icon(Icons.play_arrow))
            ],
          ),
        )
      ],
    ),
  );
}

dynamic videoContainer(
  Video video,
  int index,
) {
  return GestureDetector(
    onTap: () =>
        Get.toNamed('/video', arguments: video, preventDuplicates: false),
    child: IntrinsicHeight(
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: index == 0 ? 0.h : 40.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 500.h,
              clipBehavior: Clip.hardEdge,
              decoration: BoxDecoration(
                color: AppColors.grey,
              ),
              child: Image.asset(
                video.img,
                fit: BoxFit.fitWidth,
                width: 1.sw,
              ),
            ),
            SizedBox(
              height: 35.h,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 40.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: 600.w,
                        child: Text(
                          video.title,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: Fonts.getSemiBoldStyle(
                              fontSize: 45.sp, color: Colors.white),
                        ),
                      ),
                      Container(
                        width: 50.w,
                        alignment: Alignment.centerRight,
                        child: InkWell(
                            onTap: () {},
                            borderRadius: BorderRadius.circular(25.r),
                            child:const Icon(Ionicons.ellipsis_vertical)),
                      )
                    ],
                  ),
                  Text(timeago.format(video.dateTime))
                ],
              ),
            ),
          ],
        ),
      ),
    ),
  );
}

Container eventContainer(Event event) {
  return getContainer(
      color: HexColor('#210144'),
      onTap: () => Get.toNamed('/event', arguments: event),
      padding:const EdgeInsets.all(0),
      height: 700.h,
      margin: EdgeInsets.symmetric(vertical: 30.h),
      child: Stack(
        children: [
          Align(
            alignment: Alignment.bottomCenter,
            child: Image.asset(
              event.img,
              height: 776.8.h,
              width: 1013.2.w,
              fit: BoxFit.cover,
            ),
          ),
          Positioned(
              bottom: 50.h,
              left: 0.w,
              right: 0.w,
              child: getContainer(
                  height: 150.h,
                  margin: EdgeInsets.symmetric(horizontal: 30.w),
                  color: AppColors.innerContainer,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: 500.w,
                        child: Text(
                          event.title,
                          overflow: TextOverflow.ellipsis,
                          style: Fonts.getSemiBoldStyle(
                              fontSize: 40.sp, color: Colors.white),
                        ),
                      ),
                      SizedBox(
                        width: 300.w,
                        child: Text(
                          DateFormat('dd MMM yyyy').format(event.dateTime),
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.right,
                          style: Fonts.getRegularStyle(
                              fontSize: 35.sp, color: Colors.white),
                        ),
                      ),
                    ],
                  ))),
          Positioned(
              right: 0,
              child: InkWell(
                onTap: () => HomeController().switchBoolean(event.isBookmarked),
                child: Container(
                  margin: EdgeInsets.all(30.r),
                  height: 100.r,
                  width: 100.r,
                  decoration: BoxDecoration(
                      color: AppColors.innerContainer,
                      borderRadius: BorderRadius.circular(50.r)),
                  child: event.isBookmarked
                      ?const Icon(Icons.bookmark)
                      :const Icon(Icons.bookmark_add_outlined),
                ),
              ))
        ],
      ));
}

dynamic getTabs(var controller) {
  return Container(
      width: 1.sw,
      height: 100.h,
      color: Colors.black,
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: controller.tabList.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () => controller.onTabChanged(index),
            child: Obx(() {
              return Container(
                margin: EdgeInsets.symmetric(horizontal: 15.w),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color: controller.currentIndex.value == index
                      ? AppColors.red
                      : AppColors.lightGrey,
                ),
                height: 5,
                width: (controller.tabList[index].toString().length + 270.w),
                child: Center(
                    child: Text(controller.tabList[index],
                        style: controller.currentIndex.value == index
                            ? Fonts.getBoldStyle(
                                fontSize: 35.sp, color: Colors.white)
                            : Fonts.getRegularStyle(
                                color: const Color.fromARGB(255, 179, 179, 179),
                                fontSize: 35.sp))),
              );
            }),
          );
        },
      ));
}

typedef CustomWidgetBuilder = Widget Function(int?, AsyncSnapshot, Widget);

class CustomBuilder<T> extends StatelessWidget {
 const CustomBuilder({
    super.key,
    this.builderList,
    required this.builder,
    this.length,
    this.child
  });

  final Widget? child;
  final Widget Function(
      BuildContext buildContext, int? index, AsyncSnapshot<T> snapshot) builder;
  final int? length;
  final Future<T>? builderList;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<T>(
        future: builderList,
        builder: (context, AsyncSnapshot<T> snapshot) {
          if (snapshot.hasError) {
            return Center(
              child: Text('Error 404'),
            );
          }
          if (snapshot.hasData) {
            return AnimationLimiter(
              child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: length as int?,
                  itemBuilder: (context, index) {
                    return AnimationConfiguration.staggeredList(
                        position: index,
                        child: SlideAnimation(
                            delay: Duration(milliseconds: 75),
                            child: FadeInAnimation(
                                delay: Duration(milliseconds: 95),
                                child: builder(context, index, snapshot))));
                  }),
            );
          } else {
            return Center(
              child: CircularProgressIndicator(
                color: AppColors.red,
              ),
            );
          }
        });
  }
}

Column getLabeledTextField(
    {required String title,
    required String? hintText,
    int? maxLength,
    int? maxLines,
    double? height,
    TextInputType? keyboardType,
    List<TextInputFormatter>? inputformatters}) {
  return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
    Text(
      title,
      style: Fonts.getSemiBoldStyle(fontSize: 40.sp, color: Colors.white),
    ),
    SizedBox(
      height: 50.h,
    ),
    getTextfield(
        height: height ?? 150.h,
        hintText: hintText,
        keyboardType: keyboardType,
        maxLength: maxLength,
        maxLines: maxLines,
        inputformatters: inputformatters),
  ]);
}

Container getBack({Function()? onTap, EdgeInsets? margin}) {
  return getContainer(
    color: Colors.black.withOpacity(0.5),
    splashColor: AppColors.red,
    margin: margin,
    radius: 50.r,
    height: 100.r,
    width: 100.r,
    padding: EdgeInsets.all(0),
    onTap: onTap,
    child: Icon(Icons.arrow_back_ios_new_sharp),
  );
}
