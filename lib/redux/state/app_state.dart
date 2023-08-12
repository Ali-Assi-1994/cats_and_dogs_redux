import 'package:redux_cats_and_dogs/redux/state/pets_state.dart';

class AppState {
  final PetsState dogsState;
  final PetsState catsState;
  final int selectedTab;

  AppState({
    required this.dogsState,
    required this.catsState,
    required this.selectedTab,
  });

  AppState.empty()
      : dogsState = PetsState.empty(),
        catsState = PetsState.empty(),
        selectedTab = 0;

  AppState copyWith({
    PetsState? dogsState,
    PetsState? catsState,
    int? selectedTab,
  }) {
    return AppState(
      dogsState: dogsState ?? this.dogsState,
      catsState: catsState ?? this.catsState,
      selectedTab: selectedTab ?? this.selectedTab,
    );
  }
}
