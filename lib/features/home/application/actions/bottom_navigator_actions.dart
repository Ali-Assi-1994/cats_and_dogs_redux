import 'package:flutter/foundation.dart' show immutable;
import 'package:redux_cats_and_dogs/features/home/domain/bottom_state_navigation_model.dart';
import 'package:redux_cats_and_dogs/redux/actions/app_action.dart';

@immutable
abstract class SelectedTabAction extends AppAction {
  final BottomStateNavigationModel selectedTab;

  const SelectedTabAction(this.selectedTab);
}

@immutable
class SelectedDogTabAction extends SelectedTabAction {
  const SelectedDogTabAction() : super(const BottomStateNavigationModel(selectedTabIndex: 0));
}

@immutable
class SelectedCatTabAction extends SelectedTabAction {
  const SelectedCatTabAction() : super(const BottomStateNavigationModel(selectedTabIndex: 1));
}
