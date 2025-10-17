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
  int currentIndex =0;
  final List<Widget> screens = [HomeView(), SizedBox(), CartView(), SizedBox()];



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<BottomNavigationBloc, NavigationStates>(
        builder: (context, state) {

          if (state is ChangeIndexState) {
            currentIndex = state.currentIndex;
          }

          return IndexedStack(
            index: currentIndex,
            children: screens,
          );
        },
      ),
      bottomNavigationBar: const CustomBottomNavigationBar(),
    );
  }
}
