import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mini_ecommerce_app/core/theming/colors.dart';
import '../../../features/layout/widgets/selected_navigation_icon.dart';
import '../../../features/layout/widgets/un_selected_navigation_icon.dart';
import '../../theming/text_styles.dart';
import '../bloc/navigation_bloc/bloc.dart';
import '../bloc/navigation_bloc/events.dart';
import '../bloc/navigation_bloc/states.dart';


class CustomBottomNavigationBar extends StatelessWidget {
  const CustomBottomNavigationBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 86,
      decoration: BoxDecoration(
        shape: BoxShape.rectangle,
        boxShadow: [
          BoxShadow(
            color: AppColors.babyBlue,
            blurRadius: 20,
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20.r),
          topRight: Radius.circular(20.r),
        ),
        child: Directionality(
          textDirection: TextDirection.ltr,
          child: BlocBuilder<BottomNavigationBloc, NavigationStates>(
            builder: (context, state) {
              int currentIndex = 0;

              if (state is ChangeIndexState) {
                currentIndex = state.currentIndex;
              }
              return BottomNavigationBar(
                showSelectedLabels: true,
                showUnselectedLabels: false,
                selectedLabelStyle:
                Styles.textTitle14Medium.copyWith(fontWeight: FontWeight.w600),
                backgroundColor: Colors.white,
                type: BottomNavigationBarType.fixed,
                onTap: (index) {
                  context
                      .read<BottomNavigationBloc>()
                      .add(ChangePageEvent(currentIndex: index));
                },
                currentIndex: currentIndex,
                items:  [
                  BottomNavigationBarItem(
                    activeIcon: SelectedNavigationIcon(
                      svgAsset: 'assets/svgs/home.svg',
                      label: 'Home',
                    ),
                    icon: SvgPicture.asset('assets/svgs/home.svg',colorFilter: ColorFilter.mode(
                        AppColors.darkGrey, BlendMode.srcIn),),
                    label: '',
                  ),
                  BottomNavigationBarItem(
                    activeIcon: SelectedNavigationIcon(
                      svgAsset: 'assets/svgs/favorite.svg',
                      label: 'Favorite',
                    ),
                    icon: UnSelectedNavigationIcon(
                      svgAsset: 'assets/svgs/favorite.svg',
                      label: '',
                    ),
                    label: '',
                  ),
                  BottomNavigationBarItem(
                    activeIcon: SelectedNavigationIcon(
                      svgAsset: 'assets/svgs/cart.svg',
                      label: 'Cart',
                    ),
                    icon: UnSelectedNavigationIcon(
                      svgAsset: 'assets/svgs/cart.svg',
                      label: '',
                    ),
                    label: '',
                  ),
                  BottomNavigationBarItem(
                    activeIcon: SelectedNavigationIcon(
                      svgAsset: 'assets/svgs/user.svg',
                      label: 'Profile',
                    ),
                    icon: UnSelectedNavigationIcon(
                      svgAsset: 'assets/svgs/user.svg',
                      label: '',
                    ),
                    label: '',
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
