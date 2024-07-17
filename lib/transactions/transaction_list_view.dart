import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:gtp_app/theme/appcolors.dart';
import 'package:gtp_app/theme/fontsfamily.dart';
import 'package:gtp_app/transactions/transactions_controller.dart';
import 'package:gtp_app/transactions/transactions_model.dart';
import 'package:gtp_app/widgets/widgets.dart';
import 'package:intl/intl.dart';

class TransactionsListView extends GetView<TransactionsController> {
  const TransactionsListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: getAppBar('Transactions'),
        backgroundColor: Colors.black,
        body: GetBuilder<TransactionsController>(builder: (controller) {
          return CustomBuilder<List<TransactionModel>>(
            length: controller.length,
            builderList: controller.transactionsList,
            builder: (buildContext, index, snapshot) {
              return transactionContainer(snapshot, index!);
            },
          );
        }),
        extendBody: true,
        bottomNavigationBar: Container(
          color: Colors.black,
          child: getContainer(
              splashColor: AppColors.red,
              onTap: () {
                Get.toNamed('/give');
              },
              margin: EdgeInsets.all(60.r),
              height: 150.h,
              color: AppColors.red,
              child: Center(
                  child: Text(
                'Give',
                style: Fonts.getSemiBoldStyle(
                    fontSize: 45.sp, color: Colors.white),
              ))),
        ));
  }

  GetBuilder<TransactionsController> getTransactionsListView() {
    return GetBuilder<TransactionsController>(
        init: controller,
        builder: (controller) {
          return FutureBuilder<List<TransactionModel>>(
              future: controller.transactionsList,
              builder: (context, snapshot) {
                if (snapshot.hasError) {
                  return Center(
                    child: Text('Error 404'),
                  );
                }
                if (snapshot.hasData) {
                  return ListView.builder(
                      shrinkWrap: true,
                      itemCount: snapshot.data!.length,
                      itemBuilder: (context, index) {
                        return transactionContainer(snapshot, index);
                      });
                } else {
                  return Center(
                    child: CircularProgressIndicator(
                      color: AppColors.red,
                    ),
                  );
                }
              });
        });
  }

  dynamic transactionContainer(
      AsyncSnapshot<List<TransactionModel>> snapshot, int index) {
    return getContainer(
      margin: EdgeInsets.symmetric(horizontal: 40.w, vertical: 20.h),
      padding: EdgeInsets.all(40.r),
      height: 500.h,
      onTap: () {},
      color: AppColors.innerContainer,
      child: IntrinsicHeight(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                  width: 650.w,
                  child: Text(
                    snapshot.data![index].msg,
                    maxLines: 2,
                    style: Fonts.getSemiBoldStyle(
                        color: Colors.white, height: 1.5),
                  )),
              snapshot.data![index].isSuccessful
                  ? successContainer()
                  : failedContainer()
            ],
          ),
          SizedBox(
            height: 40.h,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(DateFormat("jm").format(snapshot.data![index].dateTime)),
              Text(
                '\$${snapshot.data![index].amountPaid.toStringAsFixed(2)}',
                style: Fonts.getBoldStyle(color: Colors.white, fontSize: 40.sp),
              )
            ],
          ),
          SizedBox(
            height: 40.h,
          ),
          Divider(
            color: AppColors.grey,
          ),
          SizedBox(
            height: 40.h,
          ),
          Row(
            children: [
              Container(
                width: 90.r,
                height: 90.r,
                clipBehavior: Clip.hardEdge,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(45.r),
                  color: AppColors.grey,
                ),
                child: Image.asset(
                  'assets/img/mtn.png',
                  fit: BoxFit.contain,
                ),
              ),
              SizedBox(
                width: 15.w,
              ),
              Text(
                'MTN Mobile Money',
                style: Fonts.getMediumStyle(
                    color: AppColors.lighten(AppColors.innerContainer, 0.4)),
              ),
            ],
          )
        ]),
      ),
    );
  }

  Container successContainer() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 40.r, vertical: 20.r),
      alignment: Alignment.center,
      decoration: BoxDecoration(
          color: AppColors.successBG,
          borderRadius: BorderRadiusDirectional.circular(60.r)),
      child: IntrinsicHeight(
          child: IntrinsicWidth(
              child: Text(
        "Successful",
        style:
            Fonts.getSemiBoldStyle(color: AppColors.success, fontSize: 30.sp),
      ))),
    );
  }

  Container failedContainer() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 40.r, vertical: 20.r),
      alignment: Alignment.center,
      decoration: BoxDecoration(
          color: AppColors.red,
          borderRadius: BorderRadiusDirectional.circular(60.r)),
      child: IntrinsicHeight(
          child: IntrinsicWidth(
              child: Text(
        "Failed",
        style: Fonts.getSemiBoldStyle(
            color: AppColors.lighten(AppColors.red, 0.4), fontSize: 30.sp),
      ))),
    );
  }
}
