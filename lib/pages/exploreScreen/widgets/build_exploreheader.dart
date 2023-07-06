import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:listenlit/utils/colors.dart';
import 'package:listenlit/utils/icons_path.dart';

class BuildExploreHeader extends StatelessWidget {
  const BuildExploreHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: 272.w, top: 8.h),
      child: Column(
        children: [
          Text(
            'Explore',
            style: TextStyle(
              fontSize: 24.sp,
              color: AppColor.kWhiteColor,
              fontFamily: 'Inter',
              fontWeight: FontWeight.w700,
            ),
          ),
          SizedBox(
            height: 4.h,
          ),
          SvgPicture.asset(
            AppIcons.kLinearLine,
            width: 112.w,
          ),
        ],
      ),
    );
  }
}
