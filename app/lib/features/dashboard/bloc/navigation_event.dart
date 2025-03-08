abstract class NavigationEvent {}

class TabChangeEvent extends NavigationEvent {
  final int tabIndex;
  TabChangeEvent(this.tabIndex);
}
