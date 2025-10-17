import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mini_ecommerce_app/core/helpers/spacing.dart';
import 'package:mini_ecommerce_app/core/presentation/widgets/custom_elevated_button.dart';
import 'package:mini_ecommerce_app/core/theming/colors.dart';
import 'package:mini_ecommerce_app/features/home/data/models/product_model.dart';

import '../../../../core/presentation/widgets/cached_network_image.dart';
import '../../../cart/presentation/bloc/bloc.dart';
import '../../../cart/presentation/bloc/events.dart';
import '../widgets/product_details_app_bar.dart';
import '../widgets/product_details_card.dart';

class ProductDetailsView extends StatelessWidget {
  const ProductDetailsView({super.key, required this.productModel});

  final ProductModel productModel;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      child: Scaffold(
        body: Column(
          children: [
            verticalSpace(height: 30),

            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: ProductDetailsAppBar(),
            ),

            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    CustomCachedNetworkImage(
                      height: 500,
                      imageUrl: productModel.image ?? '',
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 16.w,
                        vertical: 16.h,
                      ),
                      child: Column(
                        children: [
                          ProductsDetailsCard(productModel: productModel),
                          verticalSpace(height: 16),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
        bottomNavigationBar: Padding(
          padding: EdgeInsets.all(16.0),
          child: CustomElevatedButton(
            radius: 8,
            vertical: 20,
            horizontal: 30,
            title: 'Add to cart',
            backgroundColor: AppColors.mainBlue,
            onPressed: () {
              context.read<CartBloc>().add(
                AddToCartEvent(productModel),
              );
            },
          ),
        ),
      ),
    );
  }
}
