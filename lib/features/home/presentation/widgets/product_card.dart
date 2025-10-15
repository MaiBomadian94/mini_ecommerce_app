import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mini_ecommerce_app/core/helpers/spacing.dart';
import 'package:mini_ecommerce_app/core/theming/colors.dart';
import 'package:mini_ecommerce_app/core/theming/text_styles.dart';

class CustomProductCard extends StatelessWidget {
  const CustomProductCard({super.key});

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 183.w,
            height: 183.h,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16.r),
              color: AppColors.red,
            ),
          ),
          verticalSpace(height: 15),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Printed T-Shirt', style: Styles.textTitle14SemiBold),
              Row(
                children: [
                  SvgPicture.asset('assets/svgs/rating_icon.svg'),
                  horizontalSpace(width: 5),
                  Text('4.8', style: Styles.textTitle12SemiBold),
                ],
              ),
            ],
          ),
          verticalSpace(height: 3),
          Text(r'$11.99', style: Styles.textTitle16SemiBold),
        ],
      ),
    );
  }
}
