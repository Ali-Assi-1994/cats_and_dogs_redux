import 'package:redux_cats_and_dogs/domain/pet_model.dart';
import 'package:redux_cats_and_dogs/redux/actions/pets_actions.dart';
import 'package:redux_cats_and_dogs/redux/state/app_state.dart';

AppState appReducer(AppState oldState, action) {
  print('Action: $action');

  /// dogs actions
  if (action is FetchDogs) {
    return oldState.copyWith(
      dogsState: oldState.dogsState.copyWith(
        pets: oldState.dogsState.pets,
        isLoading: true,
        error: null,
        page: oldState.dogsState.page + 1,
        limit: oldState.dogsState.limit + 1,
      ),
    );
  } else if (action is SuccessFetchDogs) {
    List<Pet> pets = oldState.dogsState.pets ?? [];
    pets.addAll(action.pets);
    return oldState.copyWith(
      dogsState: oldState.dogsState.copyWith(
        pets: pets,
        isLoading: false,
        error: null,
      ),
    );
  } else if (action is ErrorFetchDogs) {
    return oldState.copyWith(
      dogsState: oldState.dogsState.copyWith(
        pets: oldState.dogsState.pets,
        isLoading: false,
        error: action.error,
      ),
    );
  } else

  /// cats actions
  if (action is FetchCats) {
    return oldState.copyWith(
      catsState: oldState.catsState.copyWith(
        pets: oldState.catsState.pets,
        isLoading: true,
        error: null,
        page: oldState.catsState.page + 1,
        limit: oldState.catsState.limit + 1,
      ),
    );
  } else if (action is SuccessFetchCats) {
    List<Pet> pets = oldState.catsState.pets ?? [];
    pets.addAll(action.pets);
    return oldState.copyWith(
      catsState: oldState.catsState.copyWith(
        pets: pets,
        isLoading: false,
        error: null,
      ),
    );
  } else if (action is ErrorFetchCats) {
    return oldState.copyWith(
      catsState: oldState.catsState.copyWith(
        pets: oldState.catsState.pets,
        isLoading: false,
        error: action.error,
      ),
    );
  }

  /// selected tab actions
  else if (action is SelectedTabAction) {
    return oldState.copyWith(
      selectedTab: action.selectedTab,
    );
  } else {
    return oldState;
  }
}
