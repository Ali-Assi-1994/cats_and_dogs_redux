import 'package:mocktail/mocktail.dart';
import 'package:redux_cats_and_dogs/features/pets/data/pets_repository.dart';
import 'package:redux_cats_and_dogs/features/pets/domain/pet_model.dart';

import 'cats_mocked_data.dart';

class CatsRepoMock extends Mock implements CatsRepo {
  @override
  Future<List<Pet>?> loadListOfPets({int? limit = 10, int? page = 0}) async {
    return List<Pet>.from((catsMockedJsonList).map((x) => Pet.fromJson(x))).sublist(
      page! * limit!,
      ((page + 1) * limit),
    );
  }
}
