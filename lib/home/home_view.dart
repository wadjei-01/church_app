import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:gtp_app/home/home_controller.dart';
import 'package:gtp_app/navbar/navbar_controller.dart';
import 'package:gtp_app/theme/appcolors.dart';
import 'package:gtp_app/widgets/widgets.dart';

import '../theme/fontsfamily.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getAppBar("Home"),
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 40.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              getStaggeredGrid(),
              SizedBox(
                height: 90.h,
              ),
              Text(
                'Events',
                style: Fonts.getSemiBoldStyle(
                    color: Colors.white, fontSize: 40.sp),
              ),
              GetBuilder(
                  init: controller,
                  builder: (controller) => futureBuilderListView(controller)),
              SizedBox(
                height: 250.h,
              )
            ],
          ),
        ),
      ),
    );
  }

  StaggeredGrid getStaggeredGrid() {
    return StaggeredGrid.count(
      crossAxisCount: 3,
      mainAxisSpacing: 10,
      crossAxisSpacing: 10,
      axisDirection: AxisDirection.down,
      children: [
        StaggeredGridTile.count(
            crossAxisCellCount: 1,
            mainAxisCellCount: 1,
            child: getContainer(
                color: AppColors.red,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset(
                      'assets/icons/interact.svg',
                      width: 80.w,
                      height: 80.w,
                    ),
                    SizedBox(
                      height: 25.h,
                    ),
                    Text(
                      "Interact",
                      style: Fonts.getBoldStyle(
                          color: Colors.white, fontSize: 40.sp),
                    )
                  ],
                ))),
        StaggeredGridTile.count(
            crossAxisCellCount: 2,
            mainAxisCellCount: 1,
            child: getContainer(
                color: AppColors.blue,
                onTap: () {
                  Get.find<NavBarController>().changePageIndex(1);
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SvgPicture.asset(
                          'assets/icons/play.svg',
                          width: 80.w,
                          height: 80.w,
                        ),
                        SizedBox(
                          height: 25.h,
                        ),
                        Text(
                          "Sermons",
                          style: Fonts.getBoldStyle(
                              color: Colors.white, fontSize: 40.sp),
                        )
                      ],
                    ),
                    SizedBox(
                      child: IntrinsicHeight(
                        child: Center(
                          child: Image.asset(
                            'assets/img/pastor eben.png',
                            width: 304.4.w,
                            fit: BoxFit.fitWidth,
                          ),
                        ),
                      ),
                    )
                  ],
                ))),
        StaggeredGridTile.count(
            crossAxisCellCount: 2,
            mainAxisCellCount: 1,
            child: getContainer(
                onTap: () => Get.toNamed('/prayer'),
                color: AppColors.purple,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SvgPicture.asset(
                          'assets/icons/prayer_request.svg',
                          width: 80.w,
                          height: 80.w,
                        ),
                        SizedBox(
                          height: 25.h,
                        ),
                        Text(
                          "Prayer",
                          textAlign: TextAlign.left,
                          style: Fonts.getBoldStyle(
                              color: Colors.white, fontSize: 40.sp),
                        ),
                        Text(
                          "Requests",
                          textAlign: TextAlign.left,
                          style: Fonts.getBoldStyle(
                              color: Colors.white, fontSize: 40.sp),
                        ),
                      ],
                    ),
                    SizedBox(
                      child: IntrinsicHeight(
                        child: Center(
                          child: IntrinsicHeight(
                            child: Image.asset(
                              'assets/img/person praying.png',
                              width: 304.4.w,
                              fit: BoxFit.fitHeight,
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ))),
        StaggeredGridTile.count(
            crossAxisCellCount: 1,
            mainAxisCellCount: 1,
            child: getContainer(
                onTap: () => Get.toNamed('/transactions'),
                color: Colors.white,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset(
                      'assets/icons/give.svg',
                      width: 80.w,
                      height: 80.w,
                    ),
                    SizedBox(
                      height: 25.h,
                    ),
                    Text(
                      "Give",
                      style: Fonts.getBoldStyle(
                          color: AppColors.grey, fontSize: 40.sp),
                    )
                  ],
                ))),
      ],
    );
  }
}
