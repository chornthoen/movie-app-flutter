part of 'navigation_cubit.dart';

class NavigationState extends Equatable {
  const NavigationState({
    this.indexTab = 0,
  });

  final int indexTab;

  // copy with
  NavigationState copyWith({
    int? indexTab,
  }) {
    return NavigationState(
      indexTab: indexTab ?? this.indexTab,
    );
  }

  @override
  List<Object> get props => [indexTab];
}
