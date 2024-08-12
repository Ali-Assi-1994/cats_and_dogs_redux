import 'package:equatable/equatable.dart';

class BottomStateNavigationModel extends Equatable {
  final int selectedTabIndex;

  const BottomStateNavigationModel({required this.selectedTabIndex});

  @override
  List<Object?> get props => [selectedTabIndex];
}
