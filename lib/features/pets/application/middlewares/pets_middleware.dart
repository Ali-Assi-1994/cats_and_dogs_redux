import 'package:redux/redux.dart';
import 'package:redux_cats_and_dogs/features/pets/data/pets_repository.dart';
import 'package:redux_cats_and_dogs/features/pets/application/actions/cats_actions.dart';
import 'package:redux_cats_and_dogs/features/pets/application/actions/dogs_actions.dart';
import 'package:redux_cats_and_dogs/redux/state/app_state.dart';

void loadPetsMiddleware(
  Store<AppState> store,
  action,
  NextDispatcher next,
) async {
  if (action is FetchDogs) {
    final dogsRepo = DogsRepo();
    dogsRepo.loadListOfPets(limit: store.state.dogsState.limit, page: store.state.dogsState.page).then((dogs) {
      if (dogs != null) {
        store.dispatch(SuccessFetchDogs(dogs));
      }
    }).catchError((error) {
      store.dispatch(ErrorFetchDogs('Error loading dogs ${error.toString()}'));
    });
  } else if (action is FetchCats) {
    final catsRepo = CatsRepo();
    catsRepo.loadListOfPets(limit: store.state.catsState.limit, page: store.state.catsState.page).then((cats) {
      if (cats != null) {
        store.dispatch(SuccessFetchCats(cats));
      }
    }).catchError((error) {
      store.dispatch(ErrorFetchCats('Error loading cats ${error.toString()}'));
    });
  }
  next(action);
}
