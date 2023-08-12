import 'package:redux_cats_and_dogs/domain/pet_model.dart';
import 'package:redux_cats_and_dogs/redux/actions/pets_actions.dart';
import 'package:redux_cats_and_dogs/redux/state/app_state.dart';

AppState appReducer(AppState oldState, action) {
  print('Action: $action');

  if (action is FetchPets) {
    return oldState.copyWith(
      pets: oldState.pets,
      isLoading: true,
      error: null,
      page: oldState.page + 1,
      limit: oldState.limit + 1,
    );
  } else if (action is SuccessFetchPets) {
    List<Pet> pets = oldState.pets ?? [];
    pets.addAll(action.pets);
    return oldState.copyWith(
      pets: pets,
      isLoading: false,
      error: null,
    );
  } else if (action is ErrorFetchPets) {
    return oldState.copyWith(
      pets: oldState.pets,
      isLoading: false,
      error: action.error,
    );
  } else {
    return oldState;
  }
}
