import 'package:flutter/foundation.dart' show immutable;
import 'package:redux_cats_and_dogs/features/auth/application/actions/login_actions.dart';

@immutable
abstract class RegisterActionAbstract extends AuthActionAbstract {
  const RegisterActionAbstract();
}

@immutable
class RegisterAction extends RegisterActionAbstract {
  final String email;
  final String password;

  const RegisterAction(this.email, this.password);
}

@immutable
class RegisterSuccessAction extends RegisterActionAbstract {
  const RegisterSuccessAction();
}

@immutable
class RegisterErrorAction extends RegisterActionAbstract {
  final Object error;

  const RegisterErrorAction(this.error);
}
