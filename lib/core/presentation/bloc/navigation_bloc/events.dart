
abstract class NavigationEvent {}

class ChangePageEvent extends NavigationEvent {
  final int currentIndex;

  ChangePageEvent({required this.currentIndex});
}
