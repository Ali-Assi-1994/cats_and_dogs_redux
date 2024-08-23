import 'package:redux/redux.dart';
import 'package:redux_cats_and_dogs/features/pets/data/pets_repository.dart';
import 'package:redux_cats_and_dogs/features/pets/application/actions/cats_actions.dart';
import 'package:redux_cats_and_dogs/features/pets/application/actions/dogs_actions.dart';
import 'package:redux_cats_and_dogs/redux/state/app_state.dart';

class CatsMiddleware extends MiddlewareClass<AppState> {
  final CatsRepo catsRepo;

  CatsMiddleware({required this.catsRepo});

  @override
  call(Store<AppState> store, action, NextDispatcher next) {
    if (action is FetchCats) {
      catsRepo.loadListOfPets(page: store.state.catsState.page).then((cats) {
        if (cats != null) {
          store.dispatch(SuccessFetchCats(cats));
        }
      }).catchError((error) {
        store.dispatch(ErrorFetchCats('Error loading cats ${error.toString()}'));
      });
    }
    next(action);
  }
}

class DogsMiddleware extends MiddlewareClass<AppState> {
  final DogsRepo dogsRepo;

  DogsMiddleware({required this.dogsRepo});

  @override
  call(Store<AppState> store, action, NextDispatcher next) {
    if (action is FetchDogs) {
      dogsRepo.loadListOfPets(page: store.state.dogsState.page).then((dogs) {
        if (dogs != null) {
          store.dispatch(SuccessFetchDogs(dogs));
        }
      }).catchError((error) {
        store.dispatch(ErrorFetchDogs('Error loading dogs ${error.toString()}'));
      });
    }
    next(action);
  }
}
