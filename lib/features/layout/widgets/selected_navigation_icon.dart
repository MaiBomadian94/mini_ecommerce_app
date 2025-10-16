import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mini_ecommerce_app/core/helpers/spacing.dart';

import '../../../core/theming/colors.dart';
import '../../../core/theming/text_styles.dart';

class SelectedNavigationIcon extends StatelessWidget {
  const SelectedNavigationIcon({
    super.key,
    required this.svgAsset,
    required this.label,
  });

  final String svgAsset;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.mainBlue,
        borderRadius: BorderRadius.circular(22),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 14.h),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            SvgPicture.asset(
              width: 20.w,
              height: 20.h,
              svgAsset,
              fit: BoxFit.scaleDown,
              colorFilter: const ColorFilter.mode(
                AppColors.white,
                BlendMode.srcIn,
              ),
            ),
            horizontalSpace(width: 4),
            Text(
              label,
              style: Styles.textTitle14Medium.copyWith(
                color: AppColors.brandBackground,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
