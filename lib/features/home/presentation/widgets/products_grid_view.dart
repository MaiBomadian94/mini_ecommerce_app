import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mini_ecommerce_app/core/helpers/extensions.dart';
import 'package:mini_ecommerce_app/core/presentation/widgets/custom_shimmer_widget.dart';
import 'package:mini_ecommerce_app/features/home/presentation/bloc/states.dart';
import 'package:mini_ecommerce_app/features/home/presentation/widgets/product_card.dart';

import '../../../../core/routing/routes.dart';
import '../../../../core/theming/text_styles.dart';
import '../bloc/bloc.dart';

class ProductsGridView extends StatelessWidget {
  const ProductsGridView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeStates>(
      buildWhen: (prev, curr) =>
          curr is LoadingProductsState ||
          curr is SuccessHomeState ||
          curr is FailureProductsState,
      builder: (context, state) {
        if (state is LoadingProductsState) {
          return GridView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 16.w,
              mainAxisSpacing: 16.h,
              childAspectRatio: 0.7,
            ),
            itemCount: 6,
            itemBuilder: (context, index) {
              return CustomShimmerWidget();
            },
          );
        } else if (state is SuccessHomeState) {
          return GridView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 16.w,
              mainAxisSpacing: 16.h,
              childAspectRatio: 0.7,
            ),
            itemCount: state.products.length,
            itemBuilder: (context, index) {
              final product = state.products;

              return InkWell(
                onTap: () {
                  context.pushNamed(
                    Routes.productDetailsView,
                    arguments: product[index],
                  );
                },
                child: CustomProductCard(productModel: product[index]),
              );
            },
          );
        } else if (state is FailureProductsState) {
          return Center(
            child: Text(state.message, style: Styles.textTitle16Medium),
          );
        } else {
          return const SizedBox.shrink();
        }
      },
    );
  }
}
