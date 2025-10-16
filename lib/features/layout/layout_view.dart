import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mini_ecommerce_app/features/cart/presentation/view/cart_view.dart';
import '../../core/presentation/bloc/navigation_bloc/bloc.dart';
import '../../core/presentation/bloc/navigation_bloc/states.dart';
import '../../core/presentation/widgets/custom_bottom_navigation_bar.dart';
import '../home/presentation/view/home_view.dart';

class LayoutView extends StatefulWidget {
  const LayoutView({super.key});

  @override
  State<LayoutView> createState() => _LayoutViewState();
}

class _LayoutViewState extends State<LayoutView> {
  Widget _getCurrentScreen(int index) {
    switch (index) {
      case 0:
        return const HomeView();
      case 1:
        return const SizedBox();
      case 2:
        return const CartView();
      case 3:
        return const SizedBox();
      default:
        return const HomeView();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<BottomNavigationBloc, NavigationStates>(
        builder: (context, state) {
          int currentIndex = 0;

          if (state is ChangeIndexState) {
            currentIndex = state.currentIndex;
          }

          return _getCurrentScreen(currentIndex);
        },
      ),
      bottomNavigationBar: const CustomBottomNavigationBar(),
    );
  }
}
