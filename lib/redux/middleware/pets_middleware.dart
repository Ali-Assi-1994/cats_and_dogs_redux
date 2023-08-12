import 'package:redux/redux.dart';
import 'package:redux_cats_and_dogs/data/pets_repository.dart';
import 'package:redux_cats_and_dogs/redux/actions/pets_actions.dart';
import 'package:redux_cats_and_dogs/redux/state/app_state.dart';

void loadPetsMiddleware(
  Store<AppState> store,
  action,
  NextDispatcher next,
) async {
  if (action is FetchPets) {
    final dogsRepo = DogsRepo();
    dogsRepo.loadListOfPets(limit: store.state.limit, page: store.state.page).then((dogs) {
      if (dogs != null) {
        store.dispatch(SuccessFetchPets(dogs));
      }
    }).catchError((error) {
      store.dispatch(ErrorFetchPets('Error loading dogs ${error.toString()}'));
    });
  }
  next(action);
}
