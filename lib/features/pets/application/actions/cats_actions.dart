import 'package:flutter/foundation.dart' show immutable;
import 'package:redux_cats_and_dogs/features/pets/domain/pet_model.dart';
import 'package:redux_cats_and_dogs/redux/actions/app_action.dart';

@immutable
class CatsAction extends AppAction {
  const CatsAction();
}

@immutable
class FetchCats extends CatsAction {
  const FetchCats();
}

@immutable
class SuccessFetchCats extends CatsAction {
  final List<Pet> pets;

  const SuccessFetchCats(this.pets);
}

@immutable
class ErrorFetchCats extends CatsAction {
  final Object error;

  const ErrorFetchCats(this.error);
}
