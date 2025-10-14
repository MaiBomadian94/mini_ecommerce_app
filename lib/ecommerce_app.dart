import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mini_ecommerce_app/core/routing/app_routes.dart';
import 'package:mini_ecommerce_app/core/theming/colors.dart';

import 'core/routing/routes.dart';

class EcommerceApp extends StatelessWidget {
  const EcommerceApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(430, 932),
      minTextAdapt: true,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          scaffoldBackgroundColor: AppColors.white,
          primaryColor: AppColors.mainBlue,
        ),
        initialRoute: Routes.homeView,
        onGenerateRoute: AppRoutes.generateRoute,
      ),
    );
  }
}
