import 'package:flutter/material.dart' show BuildContext;
import 'package:redux_cats_and_dogs/utils/auth_errors.dart';
import 'package:redux_cats_and_dogs/widgets/dialogs/generic_dialog.dart';

Future<void> showAuthError({
  required AuthError authError,
  required BuildContext context,
}) {
  return showGenericDialog<void>(
    context: context,
    title: authError.dialogTitle,
    content: authError.dialogText,
    optionsBuilder: () => {
      'OK': true,
    },
  );
}
