import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart' show immutable;
import 'package:redux_cats_and_dogs/redux/actions/app_action.dart';

@immutable
abstract class AuthActionAbstract extends AppAction {
  const AuthActionAbstract();
}

@immutable
abstract class LoginActionAbstract extends AuthActionAbstract {
  const LoginActionAbstract();
}

@immutable
class LoginAction extends LoginActionAbstract {
  final String email;
  final String password;

  const LoginAction({
    required this.email,
    required this.password,
  });
}

@immutable
class LoginSuccessAction extends LoginActionAbstract {
  final User? user;

  const LoginSuccessAction({required this.user});
}

@immutable
class LoginErrorAction extends LoginActionAbstract {
  final Object error;

  const LoginErrorAction(this.error);
}
