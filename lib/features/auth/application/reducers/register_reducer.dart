import 'package:redux_cats_and_dogs/features/auth/application/actions/register_actions.dart';
import 'package:redux_cats_and_dogs/features/auth/state/auth_state.dart';

AuthState registerReducer(AuthState oldState, action) {
  /// login actions
  if (action is RegisterAction) {
    return oldState.copyWith(
      isLoading: true,
    );
  } else if (action is RegisterSuccessAction) {
    return oldState.copyWith(
      isLoading: false,
      error: null,
      authStatus: AuthStatus.loggedIn,
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
