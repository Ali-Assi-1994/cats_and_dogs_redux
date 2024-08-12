import 'package:redux_cats_and_dogs/features/pets/domain/pet_model.dart';
import 'package:redux_cats_and_dogs/features/pets/application/actions/dogs_actions.dart';
import 'package:redux_cats_and_dogs/features/pets/domain/pets_state.dart';

PetsState dogsReducer(PetsState oldState, action) {
  if (action is FetchDogs) {
    return oldState.copyWith(
      pets: oldState.pets,
      isLoading: true,
      error: null,
      // page: oldState.page + 1,
      // limit: oldState.limit + 1,
    );
  } else if (action is SuccessFetchDogs) {
    List<Pet> pets = oldState.pets ?? [];
    pets.addAll(action.pets);
    return oldState.copyWith(
      pets: pets,
      isLoading: false,
      error: null,
      page: oldState.page + 1,
    );
  } else if (action is ErrorFetchDogs) {
    return oldState.copyWith(
      pets: oldState.pets,
      isLoading: false,
      error: action.error,
    );
  } else {
    return oldState;
  }
}
