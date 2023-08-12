import 'package:equatable/equatable.dart';
import 'package:redux_cats_and_dogs/redux/state/auth_state.dart';
import 'package:redux_cats_and_dogs/redux/state/pets_state.dart';

class AppState extends Equatable {
  final PetsState dogsState;
  final PetsState catsState;
  final int selectedTab;
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
        selectedTab = 0;

  AppState copyWith({
    PetsState? dogsState,
    PetsState? catsState,
    int? selectedTab,
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
