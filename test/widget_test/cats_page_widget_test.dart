import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:redux/redux.dart';
import 'package:redux_cats_and_dogs/features/home/presentation/home_page.dart';
import 'package:redux_cats_and_dogs/features/pets/application/middlewares/pets_middleware_class.dart';
import 'package:redux_cats_and_dogs/features/pets/presentation/cats_list_screen.dart';
import 'package:redux_cats_and_dogs/redux/reducers/app_reducer.dart';
import 'package:redux_cats_and_dogs/redux/state/app_state.dart';

import '../mocked_data/mocked_redux.dart';


void main() {
  setUpAll(() {
    HttpOverrides.global = null;
  });

  Future<void> prepareHomePage(WidgetTester tester) async {
    CatsRepoMock catsRepoMock = CatsRepoMock();
    CatsMiddleware catsMiddleware = CatsMiddleware(catsRepo: catsRepoMock);

    Store<AppState> store = Store(
      appReducer,
      initialState: const AppState.empty(),
      middleware: [catsMiddleware],
    );

    await tester.pumpWidget(
      StoreProvider(
        store: store,
        child: MaterialApp(
          home: const CatsListPage(),
          routes: {
            'home': (context) => const HomePage(),
          },

        ),
      ),
    );
    await tester.pumpAndSettle();
  }

  testWidgets(
    'Test cats page widgets, with load more on scrolling down',
    (WidgetTester tester) async {
      await prepareHomePage(tester);
      await tester.pumpAndSettle();

      /// test scroll down
      await tester.scrollUntilVisible(
        find.text('Siamese'),
        100,
        scrollable: find.byType(Scrollable),
      );
    },
  );
}
