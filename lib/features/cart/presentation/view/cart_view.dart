import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mini_ecommerce_app/core/helpers/spacing.dart';
import 'package:mini_ecommerce_app/core/presentation/widgets/custom_elevated_button.dart';
import 'package:mini_ecommerce_app/core/theming/colors.dart';
import 'package:mini_ecommerce_app/core/theming/text_styles.dart';
import 'package:mini_ecommerce_app/features/cart/presentation/bloc/bloc.dart';
import 'package:mini_ecommerce_app/features/cart/presentation/bloc/cart_states.dart';
import 'package:mini_ecommerce_app/features/cart/presentation/widgets/cart_app_bar.dart';
import '../widgets/custom_item_cart.dart';
import '../widgets/custom_master_card.dart';

class CartView extends StatelessWidget {
  const CartView({super.key});

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
                CartAppBar(),
                CartList(),
                verticalSpace(height: 24),
                Divider(thickness: 1.2, color: Color(0xffdbdbdb)),
                verticalSpace(height: 22),
                Text('Shipping Information', style: Styles.textTitle20SemiBold),
                verticalSpace(height: 22),
                CustomMasterCard(),
                verticalSpace(height: 21),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Total (2 Items)', style: Styles.textTitle16SemiBold),
                    Text(r'$115.92', style: Styles.textTitle16SemiBold),
                  ],
                ),
                verticalSpace(height: 19),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Shipping Fee', style: Styles.textTitle16SemiBold),
                    Text(r'$0.00', style: Styles.textTitle16SemiBold),
                  ],
                ),
                verticalSpace(height: 19),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Taxes', style: Styles.textTitle16SemiBold),
                    Text(r'$0.00', style: Styles.textTitle16SemiBold),
                  ],
                ),
                verticalSpace(height: 30),

                Divider(thickness: 1.2, color: Color(0xffdbdbdb)),
                verticalSpace(height: 22),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Total', style: Styles.textTitle14SemiBold),
                        Text(r'$115.92', style: Styles.textTitle20Bold),
                      ],
                    ),
                    CustomElevatedButton(
                      vertical: 13,
                      horizontal: 50,
                      title: 'Checkout',
                      backgroundColor: AppColors.mainBlue,
                      onPressed: () {},
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class CartList extends StatelessWidget {
  const CartList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartBloc, CartState>(
      builder: (context, state) {
        if (state is CartUpdatedState) {
          final items = state.cartItems;

          return ListView.separated(
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),

            itemCount: items.length,
            itemBuilder: (context, index) =>
                CustomCartItem(productModel: items[index]),
            separatorBuilder: (context, index) => verticalSpace(height: 24),
          );
        }
        return Center(child: Text('No items in cart'));
      },
    );
  }
}
