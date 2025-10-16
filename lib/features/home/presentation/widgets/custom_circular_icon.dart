import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/theming/colors.dart';

class CustomCircularIcon extends StatelessWidget {
  const CustomCircularIcon({
    super.key,
     this.svgPath,
    this.backgroundColor,
    this.width,
    this.height,
    this.isIcon,
  });

  final String? svgPath;
  final Color? backgroundColor;
  final double? width;
  final double? height;
  final bool? isIcon;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width?.w ?? 48.w,
      height: height?.h ?? 48.h,
      decoration: BoxDecoration(
        color: backgroundColor ?? AppColors.white,
        shape: BoxShape.circle,
        border: Border.all(color: AppColors.lightGrey, width: 1.5),
      ),
      child: isIcon == true
          ? Padding(
            padding:  EdgeInsets.symmetric(horizontal: 14),
            child: Icon(Icons.arrow_back_ios),
          )
          : SvgPicture.asset(
              svgPath??'',
              fit: BoxFit.scaleDown,
              colorFilter: ColorFilter.mode(
                AppColors.darkBlue,
                BlendMode.srcIn,
              ),
            ),
    );
  }
}
