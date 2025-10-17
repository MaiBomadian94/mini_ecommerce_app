import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/helpers/spacing.dart';
import '../../../../core/theming/colors.dart';
import '../../../../core/theming/text_styles.dart';
import '../../data/models/product_model.dart';

class ProductsDetailsCard extends StatelessWidget {
  const ProductsDetailsCard({super.key, required this.productModel});

  final ProductModel productModel;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 20.h),
      decoration: BoxDecoration(
        color: AppColors.babyBlue.withOpacity(.5),
        borderRadius: BorderRadius.circular(16.r),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,

        children: [
          Text(
            '\$ ${productModel.price ?? 0}',
            style: Styles.textTitle20SemiBold,
          ),
          verticalSpace(height: 16),
          Text(
            productModel.category ?? "",
            style: Styles.textTitle14SemiBold.copyWith(color: AppColors.grey),
          ),
          verticalSpace(height: 16),

          SizedBox(
            width: 250.w,
            child: Text(
              productModel.title ?? "",
              style: Styles.textTitle24SemiBold,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              softWrap: true,
            ),
          ),

          verticalSpace(height: 10),

          Row(
            children: [
              SvgPicture.asset('assets/svgs/rating_icon.svg'),
              horizontalSpace(width: 5),
              Text(
                '${productModel.rating?.rate}',
                style: Styles.textTitle14SemiBold.copyWith(color: AppColors.darkGrey),
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
          verticalSpace(height: 10),

          Text(
            productModel.description ?? "",
            style: Styles.textTitle14SemiBold.copyWith(color: AppColors.darkGrey),
            ),
        ],
      ),
    );
  }
}
