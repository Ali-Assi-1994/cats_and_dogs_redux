import 'package:redux_cats_and_dogs/features/auth/application/actions/register_actions.dart';
import 'package:redux_cats_and_dogs/features/auth/domain/auth_state.dart';
import 'package:redux_cats_and_dogs/main.dart';

AuthState registerReducer(AuthState oldState, action) {
  if (action is RegisterAction) {
    return oldState.copyWith(
      isLoading: true,
    );
  } else if (action is RegisterSuccessAction) {
    navigatorKey.currentState?.pushNamed('home');
    return oldState.copyWith(
      isLoading: false,
      error: null,
      authStatus: AuthStatus.loggedIn,
      user: action.user,
    );
  } else if (action is RegisterErrorAction) {
    return oldState.copyWith(
      isLoading: false,
      error: action.error,
    );
  } else {
    return oldState;
  }
}
