import 'package:flutter/foundation.dart' show immutable;
import 'package:redux_cats_and_dogs/domain/pet_model.dart';

@immutable
sealed class PetsAction {
  const PetsAction();
}

@immutable
class FetchPets extends PetsAction {
  const FetchPets();
}

@immutable
class SuccessFetchPets extends PetsAction {
  final List<Pet> pets;

  const SuccessFetchPets(this.pets);
}

@immutable
class ErrorFetchPets extends PetsAction {
  final Object error;

  const ErrorFetchPets(this.error);
}
