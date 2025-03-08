abstract class NavigationState {
  final int tabIndex;
  NavigationState(this.tabIndex);
}

class NavigationInitial extends NavigationState {
  NavigationInitial() : super(0);
}

class NavigationLoaded extends NavigationState {
  NavigationLoaded(int tabIndex) : super(tabIndex);
}
