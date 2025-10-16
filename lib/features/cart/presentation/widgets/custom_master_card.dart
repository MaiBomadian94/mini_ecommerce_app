import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mini_ecommerce_app/core/helpers/spacing.dart';
import 'package:mini_ecommerce_app/core/theming/colors.dart';

import '../../../../core/theming/text_styles.dart';

class CustomMasterCard extends StatelessWidget {
  const CustomMasterCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 22.h, horizontal: 20.w),
      decoration: BoxDecoration(
        color: Color(0xfff6f6f6),
        borderRadius: BorderRadius.circular(8.r),
        border: Border.all(
          color: AppColors.lightGrey,
              width: 1.5.w,
        )
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Image.asset('assets/images/master_card.png'),
              horizontalSpace(width: 12),
              Text('****  ****  ****  5124',style: Styles.textTitle16SemiBold,),
            ],
          ),
          Icon(Icons.keyboard_arrow_down_sharp, size: 35),
        ],
      ),
    );
  }
}
