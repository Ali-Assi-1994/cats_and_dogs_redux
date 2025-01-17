import 'package:redux_cats_and_dogs/features/pets/domain/pet_model.dart';
import 'package:redux_cats_and_dogs/features/pets/application/actions/cats_actions.dart';
import 'package:redux_cats_and_dogs/features/pets/domain/pets_state.dart';

PetsState catsReducer(PetsState oldState, action) {
  if (action is FetchCats) {
    return oldState.copyWith(
      pets: oldState.pets,
      isLoading: true,
      error: null,
    );
  } else if (action is SuccessFetchCats) {
    List<Pet> pets = oldState.pets ?? [];
    pets.addAll(action.pets);
    return oldState.copyWith(
      pets: pets,
      isLoading: false,
      error: null,
      page: oldState.page + 1,
    );
  } else if (action is ErrorFetchCats) {
    return oldState.copyWith(
      pets: oldState.pets,
      isLoading: false,
      error: action.error,
    );
  } else {
    return oldState;
  }
}
