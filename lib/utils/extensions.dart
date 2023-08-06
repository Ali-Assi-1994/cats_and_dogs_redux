import 'package:collection/collection.dart';
import 'package:redux_cats_and_dogs/domain/breed_model.dart';

extension ExtractTemperamentFromBreeds on List<Breed?> {
  String extractTemperamentFromBreeds() {
    String s = '';
    if (isNotEmpty) {
      for (var breed in this) {
        if (breed!.temperament != null) {
          s = s + breed.temperament!;
        }
      }
    }
    return s;
  }
}

extension ItreblesUnordredEuqality on Object {
  bool isEqualUnorderedTo(other) => const DeepCollectionEquality.unordered().equals(this, other);
}

extension ItreblesOrdredEuqality on Iterable {
  bool isEqualInOrder(Iterable other) {
    if (other == null) {
      return false;
    }
    bool result = true;
    for (int i = 0; i < length; i++) {
      result = result && (elementAt(i) == other.elementAt(i));
    }
    return result;
  }
}
