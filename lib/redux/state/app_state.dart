import 'package:equatable/equatable.dart';
import 'package:redux_cats_and_dogs/features/auth/domain/auth_state.dart';
import 'package:redux_cats_and_dogs/features/home/domain/bottom_state_navigation_model.dart';
import 'package:redux_cats_and_dogs/features/pets/domain/pets_state.dart';

class AppState extends Equatable {
  final PetsState dogsState;
  final PetsState catsState;
  final BottomStateNavigationModel selectedTab;
  final AuthState authState;

  const AppState({
    required this.dogsState,
    required this.catsState,
    required this.selectedTab,
    required this.authState,
  });

  const AppState.empty()
      : dogsState = const PetsState.empty(),
        catsState = const PetsState.empty(),
        authState = const AuthState.empty(),
        selectedTab = const BottomStateNavigationModel(selectedTabIndex: 0);

  AppState copyWith({
    PetsState? dogsState,
    PetsState? catsState,
    BottomStateNavigationModel? selectedTab,
    AuthState? authState,
  }) {
    return AppState(
      dogsState: dogsState ?? this.dogsState,
      catsState: catsState ?? this.catsState,
      authState: authState ?? this.authState,
      selectedTab: selectedTab ?? this.selectedTab,
    );
  }

  @override
  List<Object?> get props => [dogsState, catsState, selectedTab, authState];
}
