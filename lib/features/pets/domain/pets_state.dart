import 'package:equatable/equatable.dart';
import 'package:redux_cats_and_dogs/features/pets/domain/pet_model.dart';

class PetsState extends Equatable {
  final List<Pet>? pets;
  final int page;
  final bool isLoading;
  final Object? error;

  const PetsState({
    required this.pets,
    required this.isLoading,
    required this.error,
    required this.page,
  });

  const PetsState.empty()
      : pets = null,
        isLoading = false,
        page = 0,
        error = null;

  PetsState copyWith({
    List<Pet>? pets,
    bool? isLoading,
    Object? error,
    int? limit,
    int? page,
  }) {
    return PetsState(
      pets: pets ?? this.pets,
      isLoading: isLoading ?? this.isLoading,
      error: error ?? this.error,
      page: page ?? this.page,
    );
  }

  @override
  List<Object?> get props => [pets, isLoading, error, page];
}
