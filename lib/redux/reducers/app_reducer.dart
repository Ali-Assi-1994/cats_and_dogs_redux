import 'package:redux_cats_and_dogs/features/auth/application/reducers/auth_reducer.dart';
import 'package:redux_cats_and_dogs/features/home/application/reducers/bottom_naviagtor_reducer.dart';
import 'package:redux_cats_and_dogs/features/pets/application/reducers/cats_reducer.dart';
import 'package:redux_cats_and_dogs/features/pets/application/reducers/dogs_reducer.dart';
import 'package:redux_cats_and_dogs/redux/state/app_state.dart';

AppState appReducer(AppState state, dynamic action) => AppState(
      authState: authReducer(state.authState, action),
      dogsState: dogsReducer(state.dogsState, action),
      catsState: catsReducer(state.catsState, action),
      selectedTab: bottomNavigatorReducer(state.selectedTab, action),
    );
