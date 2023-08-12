import 'package:flutter/foundation.dart' show immutable;
import 'package:redux_cats_and_dogs/domain/pet_model.dart';

@immutable
sealed class PetsAction {
  const PetsAction();
}

@immutable
class FetchDogs extends PetsAction {
  const FetchDogs();
}

@immutable
class FetchCats extends PetsAction {
  const FetchCats();
}

@immutable
class SuccessFetchDogs extends PetsAction {
  final List<Pet> pets;

  const SuccessFetchDogs(this.pets);
}

@immutable
class SuccessFetchCats extends PetsAction {
  final List<Pet> pets;

  const SuccessFetchCats(this.pets);
}

@immutable
class ErrorFetchDogs extends PetsAction {
  final Object error;

  const ErrorFetchDogs(this.error);
}

@immutable
class ErrorFetchCats extends PetsAction {
  final Object error;

  const ErrorFetchCats(this.error);
}

@immutable
class SelectedTabAction extends PetsAction {
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
