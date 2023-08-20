import 'package:redux_cats_and_dogs/features/auth/application/actions/login_actions.dart';
import 'package:redux_cats_and_dogs/features/auth/state/auth_state.dart';



AuthState loginReducer(AuthState oldState, action) {
  /// login actions
  if (action is LoginAction) {
    return oldState.copyWith(
      isLoading: true,
    );
  } else if (action is LoginSuccessAction) {
    return oldState.copyWith(
      isLoading: false,
      error: null,
      authStatus: AuthStatus.loggedIn,
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
