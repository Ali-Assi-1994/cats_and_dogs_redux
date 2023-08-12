import 'package:flutter/foundation.dart' show immutable;
import 'package:redux_cats_and_dogs/redux/actions/pets_actions.dart';

/// login actions
@immutable
class LoginAction extends AppAction {
  final String email;
  final String password;

  const LoginAction(this.email, this.password);
}

@immutable
class LoginSuccessAction extends AppAction {
  const LoginSuccessAction();
}

@immutable
class LoginErrorAction extends AppAction {
  final Object error;

  const LoginErrorAction(this.error);
}

/// Register actions
@immutable
class RegisterAction extends AppAction {
  final String email;
  final String password;

  const RegisterAction(this.email, this.password);
}

@immutable
class RegisterSuccessAction extends AppAction {
  const RegisterSuccessAction();
}

@immutable
class RegisterErrorAction extends AppAction {
  final Object error;

  const RegisterErrorAction(this.error);
}
