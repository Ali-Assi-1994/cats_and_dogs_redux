import 'package:redux_cats_and_dogs/api_client/api_client.dart';
import 'package:redux_cats_and_dogs/api_client/api_result.dart';
import 'package:redux_cats_and_dogs/domain/pet_model.dart';
import 'package:redux_cats_and_dogs/utils/app_secrets.dart';

class PetsRepository {
  final String baseUrl;
  final String apiKey;

  PetsRepository({
    required this.baseUrl,
    required this.apiKey,
  });

  late ApiClient petApiClient = ApiClient(
    baseUrl: baseUrl,
    apiKey: apiKey,
  );

  Future<List<Pet>?> loadListOfPets({int? limit = 10, int? page = 0}) async {
    ApiResult result = await petApiClient.get(
      url: '$baseUrl/v1/images/search',
      queryParameters: {
        'limit': limit,
        'page': page,
      },
    );
    if (result.type == ApiResultType.success) {
      return List<Pet>.from((result.data).map((x) => Pet.fromJson(x)));
    } else {
      throw result.errorMessage;
    }
  }
}

class DogsRepo extends PetsRepository {
  DogsRepo() : super(baseUrl: 'https://api.thedogapi.com', apiKey: AppSecrets.dogApiKey);
}

class CatsRepo extends PetsRepository {
  CatsRepo() : super(baseUrl: 'https://api.thecatapi.com', apiKey: AppSecrets.catApiKey);
}
