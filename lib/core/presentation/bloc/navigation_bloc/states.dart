
abstract class NavigationStates {}

class NavigationInitialState extends NavigationStates {}

class ChangeIndexState extends NavigationStates {
  final int currentIndex;
  ChangeIndexState({required this.currentIndex});
}
