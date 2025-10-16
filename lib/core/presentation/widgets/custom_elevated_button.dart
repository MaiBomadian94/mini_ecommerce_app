import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../theming/colors.dart';
import '../../theming/text_styles.dart';

class CustomElevatedButton extends StatelessWidget {
  const CustomElevatedButton({
    super.key,
    required this.title,
    required this.backgroundColor,
    this.textColor,
    this.fontSize,
    this.fontWeight,
    required this.onPressed,
    this.radius,
    this.vertical,
    this.horizontal,
  });

  final String title;
  final Color backgroundColor;
  final Color? textColor;
  final double? vertical;
  final double? horizontal;

  final double? fontSize;
  final FontWeight? fontWeight;
  final void Function() onPressed;
  final double? radius;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: ElevatedButton(
        style: ButtonStyle(
          padding: WidgetStateProperty.all(
            EdgeInsets.symmetric(
              vertical: vertical ?? 8.h,
              horizontal: horizontal ?? 16.w,
            ),
          ),
          backgroundColor: WidgetStateProperty.all(backgroundColor),
          shape: WidgetStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(radius ?? 30.r),
            ),
          ),
        ),

        onPressed: onPressed,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              title,
              style: Styles.textTitle16SemiBold.copyWith(
                color: textColor ?? AppColors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
