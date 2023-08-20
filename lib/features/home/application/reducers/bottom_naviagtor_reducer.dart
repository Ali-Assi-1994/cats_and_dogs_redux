import 'package:redux_cats_and_dogs/features/home/application/actions/bottom_navigator_actions.dart';

int bottomNavigatorReducer(int oldState, action) {
  if (action is SelectedTabAction) {
    return action.selectedTab;
  } else {
    return oldState;
  }
}
