import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mini_ecommerce_app/core/helpers/spacing.dart';
import 'package:mini_ecommerce_app/core/presentation/widgets/custom_elevated_button.dart';
import 'package:mini_ecommerce_app/core/theming/colors.dart';
import 'package:mini_ecommerce_app/core/theming/text_styles.dart';
import 'package:mini_ecommerce_app/features/cart/presentation/bloc/bloc.dart';
import 'package:mini_ecommerce_app/features/cart/presentation/bloc/states.dart';
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
                verticalSpace(height: 30),
                BlocBuilder<CartBloc, CartState>(
                  builder: (context, state) {
                    if (state is CartUpdatedState &&
                        state.cartItems.isNotEmpty) {
                      return Column(
                        children: [
                          ListView.separated(
                            scrollDirection: Axis.vertical,
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),

                            itemCount: state.cartItems.length,
                            itemBuilder: (context, index) => CustomCartItem(
                              cartModel: state.cartItems[index],
                            ),
                            separatorBuilder: (context, index) =>
                                verticalSpace(height: 24),
                          ),
                          verticalSpace(height: 24),
                          Divider(thickness: 1.2, color: Color(0xffdbdbdb)),
                          verticalSpace(height: 22),
                          Text(
                            'Shipping Information',
                            style: Styles.textTitle20SemiBold,
                          ),
                          verticalSpace(height: 22),
                          CustomMasterCard(),
                          verticalSpace(height: 21),
                          buildRow(
                            title: 'Total (${state.cartItems.length}) Item',
                            price: '\$${state.totalPrice.toStringAsFixed(2)}',
                          ),
                          verticalSpace(height: 19),
                          buildRow(title: 'Shipping Fee', price: r'$0.00'),
                          verticalSpace(height: 19),
                          buildRow(title: 'Taxes', price: r'$0.00'),
                          verticalSpace(height: 30),

                          Divider(thickness: 1.2, color: Color(0xffdbdbdb)),
                          verticalSpace(height: 22),

                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Total',
                                    style: Styles.textTitle14SemiBold,
                                  ),
                                  Text(
                                    '\$${state.totalPrice.toStringAsFixed(2)}',
                                    style: Styles.textTitle20Bold,
                                  ),
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
                      );
                    }
                    return Center(
                      child: Text(
                        'No Products in your cart',
                        style: Styles.textTitle16SemiBold,
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Row buildRow({required String title, required String price}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title, style: Styles.textTitle16SemiBold),
        Text(price, style: Styles.textTitle16SemiBold),
      ],
    );
  }
}
