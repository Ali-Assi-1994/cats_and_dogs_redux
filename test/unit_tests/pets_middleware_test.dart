import 'package:flutter_test/flutter_test.dart';
import 'package:redux/redux.dart';

import 'package:redux_cats_and_dogs/features/pets/application/actions/cats_actions.dart';
import 'package:redux_cats_and_dogs/features/pets/application/middlewares/pets_middleware_class.dart';
import 'package:redux_cats_and_dogs/features/pets/domain/pet_model.dart';
import 'package:redux_cats_and_dogs/features/pets/domain/pets_state.dart';
import 'package:redux_cats_and_dogs/redux/reducers/app_reducer.dart';
import 'package:redux_cats_and_dogs/redux/state/app_state.dart';

import '../mocked_data/cats_mocked_data.dart';
import '../mocked_data/mocked_redux.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  group('Cats Middleware', () {
    CatsRepoMock catsRepoMock = CatsRepoMock();
    CatsMiddleware catsMiddleware = CatsMiddleware(catsRepo: catsRepoMock);

    Store<AppState> store = Store(
      appReducer,
      initialState: const AppState.empty(),
      middleware: [catsMiddleware],
    );

    test('Fetch Cats', () async {
      List<Pet> catsList = catsMockedJsonList.map((i) => Pet.fromJson(i)).toList().sublist(0, 10);
      const fetchAction = FetchCats();
      expect(store.state.catsState.pets, const PetsState.empty().pets);

      await catsMiddleware.call(store, fetchAction, (_) {});
      expect(store.state.catsState.pets, catsList);
    });
  });
}
