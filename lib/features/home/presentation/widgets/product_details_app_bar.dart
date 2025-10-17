import 'package:flutter/material.dart';
import 'package:mini_ecommerce_app/core/helpers/extensions.dart';

import 'custom_circular_icon.dart';

class ProductDetailsAppBar extends StatelessWidget {
  const ProductDetailsAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,

      children: [
        InkWell(
          onTap: () => context.pop(),
          child: CustomCircularIcon(isIcon: true),
        ),
        CustomCircularIcon(svgPath: 'assets/svgs/cart.svg'),
      ],
    );
  }
}
