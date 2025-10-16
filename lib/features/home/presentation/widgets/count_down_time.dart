import 'package:flutter/material.dart';
import 'package:flutter_countdown_timer/flutter_countdown_timer.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/theming/colors.dart';
import '../../../../core/theming/text_styles.dart';

class CountdownTime extends StatelessWidget {
  final Duration duration;


  const CountdownTime({super.key, required this.duration});

  @override
  Widget build(BuildContext context) {
    final int endTime = DateTime.now().millisecondsSinceEpoch + duration.inMilliseconds;

    return Container(
      width: 107.w,
      height: 30.h,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: AppColors.darkRed,
        borderRadius: BorderRadius.circular(20.r),
      ),
      child: CountdownTimer(
        endTime: endTime,
        widgetBuilder: (_, time) {
          if (time == null) {
            return Text(
              "${0} : ${0}: ${0}",
              style: Styles.textTitle14Medium.copyWith(color: AppColors.white),
            );
          }
          return RichText(
            text: TextSpan(
              style: Styles.textTitle14Medium,
              children: [
                TextSpan(text: '${time.hours ?? 0} : '),
                TextSpan(text: '${time.min ?? 0} : '),
                TextSpan(text: '${time.sec ?? 0} '),
              ],
            ),
          );
        },
      ),
    );
  }
}
