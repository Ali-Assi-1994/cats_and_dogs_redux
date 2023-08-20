import 'package:flutter/foundation.dart' show immutable;
import 'package:redux_cats_and_dogs/redux/actions/app_action.dart';

@immutable
abstract class SelectedTabAction extends AppAction {
  final int selectedTab;

  const SelectedTabAction(this.selectedTab);
}

@immutable
class SelectedDogTabAction extends SelectedTabAction {
  const SelectedDogTabAction() : super(0);
}

@immutable
class SelectedCatTabAction extends SelectedTabAction {
  const SelectedCatTabAction() : super(1);
}
