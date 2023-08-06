import 'package:redux_cats_and_dogs/redux/actions/pets_actions.dart';
import 'package:redux_cats_and_dogs/redux/state/app_state.dart';

AppState reducer(AppState oldState, action) {
  print('Action: $action');

  if (action is FetchPets) {
    return AppState(
      pets: oldState.pets,
      isLoading: true,
      error: null,
    );
  } else if (action is SuccessFetchPets) {
    return AppState(
      pets: action.pets,
      isLoading: false,
      error: null,
    );
  } else if (action is ErrorFetchPets) {
    return AppState(
      pets: oldState.pets,
      isLoading: false,
      error: action.error,
    );
  } else {
    return oldState;
  }

  // AppState s =  switch (action) {
  //   FetchPets => state.copyWith(
  //       isLoading: true,
  //     ),
  //   SuccessFetchPets => state.copyWith(
  //       isLoading: false,
  //       pets: action.pets,
  //       error: null,
  //     ),
  //   ErrorFetchPets => state.copyWith(
  //       isLoading: false,
  //       error: action.error,
  //       pets: state.pets,
  //     ),
  //   _ => state,
  // };
  // print('State pet length: ${s.pets?.length}');
  // return s;
}
