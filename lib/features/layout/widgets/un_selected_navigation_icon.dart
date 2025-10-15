import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mini_ecommerce_app/core/helpers/spacing.dart';

import '../../../core/theming/colors.dart';
import '../../../core/theming/text_styles.dart';

class UnSelectedNavigationIcon extends StatelessWidget {
  const UnSelectedNavigationIcon(
      {super.key, required this.svgAsset, required this.label});

  final String svgAsset;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        SvgPicture.asset(
          svgAsset,
          fit: BoxFit.scaleDown,
        ),
        horizontalSpace(width: 4),
        Text(
          label,
          style: Styles.textTitle14Medium.copyWith(
            color: AppColors.mainBlue,
          ),
        )
      ],
    );
  }
}
