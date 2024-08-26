// import 'dart:io';
//
// import 'package:firebase_auth_mocks/firebase_auth_mocks.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_redux/flutter_redux.dart';
// import 'package:flutter_test/flutter_test.dart';
// import 'package:redux/redux.dart';
// import 'package:redux_cats_and_dogs/features/auth/presentation/login_screen.dart';
// import 'package:redux_cats_and_dogs/redux/reducers/app_reducer.dart';
// import 'package:redux_cats_and_dogs/redux/state/app_state.dart';
// import 'package:redux_cats_and_dogs/widgets/buttons_widgets.dart';
// import 'package:redux_cats_and_dogs/widgets/text_fields_widgets.dart';
//
// void main() {
//   setUpAll(() {
//     HttpOverrides.global = null;
//   });
//   //
//   String testEmail = 'test@course.bloc';
//   final user = MockUser();
//
//   Future<void> prepareLoginScreen(WidgetTester tester) async {
//     final authLogin = MockFirebaseAuth(
//       mockUser: user,
//       signedIn: false,
//     );
//
//     Store<AppState> store = Store(
//       appReducer,
//       initialState: const AppState.empty(),
//       middleware: [catsMiddleware],
//     );
//
//     await tester.pumpWidget(
//       StoreProvider(
//         store: store,
//         child: MaterialApp(
//           home: const LoginScreen(),
//
//         ),
//       ),
//     );
//     await tester.pumpAndSettle();
//   }
//
//   testWidgets('Test login page widgets', (WidgetTester tester) async {
//     await prepareLoginScreen(tester);
//     var emailTextFormField = find.byType(EmailTextFieldWidget);
//     await tester.enterText(emailTextFormField, testEmail);
//     await tester.pumpAndSettle();
//
//     var passwordTextFormField = find.byType(PasswordTextFieldWidget);
//     await tester.enterText(passwordTextFormField, "-");
//     await tester.pumpAndSettle();
//
//     expect(emailTextFormField, findsOneWidget);
//     expect(passwordTextFormField, findsOneWidget);
//
//     var loginButton = find.widgetWithText(CustomAppButton, 'Login');
//     expect(loginButton, findsOneWidget);
//
//     expect(find.text('Cats'), findsNothing);
//     expect(find.text('Dogs'), findsNothing);
//
//     await tester.tap(loginButton);
//
//     await tester.pumpAndSettle();
//     expect(find.text('Cats'), findsNothing);
//     expect(find.text('Dogs'), findsNothing);
//     expect(loginButton, findsNothing);
//   });
// }
