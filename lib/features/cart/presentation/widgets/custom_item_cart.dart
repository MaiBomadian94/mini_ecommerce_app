import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mini_ecommerce_app/core/helpers/spacing.dart';
import 'package:mini_ecommerce_app/core/theming/colors.dart';
import 'package:mini_ecommerce_app/core/theming/text_styles.dart';

import 'counter_widget.dart';

class CustomCartItem extends StatefulWidget {
  const CustomCartItem({super.key});

  @override
  State<CustomCartItem> createState() => _CustomCartItemState();
}

class _CustomCartItemState extends State<CustomCartItem> {
  int initialItem = 1;
  bool isFavorite = false;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(16.r),
          child: Container(color: Colors.red, width: 160.w, height: 160.h),
          // child: Image.asset('', width: 160.w, height: 160.h),
        ),
        horizontalSpace(width: 23),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Women’s Collection',
                style: Styles.textTitle12SemiBold.copyWith(
                  color: AppColors.grey,
                ),
              ),
              verticalSpace(height: 9),
              Text('Puff Sleeved Blouse', style: Styles.textTitle16SemiBold),
              verticalSpace(height: 18),

              Row(
                children: [
                  CounterWidget(
                    icon: Icons.add,
                    onTap: () {
                      setState(() {
                        initialItem++;
                      });
                    },
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 22.w),
                    child: Text(
                      initialItem.toString(),
                      style: Styles.textTitle16SemiBold,
                    ),
                  ),

                  CounterWidget(
                    icon: Icons.minimize_sharp,
                    yAxis: -8,
                    onTap: () {
                      if (initialItem > 1) {
                        initialItem--;
                      }
                      setState(() {});
                    },
                  ),
                ],
              ),

              verticalSpace(height: 35),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        isFavorite = !isFavorite;
                      });
                    },
                    child: isFavorite
                        ? SvgPicture.asset(
                            'assets/svgs/selected_favorite.svg',
                            colorFilter: ColorFilter.mode(
                              AppColors.darkRed,
                              BlendMode.srcIn,
                            ),
                            width: 19.w,
                            height: 18.h,
                          )
                        : SvgPicture.asset(
                            'assets/svgs/favorite.svg',
                            colorFilter: ColorFilter.mode(
                              AppColors.black,
                              BlendMode.srcIn,
                            ),
                            width: 19.w,
                            height: 18.h,
                          ),
                  ),
                  Text(r'$16.99', style: Styles.textTitle16SemiBold),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
