import 'package:bloc/bloc.dart';
import 'navigation_event.dart';
import 'navigation_state.dart';

class NavigationBloc extends Bloc<NavigationEvent, NavigationState> {
  NavigationBloc() : super(NavigationInitial()) {
    on<TabChangeEvent>((event, emit) {
      emit(NavigationLoaded(event.tabIndex));
    });
  }
}
