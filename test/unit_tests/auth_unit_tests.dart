import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_auth_mocks/firebase_auth_mocks.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:redux/redux.dart';
import 'package:redux_cats_and_dogs/features/auth/application/actions/login_actions.dart';
import 'package:redux_cats_and_dogs/features/auth/application/reducers/login_reducer.dart';
import 'package:redux_cats_and_dogs/features/auth/domain/auth_state.dart';

void main() {
  group('Auth Reducer', () {
    test('Login action', () {
      const initialState = AuthState.empty();
      const action = LoginAction(email: 'test@email.com', password: '123qwe');
      final nextState = loginReducer(initialState, action);

      const expectedState = AuthState(isLoading: true, error: null, authStatus: AuthStatus.loggedOut, user: null);

      expect(nextState, expectedState);
    });

    test('Successful login action', () {
      const initialState = AuthState.empty();
      final user = MockUser();

      final action = LoginSuccessAction(user: user);
      final nextState = loginReducer(initialState, action);

      final expectedState = AuthState(isLoading: false, error: null, authStatus: AuthStatus.loggedIn, user: user);

      expect(nextState, expectedState);
    });
  });
}
