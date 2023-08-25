import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux_cats_and_dogs/features/auth/application/actions/login_actions.dart';
import 'package:redux_cats_and_dogs/features/auth/application/actions/register_actions.dart';
import 'package:redux_cats_and_dogs/redux/state/app_state.dart';
import 'package:redux_cats_and_dogs/features/auth/state/auth_state.dart';
import 'package:redux_cats_and_dogs/widgets/buttons_widgets.dart';
import 'package:redux_cats_and_dogs/widgets/text_fields_widgets.dart';

class SignupScreen extends HookWidget {
  const SignupScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final emailTextController = useTextEditingController();
    final passwordTextController = useTextEditingController();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        centerTitle: true,
        title: const Text("Signup Screen"),
      ),
      body: StoreConnector<AppState, AuthState>(
        converter: (store) => store.state.authState,
        builder: (context, authState) {
          return authState.isLoading
              ? const Center(child: CircularProgressIndicator(color: Colors.black))
              : Column(
                  children: [
                    const SizedBox(height: 50),
                    EmailTextFieldWidget(textEditingController: emailTextController),
                    const SizedBox(height: 50),
                    PasswordTextFieldWidget(textEditingController: passwordTextController),
                    const SizedBox(height: 80),
                    CustomAppButton(
                      child: const Text(
                        'Signup',
                        style: TextStyle(color: Colors.white, fontSize: 16),
                      ),
                      onPressed: () {
                        StoreProvider.of<AppState>(context).dispatch(
                          RegisterAction(
                            email: emailTextController.text,
                            password: passwordTextController.text,
                          ),
                        );
                      },
                    ),
                    TextButton(
                      onPressed: () => Navigator.of(context).pushReplacementNamed('login'),
                      child: const Text("You already have an account? login here!"),
                    )
                  ],
                );
        },
      ),
    );
  }
}

// return StoreConnector<AppState, AuthState>(
//   converter: (store) => store.state.authState,
//   builder: (context, state) {
//     if (state.isLoading) {
//       LoadingDialog.instance().show(
//         context: context,
//         text: 'Loading...',
//       );
//     } else {
//       LoadingDialog.instance().hide();
//     }
//   },
// );

// <AuthBloc, AuthState>(
//   listener: (context, AuthState state) {
//     if (state.isLoading) {
//       LoadingDialog.instance().show(
//         context: context,
//         text: 'Loading...',
//       );
//     } else {
//       LoadingDialog.instance().hide();
//     }
//     final authError = state.authError;
//     if (authError != null) {
//       showAuthError(
//         authError: authError,
//         context: context,
//       );
//     }
//     if (state is LoggedInState) {
//       Navigator.of(context).pushReplacementNamed('home');
//     }
//   },
