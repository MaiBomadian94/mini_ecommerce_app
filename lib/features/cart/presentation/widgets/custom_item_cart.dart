import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mini_ecommerce_app/core/helpers/spacing.dart';
import 'package:mini_ecommerce_app/core/theming/colors.dart';
import 'package:mini_ecommerce_app/core/theming/text_styles.dart';
import 'package:mini_ecommerce_app/features/cart/data/models/cart_model.dart';
import 'package:mini_ecommerce_app/features/cart/presentation/bloc/bloc.dart';
import 'package:mini_ecommerce_app/features/cart/presentation/bloc/events.dart';
import '../../../../core/presentation/widgets/cached_network_image.dart';
import 'counter_widget.dart';

class CustomCartItem extends StatelessWidget {
  const CustomCartItem({super.key, required this.cartModel});

  final CartModel cartModel;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(16.r),
          child: CustomCachedNetworkImage(
            width: 160.w,
            height: 160.h,
            imageUrl: cartModel.product.image ?? '',
          ),
        ),
        horizontalSpace(width: 23),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                cartModel.product.category ?? "",
                style: Styles.textTitle12SemiBold.copyWith(
                  color: AppColors.grey,
                ),
              ),
              verticalSpace(height: 9),
              Text(
                cartModel.product.title ?? "",
                style: Styles.textTitle16SemiBold,
              ),
              verticalSpace(height: 18),

              Row(
                children: [
                  CounterWidget(
                    icon: Icons.add,
                    onTap: () {
                      context.read<CartBloc>().add(
                        AddToCartEvent(cartModel.product),
                      );
                    },
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 22.w),
                    child: Text(
                      cartModel.quantity.toString(),
                      style: Styles.textTitle16SemiBold,
                    ),
                  ),

                  CounterWidget(
                    icon: Icons.minimize_sharp,
                    yAxis: -8,
                    onTap: () {
                      context.read<CartBloc>().add(
                        RemoveFromCartEvent(cartModel.product),
                      );
                    },
                  ),
                ],
              ),

              verticalSpace(height: 35),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {},
                    child: SvgPicture.asset(
                      'assets/svgs/favorite.svg',
                      colorFilter: ColorFilter.mode(
                        AppColors.black,
                        BlendMode.srcIn,
                      ),
                      width: 19.w,
                      height: 18.h,
                    ),
                  ),
                  Text(
                    '\$ ${cartModel.product.price ?? 0}',
                    style: Styles.textTitle16SemiBold,
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
