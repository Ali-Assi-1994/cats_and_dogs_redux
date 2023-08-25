import 'package:firebase_auth/firebase_auth.dart';
import 'package:redux/redux.dart';
import 'package:redux_cats_and_dogs/features/auth/application/actions/login_actions.dart';
import 'package:redux_cats_and_dogs/features/auth/application/actions/register_actions.dart';

import 'package:redux_cats_and_dogs/redux/state/app_state.dart';

void authMiddleware(
  Store<AppState> store,
  action,
  NextDispatcher next,
) async {
  if (action is LoginAction) {
    try {
      FirebaseAuth firebaseAuth = FirebaseAuth.instance;
      final userCredential = await firebaseAuth.signInWithEmailAndPassword(
        email: action.email,
        password: action.password,
      );
      store.dispatch(LoginSuccessAction(user: userCredential.user));
    } on FirebaseAuthException catch (error) {
      store.dispatch(LoginErrorAction(error));
    }
  } else if (action is RegisterAction) {
    FirebaseAuth firebaseAuth = FirebaseAuth.instance;
    try {
      final userCredential = await firebaseAuth.createUserWithEmailAndPassword(email: action.email, password: action.password);
      store.dispatch(RegisterSuccessAction(user: userCredential.user));
    } on FirebaseAuthException catch (error) {
      store.dispatch(RegisterErrorAction(error));
    }
  }
  next(action);
}
