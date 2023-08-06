import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:redux_cats_and_dogs/domain/breed_model.dart';
import 'package:redux_cats_and_dogs/domain/pet_model.dart';
import 'package:redux_cats_and_dogs/redux/actions/pets_actions.dart';
import 'package:redux_cats_and_dogs/redux/middleware/pets_middleware.dart';
import 'package:redux_cats_and_dogs/redux/reducers/pets_reducers.dart';
import 'package:redux_cats_and_dogs/redux/state/app_state.dart';
import 'package:redux_cats_and_dogs/utils/extensions.dart';
import 'package:shimmer/shimmer.dart';

class PetsListPage extends StatelessWidget {
  const PetsListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final store = Store(
      reducer,
      initialState: AppState.empty(),
      middleware: [loadPetsMiddleware],
    );
    return StoreProvider(
      store: store,
      child: Scaffold(
        backgroundColor: Colors.white,
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.black,
          onPressed: () {
            store.dispatch(const FetchPets());
          },
          child: const Icon(Icons.refresh),
        ),
        body: StoreConnector<AppState, List<Pet>?>(
          converter: (store) => store.state.pets,
          builder: (context, pets) {
            if (pets != null && pets.isNotEmpty) {
              return PetsListBuilder(pets: pets);
            }
            return Container();
          },
        ),
      ),
    );
  }
}

class PetsListBuilder extends StatelessWidget {
  final List<Pet> pets;

  const PetsListBuilder({super.key, required this.pets});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: ListView.builder(
            physics: const AlwaysScrollableScrollPhysics(parent: BouncingScrollPhysics()),
            itemCount: pets.length,
            itemBuilder: (context, index) {
              return PetItemBuilder(pet: pets[index]);
            },
          ),
        ),
      ],
    );
  }
}

class PetItemBuilder extends StatelessWidget {
  final Pet pet;

  const PetItemBuilder({Key? key, required this.pet}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18.0),
      child: Column(
        children: [
          const SizedBox(height: 28),
          PetImageBuilder(imageUrl: pet.url),
          PetBreedsTagsBuilder(breeds: pet.breeds!),
          PetTemperamentText(pet: pet),
        ],
      ),
    );
  }
}

class PetImageBuilder extends StatelessWidget {
  final String imageUrl;

  const PetImageBuilder({
    Key? key,
    required this.imageUrl,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10.0),
      child: Image.network(
        imageUrl,
        height: 250,
        fit: BoxFit.cover,
        loadingBuilder: (context, child, loadingProgress) {
          if (loadingProgress == null) return child;
          return Padding(
            padding: const EdgeInsets.all(80.0),
            child: SizedBox(
              width: 90,
              height: 90,
              child: Shimmer.fromColors(
                baseColor: const Color(0xFFF4F4F4),
                direction: ShimmerDirection.rtl,
                highlightColor: const Color(0xFFDADADA),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Image.asset("assets/icons/paws.png"),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

class PetBreedsTagsBuilder extends StatelessWidget {
  final List<Breed?> breeds;

  const PetBreedsTagsBuilder({
    Key? key,
    required this.breeds,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Wrap(
          crossAxisAlignment: WrapCrossAlignment.start,
          children: breeds
              .map((breed) => ActionChip(
                    label: Text(
                      breed!.name ?? "I'm just a baby!",
                      style: const TextStyle(color: Colors.white),
                    ),
                    backgroundColor: Colors.black,
                  ))
              .toList(),
        ),
      ],
    );
  }
}

class PetTemperamentText extends StatelessWidget {
  final Pet pet;

  const PetTemperamentText({
    Key? key,
    required this.pet,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Flexible(child: Text(pet.breeds!.extractTemperamentFromBreeds())),
      ],
    );
  }
}
