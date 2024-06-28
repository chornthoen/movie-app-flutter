import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'navigation_state.dart';

class NavigationCubit extends Cubit<NavigationState> {
  NavigationCubit() : super(const NavigationState(indexTab: 0));

  void changeIndex(int index) {
    emit(state.copyWith(indexTab: index));
  }
}
