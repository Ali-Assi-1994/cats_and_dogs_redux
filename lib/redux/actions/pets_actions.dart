import 'package:flutter/foundation.dart' show immutable;
import 'package:redux_cats_and_dogs/domain/pet_model.dart';

@immutable
abstract class AppAction {
  const AppAction();
}

@immutable
class FetchDogs extends AppAction {
  const FetchDogs();
}

@immutable
class FetchCats extends AppAction {
  const FetchCats();
}

@immutable
class SuccessFetchDogs extends AppAction {
  final List<Pet> pets;

  const SuccessFetchDogs(this.pets);
}

@immutable
class SuccessFetchCats extends AppAction {
  final List<Pet> pets;

  const SuccessFetchCats(this.pets);
}

@immutable
class ErrorFetchDogs extends AppAction {
  final Object error;

  const ErrorFetchDogs(this.error);
}

@immutable
class ErrorFetchCats extends AppAction {
  final Object error;

  const ErrorFetchCats(this.error);
}

@immutable
abstract class SelectedTabAction extends AppAction {
  final int selectedTab;

  const SelectedTabAction(this.selectedTab);
}

@immutable
class SelectedDogTabAction extends SelectedTabAction {
  const SelectedDogTabAction() : super(0);
}

@immutable
class SelectedCatTabAction extends SelectedTabAction {
  const SelectedCatTabAction() : super(1);
}
