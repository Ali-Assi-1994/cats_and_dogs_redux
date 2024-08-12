import 'package:redux_cats_and_dogs/features/home/application/actions/bottom_navigator_actions.dart';
import 'package:redux_cats_and_dogs/features/home/domain/bottom_state_navigation_model.dart';

BottomStateNavigationModel bottomNavigatorReducer(BottomStateNavigationModel oldState, action) {
  if (action is SelectedTabAction) {
    return action.selectedTab;
  } else {
    return oldState;
  }
}
