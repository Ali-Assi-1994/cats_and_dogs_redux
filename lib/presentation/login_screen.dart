import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux_cats_and_dogs/presentation/widgets/buttons_widgets.dart';
import 'package:redux_cats_and_dogs/presentation/widgets/dialogs/auth_error_dialog.dart';
import 'package:redux_cats_and_dogs/presentation/widgets/dialogs/loading/loading_dialog.dart';
import 'package:redux_cats_and_dogs/presentation/widgets/text_fields_widgets.dart';
import 'package:redux_cats_and_dogs/redux/state/app_state.dart';
import 'package:redux_cats_and_dogs/redux/state/auth_state.dart';

class LoginPage extends HookWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final emailTextController = useTextEditingController();
    final passwordTextController = useTextEditingController();
    return Container();
    // return StoreConnector<AppState,AuthState>(
    //     converter: (store) => store.state.authState,
    //
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
    //   child: Scaffold(
    //     appBar: AppBar(
    //       backgroundColor: Colors.black,
    //       centerTitle: true,
    //       title: const Text("Login Screen"),
    //     ),
    //     body: InkWell(
    //       onTap: () => FocusScope.of(context).unfocus(),
    //       child: Column(
    //         children: [
    //           const SizedBox(height: 50),
    //           EmailTextFieldWidget(textEditingController: emailTextController),
    //           const SizedBox(height: 50),
    //           PasswordTextFieldWidget(textEditingController: passwordTextController),
    //           const SizedBox(height: 80),
    //           CustomAppButton(
    //             child: const Text(
    //               'Login',
    //               style: TextStyle(color: Colors.white, fontSize: 16),
    //             ),
    //             onPressed: () {},
    //           ),
    //           TextButton(
    //             onPressed: () => Navigator.of(context).pushReplacementNamed('signup'),
    //             child: const Text("Don't have an account yet? signup here!"),
    //           )
    //         ],
    //       ),
    //     ),
    //   ),
    // );
  }
}
