import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux_cats_and_dogs/features/pets/presentation/cats_list_screen.dart';
import 'package:redux_cats_and_dogs/features/pets/presentation/dogs_list_screen.dart';
import 'package:redux_cats_and_dogs/features/home/application/actions/bottom_navigator_actions.dart';
import 'package:redux_cats_and_dogs/redux/state/app_state.dart';
import 'package:redux_cats_and_dogs/utils/constants.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, int>(
      converter: (store) => store.state.selectedTab,
      builder: (context, selectedTabIndex) {
        return Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(backgroundColor: Colors.black, toolbarHeight: 10),
          bottomNavigationBar: StoreBuilder<AppState>(
            builder: (context, store) {
              return BottomNavigationBar(
                onTap: (selectedTab) {
                  switch (selectedTab) {
                    case Constants.dogsTabID:
                      final storeHere = StoreProvider.of<AppState>(context);
                      storeHere.dispatch(const SelectedDogTabAction());
                      break;
                    case Constants.catsTabID:
                      final storeHere = StoreProvider.of<AppState>(context);
                      storeHere.dispatch(const SelectedCatTabAction());
                      break;
                  }
                },
                currentIndex: selectedTabIndex,
                showUnselectedLabels: false,
                backgroundColor: Colors.white,
                elevation: 0,
                showSelectedLabels: false,
                items: [
                  BottomNavigationBarItem(
                    backgroundColor: Colors.white,
                    label: "Dogs",
                    icon: Image.asset(selectedTabIndex == Constants.dogsTabID ? 'assets/icons/dog_filled.png' : 'assets/icons/dog.png', height: 35),
                  ),
                  BottomNavigationBarItem(
                    backgroundColor: Colors.white,
                    label: "Cats",
                    icon: Image.asset(selectedTabIndex == Constants.catsTabID ? 'assets/icons/cat_filled.png' : 'assets/icons/cat.png', height: 35),
                  ),
                ],
              );
            },
          ),
          body: selectedTabIndex == 0 ? const DogsListScreen() : const CatsListPage(),
        );
      },
    );
  }
}
