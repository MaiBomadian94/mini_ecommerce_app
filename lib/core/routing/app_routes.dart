import 'package:flutter/material.dart';
import 'package:mini_ecommerce_app/core/routing/routes.dart';
import 'package:mini_ecommerce_app/features/cart/presentation/view/cart_view.dart';
import 'package:mini_ecommerce_app/features/home/data/models/product_model.dart';
import 'package:mini_ecommerce_app/features/home/presentation/view/product_details_view.dart';
import 'package:mini_ecommerce_app/features/layout/layout_view.dart';

import '../../features/home/presentation/view/home_view.dart';

class AppRoutes {
  static Route generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.homeView:
        return MaterialPageRoute(builder: (context) => const HomeView());

      case Routes.cartView:
        return MaterialPageRoute(builder: (context) => const CartView());

      case Routes.layout:
        return MaterialPageRoute(builder: (context) => const LayoutView());

      case Routes.productDetailsView:
        final product = settings.arguments as ProductModel;

        return MaterialPageRoute(
          builder: (context) => ProductDetailsView(productModel: product,),
        );

      default:
        return MaterialPageRoute(

          builder: (context) => Scaffold(
            body: Center(child: Text('No roure defined for ${settings.name}')),
          ),
        );
    }
  }
}
