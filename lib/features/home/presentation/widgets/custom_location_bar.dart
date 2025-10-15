import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/helpers/spacing.dart';
import '../../../../core/presentation/widgets/custom_elevated_button.dart';
import '../../../../core/theming/colors.dart';
import '../../../../core/theming/text_styles.dart';
import 'custom_circular_icon.dart';

class CustomLocationBar extends StatelessWidget {
  const CustomLocationBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 48.h,
      decoration: BoxDecoration(
        border: Border.all(width: 1.r, color: AppColors.lightGrey),
        borderRadius: BorderRadius.circular(128.r),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 4.w),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                CustomCircularIcon(
                  svgPath: 'assets/svgs/search_icon.svg',
                  backgroundColor: AppColors.lightGrey,
                  width: 40,
                  height: 40,
                ),
                horizontalSpace(width: 8.w),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Send To',
                      style: Styles.textTitle12SemiBold.copyWith(
                        color: AppColors.grey,
                      ),
                    ),
                    Text(
                      'Brisbane, Queeensland',
                      style: Styles.textTitle14SemiBold,
                    ),
                  ],
                ),
              ],
            ),
            CustomElevatedButton(
              title: 'Change',
              backgroundColor: AppColors.mainBlue,
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}
