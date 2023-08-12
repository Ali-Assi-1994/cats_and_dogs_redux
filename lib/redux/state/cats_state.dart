import 'package:redux_cats_and_dogs/domain/pet_model.dart';

class CatsState {
  final List<Pet>? pets;
  final int limit;
  final int page;
  final bool isLoading;
  final Object? error;

  CatsState({
    required this.pets,
    required this.isLoading,
    required this.error,
    required this.limit,
    required this.page,
  });

  CatsState.empty()
      : pets = null,
        isLoading = false,
        limit = 10,
        page = 0,
        error = null;

  CatsState copyWith({
    List<Pet>? pets,
    bool? isLoading,
    Object? error,
    int? limit,
    int? page,
  }) {
    return CatsState(
      pets: pets ?? this.pets,
      isLoading: isLoading ?? this.isLoading,
      error: error ?? this.error,
      limit: limit ?? this.limit,
      page: page ?? this.page,
    );
  }
}
