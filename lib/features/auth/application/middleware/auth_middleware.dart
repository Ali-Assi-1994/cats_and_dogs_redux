import 'package:firebase_auth/firebase_auth.dart';
import 'package:redux/redux.dart';
import 'package:redux_cats_and_dogs/features/auth/application/actions/login_actions.dart';
import 'package:redux_cats_and_dogs/features/auth/application/actions/register_actions.dart';

import 'package:redux_cats_and_dogs/redux/state/app_state.dart';

void authMiddleware(
  Store<AppState> store,
  action,
  NextDispatcher next,
) {
  if (action is LoginAction) {
    FirebaseAuth firebaseAuth = FirebaseAuth.instance;
    firebaseAuth
        .signInWithEmailAndPassword(
      email: action.email,
      password: action.password,
    )
        .then((userCredential) {
      store.dispatch(LoginSuccessAction(user: userCredential.user));
    }).catchError((error) {
      store.dispatch(LoginErrorAction(error));
    });
  } else if (action is RegisterAction) {
    FirebaseAuth firebaseAuth = FirebaseAuth.instance;
    firebaseAuth.createUserWithEmailAndPassword(email: action.email, password: action.password).then((userCredential) {
      store.dispatch(RegisterSuccessAction(user: userCredential.user));
    }).catchError((error) {
      store.dispatch(RegisterErrorAction(error));
    });
  }
  next(action);
}
