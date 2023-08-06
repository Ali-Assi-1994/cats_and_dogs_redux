import 'package:redux_cats_and_dogs/domain/pet_model.dart';

class AppState {
  final List<Pet>? pets;
  final bool isLoading;
  final Object? error;

  AppState({
    required this.pets,
    required this.isLoading,
    required this.error,
  });

  AppState.empty()
      : pets = null,
        isLoading = false,
        error = null;

  AppState copyWith({
    List<Pet>? pets,
    bool? isLoading,
    Object? error,
  }) {
    return AppState(
      pets: pets ?? this.pets,
      isLoading: isLoading ?? this.isLoading,
      error: error ?? this.error,
    );
  }
}
