import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/theming/colors.dart';

class CounterWidget extends StatelessWidget {
  const CounterWidget({super.key, this.icon, this.yAxis, this.onTap});

  final IconData? icon;
  final double? yAxis;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 28.w,
        height: 28.h,
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(4.r),
          border: Border.all(color: AppColors.lightGrey, width: 1),
        ),
        child: Transform.translate(
          offset: Offset(0, yAxis ?? -0),
          child: Icon(icon, size: 25),
        ),
      ),
    );
  }
}
