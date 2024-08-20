import 'package:firebase_auth_mocks/firebase_auth_mocks.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:redux_cats_and_dogs/features/auth/application/actions/login_actions.dart';
import 'package:redux_cats_and_dogs/features/auth/application/reducers/login_reducer.dart';
import 'package:redux_cats_and_dogs/features/auth/domain/auth_state.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  group('Auth Reducer', () {
    test('Login action', () {
      const initialState = AuthState.empty();
      const action = LoginAction(email: 'test@email.com', password: '123qwe');

      const expectedState = AuthState(isLoading: true, error: null, authStatus: AuthStatus.loggedOut, user: null);
      final actualState = loginReducer(initialState, action);

      expect(actualState, expectedState);
    });

    test('Successful login action', () {
      const initialState = AuthState(isLoading: true, error: null, authStatus: AuthStatus.loggedOut, user: null);
      final user = MockUser();
      final action = LoginSuccessAction(user: user);

      final expectedState = AuthState(isLoading: false, error: null, authStatus: AuthStatus.loggedIn, user: user);
      final actualState = loginReducer(initialState, action);

      expect(actualState, expectedState);
    });

    test('Failed login action', () {
      const initialState = AuthState(isLoading: true, error: null, authStatus: AuthStatus.loggedOut, user: null);
      final error = Error();
      final action = LoginErrorAction(error);

      final expectedState = AuthState(isLoading: false, error: error, authStatus: AuthStatus.loggedOut, user: null);
      final actualState = loginReducer(initialState, action);

      expect(actualState, expectedState);
    });
  });
}
