import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:gtp_app/give/give_controller.dart';
import 'package:gtp_app/theme/appcolors.dart';
import 'package:gtp_app/theme/fontsfamily.dart';
import 'package:gtp_app/widgets/widgets.dart';
import 'package:multi_dropdown/multiselect_dropdown.dart';

class GiveView extends GetView<GiveController> {
  const GiveView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: getAppBar("Give"),
        backgroundColor: Colors.black,
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 40.w),
            child: Column(
              children: [
                getLabeledTextField(
                    title: "Phone Number",
                    hintText: "Phone Number",
                    height: 150.h,
                    // inputformatters: [
                    //   FilteringTextInputFormatter.allow(
                    //       RegExp(r'(^(?:[+0]9)?[0-9]{10,12}$)'))
                    // ],
                    keyboardType: TextInputType.phone),
                SizedBox(
                  height: 60.h,
                ),
                getLabeledTextField(
                    title: "Amount",
                    hintText: "0.00",
                    height: 150.h,
                    inputformatters: [
                      FilteringTextInputFormatter.allow(
                          RegExp(r'^\d+\.?\d{0,2}'))
                    ],
                    keyboardType: TextInputType.numberWithOptions(
                      decimal: true,
                    )),
                SizedBox(
                  height: 60.h,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Payment Method',
                      style: Fonts.getSemiBoldStyle(
                          fontSize: 40.sp, color: Colors.white),
                    ),
                    SizedBox(
                      height: 60.h,
                    ),
                    MultiSelectDropDown(
                      onOptionSelected: (selectOptions) {},
                      backgroundColor: Colors.white,
                      selectedOptionTextColor: Colors.black,
                      hintStyle: Fonts.getMediumStyle(
                        fontSize: 40.sp,
                        color: AppColors.lightGrey,
                      ),
                      padding: EdgeInsets.only(right: 30.w),
                      borderRadius: 20.r,
                      borderColor: Colors.white,
                      options: [
                        ValueItem(label: 'MTN Mobile Money', value: '1'),
                        ValueItem(label: 'Vodafone', value: '2'),
                        ValueItem(label: 'Other', value: '3'),
                      ],
                      selectionType: SelectionType.single,
                      chipConfig: const ChipConfig(wrapType: WrapType.wrap),
                      dropdownHeight: 300,
                      optionTextStyle: Fonts.getMediumStyle(
                        fontSize: 40.sp,
                        color: AppColors.darkGrey,
                      ),
                      selectedOptionIcon: const Icon(Icons.check_circle),
                    ),
                    SizedBox(
                      height: 60.h,
                    ),
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
              ],
            ),
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
