import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:gtp_app/navbar/navbar_controller.dart';
import 'package:gtp_app/theme/appcolors.dart';
import 'package:gtp_app/theme/fontsfamily.dart';
import 'package:ionicons/ionicons.dart';

class NavBar extends GetView<NavBarController> {
  NavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        height: 1.sh,
        child: Stack(
          children: [
            Obx(
              () => controller.pages[controller.currentPage.value],
            ),
            Obx(() {
              return Positioned(
                  bottom: controller.btm.value,
                  left: 0,
                  right: 0,
                  child: bottomNavBar(controller));
            })
          ],
        ),
      ),
      extendBody: true,
    );
  }

  Container bottomNavBar(NavBarController controller) {
    return Container(
      margin: EdgeInsets.all(60.r),
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(30.r)),
      height: 200.h,
      child: BottomNavigationBar(
          selectedItemColor: AppColors.red,
          selectedFontSize: 30.sp,
          selectedLabelStyle:
              Fonts.getMediumStyle(fontSize: 30.sp, height: 5.h),
          unselectedFontSize: 28.sp,
          unselectedLabelStyle:
              Fonts.getRegularStyle(fontSize: 28.sp, height: 3.h),
          unselectedItemColor: HexColor('505050'),
          type: BottomNavigationBarType.fixed,
          currentIndex: controller.currentPage.value,
          onTap: controller.changePageIndex,
          items: [
            BottomNavigationBarItem(label: 'Home', icon: Icon(Ionicons.home)),
            BottomNavigationBarItem(
              label: 'Sermons',
              icon: SvgPicture.asset(
                'assets/icons/sermons.svg',
                height: 50.r,
                width: 50.r,
              ),
              activeIcon: SvgPicture.asset(
                'assets/icons/sermons.svg',
                height: 50.r,
                width: 50.r,
                color: AppColors.red,
              ),
            ),
            BottomNavigationBarItem(
                label: 'Settings', icon: Icon(Ionicons.settings)),
          ]),
    );
  }
}
