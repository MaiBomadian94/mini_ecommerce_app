import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mini_ecommerce_app/core/helpers/spacing.dart';
import 'package:mini_ecommerce_app/core/theming/text_styles.dart';
import 'package:mini_ecommerce_app/features/home/data/models/product_model.dart';

import '../../../../core/presentation/widgets/cached_network_image.dart';

class CustomProductCard extends StatelessWidget {
  const CustomProductCard({super.key, required this.productModel});

  final ProductModel productModel;

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomCachedNetworkImage(
            width: 183,
            height: 183,
            imageUrl: productModel.image ?? '',
          ),
          verticalSpace(height: 15),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                child: Text(
                  productModel.title ?? "",
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
                    '${productModel.rating?.rate}',
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
                '\$ ${productModel.price ?? 0}',
                style: Styles.textTitle16SemiBold,
                overflow: TextOverflow.ellipsis,
              ),
              GestureDetector(
                onTap: () {},
                child: Icon(Icons.shopping_cart_outlined),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
