import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mini_ecommerce_app/features/home/presentation/bloc/states.dart';
import 'package:mini_ecommerce_app/features/home/presentation/widgets/product_card.dart';

import '../bloc/bloc.dart';

class ProductsGridView extends StatelessWidget {
  const ProductsGridView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeStates>(
      builder: (context, state) {
        if (state is LoadingHomeState) {
          return const Center(child: CircularProgressIndicator());
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

              return CustomProductCard(productModel: product[index]);
            },
          );
        } else if (state is FailureHomeState) {
          return Center(child: Text(state.message));
        } else {
          return const SizedBox.shrink();
        }
      },
    );
  }
}
