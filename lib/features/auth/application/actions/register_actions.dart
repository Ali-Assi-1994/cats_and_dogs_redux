import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart' show immutable;
import 'package:redux_cats_and_dogs/redux/actions/app_action.dart';

@immutable
abstract class RegisterActionAbstract extends AppAction {
  const RegisterActionAbstract();
}

@immutable
class RegisterAction extends RegisterActionAbstract {
  final String email;
  final String password;

  const RegisterAction({
    required this.email,
    required this.password,
  });
}

@immutable
class RegisterSuccessAction extends RegisterActionAbstract {
  final User? user;

  const RegisterSuccessAction({this.user});
}

@immutable
class RegisterErrorAction extends RegisterActionAbstract {
  final Object error;

  const RegisterErrorAction(this.error);
}
