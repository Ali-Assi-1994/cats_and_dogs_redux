import 'package:redux_cats_and_dogs/redux/state/cats_state.dart';
import 'package:redux_cats_and_dogs/redux/state/dogs_state.dart';

class AppState {
  final DogsState dogsState;
  final CatsState catsState;
  final int selectedTab;

  AppState({
    required this.dogsState,
    required this.catsState,
    required this.selectedTab,
  });

  AppState.empty()
      : dogsState = DogsState.empty(),
        catsState = CatsState.empty(),
        selectedTab = 0;

  AppState copyWith({
    DogsState? dogsState,
    CatsState? catsState,
    int? selectedTab,
  }) {
    return AppState(
      dogsState: dogsState ?? this.dogsState,
      catsState: catsState ?? this.catsState,
      selectedTab: selectedTab ?? this.selectedTab,
    );
  }
}
