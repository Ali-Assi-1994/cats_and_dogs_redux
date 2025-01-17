import 'package:flutter_test/flutter_test.dart';
import 'package:redux_cats_and_dogs/features/pets/application/actions/cats_actions.dart';
import 'package:redux_cats_and_dogs/features/pets/application/reducers/cats_reducer.dart';
import 'package:redux_cats_and_dogs/features/pets/domain/pet_model.dart';
import 'package:redux_cats_and_dogs/features/pets/domain/pets_state.dart';
import 'package:redux_cats_and_dogs/redux/actions/app_action.dart';

import '../mocked_data/cats_mocked_data.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  group('Cats Reducer', () {
    test('Fetch Cats', () {
      /// initial state
      const PetsState initialState = PetsState.empty();

      /// action that we want to test
      const action = FetchCats();

      /// the expected state is to start loading, and keeps the rest of the fields as they are in the initial state
      final expectedState = PetsState(isLoading: true, error: null, pets: initialState.pets, page: initialState.page);

      /// the returned result from the reducer
      final actualState = catsReducer(initialState, action);

      /// expecting the actual and expected results to be matched
      expect(actualState, expectedState);
    });

    test('Successful fetch first 10 cats action', () {
      /// mocked list of cats
      List<Pet> catsList = catsMockedJsonList.map((i) => Pet.fromJson(i)).toList().sublist(0, 10);

      /// initial state
      const PetsState initialState = PetsState.empty();

      /// action that we want to test

      final action = SuccessFetchCats(catsList);

      /// the expected result from the reducer

      final expectedState = PetsState(isLoading: false, error: null, pets: catsList, page: 1);

      /// the actual result from the reducer

      final actualState = catsReducer(initialState, action);

      /// expecting the actual and expected results to be matched

      expect(actualState, expectedState);
    });

    test('Failed fetch cats action', () {
      const PetsState initialState = PetsState.empty();
      final Error error = Error();
      final action = ErrorFetchCats(error);

      final expectedState = PetsState(isLoading: false, error: error, pets: initialState.pets, page: initialState.page);
      final actualState = catsReducer(initialState, action);

      expect(actualState, expectedState);
    });
  });

  test('Successful fetch 10, 20, 30 cats actions', () {
    /// from 0 -> 10
    List<Pet> catsList10 = catsMockedJsonList.map((i) => Pet.fromJson(i)).toList().sublist(0, 10);
    const PetsState initialState = PetsState.empty();
    AppAction action = SuccessFetchCats(catsList10);
    final expectedFirstState = PetsState(isLoading: false, error: null, pets: catsList10, page: 1);
    final actualFirstState = catsReducer(initialState, action);

    expect(actualFirstState, expectedFirstState);

    /// from 10 -> 20
    List<Pet> catsList20 = catsMockedJsonList.map((i) => Pet.fromJson(i)).toList().sublist(10, 20);
    action = SuccessFetchCats(catsList20);
    List<Pet>? newExpectedCatsList = actualFirstState.pets;
    newExpectedCatsList?.addAll(catsList20);
    final expectedSecondState = PetsState(isLoading: false, error: null, pets: newExpectedCatsList, page: 2);
    final actualSecondState = catsReducer(actualFirstState, action);

    expect(expectedSecondState, actualSecondState);

    /// from 20 -> 30
    List<Pet> catsList30 = catsMockedJsonList.map((i) => Pet.fromJson(i)).toList().sublist(20, 30);
    action = SuccessFetchCats(catsList30);
    newExpectedCatsList = actualSecondState.pets;
    newExpectedCatsList?.addAll(catsList30);
    final expectedThirdState = PetsState(isLoading: false, error: null, pets: newExpectedCatsList, page: 3);
    final actualThirdState = catsReducer(actualSecondState, action);

    expect(expectedThirdState, actualThirdState);
  });
}
