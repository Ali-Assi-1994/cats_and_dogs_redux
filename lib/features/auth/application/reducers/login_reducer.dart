import 'package:redux_cats_and_dogs/features/auth/application/actions/login_actions.dart';
import 'package:redux_cats_and_dogs/features/auth/domain/auth_state.dart';
import 'package:redux_cats_and_dogs/main.dart';

AuthState loginReducer(AuthState oldState, action) {
  if (action is LoginAction) {
    return oldState.copyWith(
      isLoading: true,
    );
  } else if (action is LoginSuccessAction) {
    navigatorKey.currentState?.pushNamed('home');
    return oldState.copyWith(
      isLoading: false,
      error: null,
      authStatus: AuthStatus.loggedIn,
      user: action.user,
    );
  } else if (action is LoginErrorAction) {
    return oldState.copyWith(
      isLoading: false,
      error: action.error,
    );
  } else {
    return oldState;
  }
}
