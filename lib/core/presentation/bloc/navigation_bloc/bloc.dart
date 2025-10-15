import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mini_ecommerce_app/core/presentation/bloc/navigation_bloc/states.dart';

import 'events.dart';

class BottomNavigationBloc extends Bloc<NavigationEvent, NavigationStates> {
  int currentIndex = 0;

  BottomNavigationBloc() : super(NavigationInitialState()) {
    on<ChangePageEvent>((event, emit) {
      changeIndex(event.currentIndex, emit);
    });
  }

  void changeIndex(int index, Emitter<NavigationStates> emit) {
    currentIndex = index;
    emit(ChangeIndexState(currentIndex: currentIndex));
  }
}
