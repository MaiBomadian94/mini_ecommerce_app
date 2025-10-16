import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mini_ecommerce_app/core/presentation/widgets/custom_shimmer_widget.dart';
import 'package:mini_ecommerce_app/features/home/presentation/bloc/bloc.dart';
import 'package:mini_ecommerce_app/features/home/presentation/bloc/states.dart';

import '../../../../core/helpers/spacing.dart';
import '../../../../core/theming/text_styles.dart';
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
      child: BlocBuilder<HomeBloc, HomeStates>(
        buildWhen: (prev, curr) =>
            curr is LoadingCategoriesState ||
            curr is SuccessCategoriesState ||
            curr is FailureCategoriesState,
        builder: (context, state) {
          if (state is LoadingCategoriesState) {
            return ListView.separated(
              scrollDirection: Axis.horizontal,
              itemCount: 5,
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    CustomShimmerWidget(width: 66, height: 66),
                    verticalSpace(height: 15),
                    CustomShimmerWidget(width: 72, height: 19),

                  ],
                );
              },
              separatorBuilder: (context, index) => horizontalSpace(width: 20),
            );
          } else if (state is SuccessCategoriesState) {
            return ListView.separated(
              scrollDirection: Axis.horizontal,
              itemCount: state.category.length,
              itemBuilder: (context, index) {
                final categories = state.category;
                return BrandItem(
                  brandModel: brands[index],
                  categoryModel: categories[index],
                );
              },
              separatorBuilder: (context, index) => horizontalSpace(width: 20),
            );
          } else if (state is FailureCategoriesState) {
            return Center(
              child: Text(state.message, style: Styles.textTitle16Medium),
            );
          } else {
            return SizedBox.shrink();
          }
        },
      ),
    );
  }
}
