import 'package:flutter/material.dart';
import 'package:mini_ecommerce_app/core/routing/routes.dart';
import 'package:mini_ecommerce_app/features/layout/layout_view.dart';

import '../../features/home/presentation/view/home_view.dart';

class AppRoutes {
  static Route generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.homeView:
        return MaterialPageRoute(builder: (context) => const HomeView());

      case Routes.cartView:
        return MaterialPageRoute(builder: (context) => const SizedBox());

      case Routes.layout:
        return MaterialPageRoute(builder: (context) => const LayoutView());


      default:
        return MaterialPageRoute(
          builder: (context) => Scaffold(
            body: Center(child: Text('No roure defined for ${settings.name}')),
          ),
        );
    }
  }
}
