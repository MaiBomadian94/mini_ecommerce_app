import 'package:flutter/material.dart';
import 'package:mini_ecommerce_app/core/routing/routes.dart';

class AppRoutes {
  static Route generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.homeView:
        return MaterialPageRoute(builder: (context) => const SizedBox());

      case Routes.cartView:
        return MaterialPageRoute(builder: (context) => const SizedBox());

      default:
        return MaterialPageRoute(
          builder: (context) => Scaffold(
            body: Center(child: Text('No roure defined for ${settings.name}')),
          ),
        );
    }
  }
}
