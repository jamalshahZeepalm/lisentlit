import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:listenlit/general_widgets/primarybutton.dart';
import 'package:listenlit/pages/profileScreen/paymentMethodScreen/add_paymentmethod_screen.dart';
import 'package:listenlit/utils/colors.dart';

class BottomSheetButton extends StatelessWidget {
  const BottomSheetButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.transparent,
      padding: EdgeInsets.only(bottom: 23.h),
      child: Padding(
        padding: EdgeInsets.only(
          left: 16.w,
          right: 16.w,
        ),
        child: PrimaryButton(
          onTap: () {
            Get.to(() => const AddPaymentMethodScreen());
          },
          borderRadius: 8,
          text: 'Add New Payment Method',
          iconData: Icons.add_circle_outline_rounded,
          textColor: AppColor.kLightAccentColor,
          bgColor: AppColor.kPrimary,
        ),
      ),
    );
  }
}