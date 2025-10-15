
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
  final List<Widget> _screens = [
    const HomeView(),
    const HomeView(),
    const HomeView(),
    const HomeView(),
    const HomeView(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<BottomNavigationBloc, NavigationStates>(
        builder: (context, state) {
          int currentIndex = 4;

          if (state is ChangeIndexState) {
            currentIndex = state.currentIndex;
          }

          return _screens[currentIndex];
        },
      ),
       bottomNavigationBar: const CustomBottomNavigationBar(),
    );
  }
}
