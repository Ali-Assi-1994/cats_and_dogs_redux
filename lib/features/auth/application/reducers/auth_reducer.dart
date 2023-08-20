import 'package:redux/redux.dart';
import 'package:redux_cats_and_dogs/features/auth/application/actions/login_actions.dart';
import 'package:redux_cats_and_dogs/features/auth/application/actions/register_actions.dart';
import 'package:redux_cats_and_dogs/features/auth/application/reducers/login_reducer.dart';
import 'package:redux_cats_and_dogs/features/auth/application/reducers/register_reducer.dart';
import 'package:redux_cats_and_dogs/features/auth/state/auth_state.dart';

final authReducer = combineReducers<AuthState>([
  TypedReducer<AuthState, LoginActionAbstract>(loginReducer),
  TypedReducer<AuthState, RegisterActionAbstract>(registerReducer),
]);
