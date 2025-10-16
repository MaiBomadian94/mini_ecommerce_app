import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mini_ecommerce_app/core/helpers/spacing.dart';
import 'package:mini_ecommerce_app/core/theming/colors.dart';
import 'package:mini_ecommerce_app/core/theming/text_styles.dart';
import '../widgets/banner_slider.dart';
import '../widgets/count_down_time.dart';
import '../widgets/custom_brand_list.dart';
import '../widgets/custom_circular_icon.dart';
import '../widgets/custom_location_bar.dart';
import '../widgets/products_grid_view.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 30.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SvgPicture.asset('assets/svgs/app_logo.svg'),
                    Row(
                      children: [
                        CustomCircularIcon(
                          svgPath: 'assets/svgs/search_icon.svg',
                        ),
                        horizontalSpace(width: 8),
                        CustomCircularIcon(svgPath: 'assets/svgs/cart.svg'),
                      ],
                    ),
                  ],
                ),
                verticalSpace(height: 26),
                CustomLocationBar(),
                verticalSpace(height: 25),
                BannerSlider(),
                verticalSpace(height: 17),
                Text('Popular Brand', style: Styles.textTitle20SemiBold),
                verticalSpace(height: 18),
                CustomBrandList(),
                verticalSpace(height: 18),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Flash Sale', style: Styles.textTitle20SemiBold),
                    Row(
                      children: [
                        Text(
                          'Ends at',
                          style: Styles.textTitle14Medium.copyWith(
                            color: AppColors.darkGrey,
                          ),
                        ),
                        horizontalSpace(width: 8),
                        CountdownTime(
                          duration: Duration(
                            hours: 1,
                            minutes: 30,
                            seconds: 20,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                verticalSpace(height: 16),
                ProductsGridView(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
