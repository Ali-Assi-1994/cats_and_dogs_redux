import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux_cats_and_dogs/features/pets/domain/pet_model.dart';
import 'package:redux_cats_and_dogs/features/pets/application/actions/cats_actions.dart';
import 'package:redux_cats_and_dogs/redux/state/app_state.dart';
import 'package:redux_cats_and_dogs/utils/extensions.dart';
import 'package:shimmer/shimmer.dart';

class CatsListPage extends StatelessWidget {
  const CatsListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.white,
      body: CatsListBuilder(),
    );
  }
}

class CatsListBuilder extends StatelessWidget {
  const CatsListBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return StoreBuilder<AppState>(
      builder: (context, store) {
        final state = store.state.catsState;
        if (!state.isLoading && (state.pets == null || state.pets!.isEmpty)) {
          store.dispatch(const FetchCats());
        }

        if (state.isLoading && (state.pets == null || state.pets!.isEmpty)) {
          return const Center(child: CircularProgressIndicator(color: Colors.black));
        }
        if (state.error != null) {
          return Text('error ${state.error.toString()}');
        }
        if (state.pets != null && state.pets!.isNotEmpty) {
          return Column(
            children: [
              Expanded(
                child: NotificationListener<ScrollEndNotification>(
                  onNotification: (ScrollEndNotification scrollInfo) {
                    if (!state.isLoading && scrollInfo.metrics.pixels >= scrollInfo.metrics.maxScrollExtent - 100) {
                      store.dispatch(const FetchCats());
                      return true;
                    }
                    return false;
                  },
                  child: ListView.builder(
                    physics: const AlwaysScrollableScrollPhysics(parent: BouncingScrollPhysics()),
                    itemCount: state.pets!.length + (state.isLoading ? 1 : 0),
                    itemBuilder: (context, index) {
                      if (index == state.pets!.length) {
                        return const Center(
                          child: Padding(
                            padding: EdgeInsets.symmetric(vertical: 30),
                            child: CircularProgressIndicator(color: Colors.black),
                          ),
                        );
                      } else {
                        return PetItemBuilder(pet: state.pets![index]);
                      }
                    },
                  ),
                ),
              ),
            ],
          );
        }
        return Container();
      },
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
