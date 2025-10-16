import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mini_ecommerce_app/core/helpers/spacing.dart';
import 'package:mini_ecommerce_app/core/theming/colors.dart';
import 'package:mini_ecommerce_app/core/theming/text_styles.dart';
import 'package:mini_ecommerce_app/features/home/data/models/brand_model.dart';
import 'package:mini_ecommerce_app/features/home/data/models/category_model.dart';

class BrandItem extends StatelessWidget {
  const BrandItem({
    super.key,
    required this.brandModel,
    required this.categoryModel,
  });

  final BrandModel brandModel;
  final CategoryModel categoryModel;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircleAvatar(
          backgroundColor: AppColors.brandBackground,
          radius: 33.r,
          child: Image.asset(brandModel.brandLogo),
        ),
        verticalSpace(height: 15),
        Text(categoryModel.categoryName, style: Styles.textTitle14SemiBold),
      ],
    );
  }
}
