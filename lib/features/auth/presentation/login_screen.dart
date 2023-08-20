import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux_cats_and_dogs/features/auth/application/actions/login_actions.dart';
import 'package:redux_cats_and_dogs/redux/state/app_state.dart';
import 'package:redux_cats_and_dogs/features/auth/state/auth_state.dart';
import 'package:redux_cats_and_dogs/widgets/buttons_widgets.dart';
import 'package:redux_cats_and_dogs/widgets/text_fields_widgets.dart';

class LoginScreen extends HookWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final emailTextController = useTextEditingController();
    final passwordTextController = useTextEditingController();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        centerTitle: true,
        title: const Text("Login Screen"),
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
                        'Login',
                        style: TextStyle(color: Colors.white, fontSize: 16),
                      ),
                      onPressed: () {
                        // LoadingDialog.instance().show(
                        //   context: context,
                        //   text: 'Loading...',
                        // );
                        StoreProvider.of<AppState>(context).dispatch(
                          LoginAction(
                            email: emailTextController.text,
                            password: passwordTextController.text,
                          ),
                        );
                      },
                    ),
                    TextButton(
                      onPressed: () => Navigator.of(context).pushReplacementNamed('signup'),
                      child: const Text("Don't have an account yet? signup here!"),
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
