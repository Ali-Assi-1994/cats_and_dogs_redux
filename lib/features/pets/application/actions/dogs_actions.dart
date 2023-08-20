import 'package:flutter/foundation.dart' show immutable;
import 'package:redux_cats_and_dogs/features/pets/domain/pet_model.dart';
import 'package:redux_cats_and_dogs/redux/actions/app_action.dart';

@immutable
class DogsAction extends AppAction {
  const DogsAction();
}

@immutable
class FetchDogs extends DogsAction {
  const FetchDogs();
}

@immutable
class SuccessFetchDogs extends DogsAction {
  final List<Pet> pets;

  const SuccessFetchDogs(this.pets);
}

@immutable
class ErrorFetchDogs extends DogsAction {
  final Object error;

  const ErrorFetchDogs(this.error);
}
