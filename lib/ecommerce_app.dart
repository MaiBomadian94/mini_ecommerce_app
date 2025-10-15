import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mini_ecommerce_app/core/routing/app_routes.dart';
import 'package:mini_ecommerce_app/core/theming/colors.dart';
import 'package:mini_ecommerce_app/features/home/presentation/bloc/bloc.dart';
import 'package:mini_ecommerce_app/features/home/presentation/bloc/events.dart';

import 'core/presentation/bloc/navigation_bloc/bloc.dart';
import 'core/routing/routes.dart';

class EcommerceApp extends StatelessWidget {
  const EcommerceApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => BottomNavigationBloc()),
        BlocProvider(create: (_) => HomeBloc()..add(GetProductsEvent())),
      ],
      child: ScreenUtilInit(
        designSize: const Size(430, 932),
        minTextAdapt: true,
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            scaffoldBackgroundColor: AppColors.white,
            primaryColor: AppColors.mainBlue,
          ),
          initialRoute: Routes.layout,
          onGenerateRoute: AppRoutes.generateRoute,
        ),
      ),
    );
  }
}
