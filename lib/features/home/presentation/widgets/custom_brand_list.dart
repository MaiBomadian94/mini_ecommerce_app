import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/helpers/spacing.dart';
import '../../data/models/brand_model.dart';
import 'brand_item.dart';

class CustomBrandList extends StatelessWidget {
  CustomBrandList({super.key});

  final List<BrandModel> brands = [
    BrandModel(brandLogo: 'assets/images/hm-logo.png', brandTitle: 'H&M'),
    BrandModel(brandLogo: 'assets/images/zara_logo.png', brandTitle: 'Zara'),
    BrandModel(brandLogo: 'assets/images/lacoste.png', brandTitle: 'Lacoste'),
    BrandModel(
      brandLogo: 'assets/images/hm-logo.png',
      brandTitle: 'Pull & Bear',
    ),
    BrandModel(brandLogo: 'assets/images/hm-logo.png', brandTitle: 'Ralph L'),
    BrandModel(brandLogo: 'assets/images/zara_logo.png', brandTitle: 'Zara'),
    BrandModel(brandLogo: 'assets/images/lacoste.png', brandTitle: 'Lacoste'),
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 105.h,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: brands.length,
        itemBuilder: (context, index) => BrandItem(brandModel: brands[index]),
        separatorBuilder: (context, index) => horizontalSpace(width: 20),
      ),
    );
  }
}
