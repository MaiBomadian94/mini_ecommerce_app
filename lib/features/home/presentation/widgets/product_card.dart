import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mini_ecommerce_app/core/helpers/spacing.dart';
import 'package:mini_ecommerce_app/core/theming/colors.dart';
import 'package:mini_ecommerce_app/core/theming/text_styles.dart';
import 'package:mini_ecommerce_app/features/home/data/models/product_model.dart';

import '../../../../core/presentation/widgets/cached_network_image.dart';
import '../../../cart/presentation/bloc/bloc.dart';
import '../../../cart/presentation/bloc/events.dart';

class CustomProductCard extends StatefulWidget {
  const CustomProductCard({super.key, required this.productModel});

  final ProductModel productModel;

  @override
  State<CustomProductCard> createState() => _CustomProductCardState();
}

class _CustomProductCardState extends State<CustomProductCard> {
  bool isTapped = false;

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomCachedNetworkImage(
            width: 183,
            height: 183,
            imageUrl: widget.productModel.image ?? '',
          ),
          verticalSpace(height: 15),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                child: Text(
                  widget.productModel.title ?? "",
                  style: Styles.textTitle14SemiBold,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                ),
              ),
              Row(
                children: [
                  SvgPicture.asset('assets/svgs/rating_icon.svg'),
                  horizontalSpace(width: 5),
                  Text(
                    '${widget.productModel.rating?.rate}',
                    style: Styles.textTitle12SemiBold,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ],
          ),
          verticalSpace(height: 3),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '\$ ${widget.productModel.price ?? 0}',
                style: Styles.textTitle16SemiBold,
                overflow: TextOverflow.ellipsis,
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    isTapped = !isTapped;
                  });
                  context.read<CartBloc>().add(
                    AddToCartEvent(widget.productModel),
                  );
                },
                child: Icon(
                  Icons.shopping_cart_outlined,
                  color: isTapped ? AppColors.yellow : AppColors.black,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
