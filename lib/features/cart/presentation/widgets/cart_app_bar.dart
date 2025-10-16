import 'package:flutter/material.dart';

import '../../../../core/theming/text_styles.dart';
import '../../../home/presentation/widgets/custom_circular_icon.dart';

class CartAppBar extends StatelessWidget {
  const CartAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,

      children: [
        CustomCircularIcon(isIcon: true,),
        Text('Cart', style: Styles.textTitle20Bold),
        CustomCircularIcon(svgPath: 'assets/svgs/favorite.svg'),
      ],
    );
  }
}
