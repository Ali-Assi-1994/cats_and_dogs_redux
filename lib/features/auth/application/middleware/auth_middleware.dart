// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:redux/redux.dart';
// import 'package:redux_cats_and_dogs/data/pets_repository.dart';
// import 'package:redux_cats_and_dogs/redux/actions/auth_actions.dart';
// import 'package:redux_cats_and_dogs/redux/actions/auth_actions/login_actions.dart';
// import 'package:redux_cats_and_dogs/redux/actions/pets_actions.dart';
// import 'package:redux_cats_and_dogs/redux/state/app_state.dart';
//
// void authMiddleware(
//   Store<AppState> store,
//   action,
//   NextDispatcher next,
// ) async {
//   if (action is LoginAction) {
//     try {
//       store.dispatch(LoginAction(
//         email: action.email,
//         password: action.password,
//       ));
//
//       FirebaseAuth firebaseAuth = FirebaseAuth.instance;
//       final userCredential = await firebaseAuth.signInWithEmailAndPassword(
//         email: action.email,
//         password: action.password,
//       );
//       final user = userCredential.user!;
//       store.dispatch(LoginSuccessAction(user: user));
//     } on FirebaseAuthException catch (error) {
//       emit(
//         LoggedOutState(
//           isLoading: false,
//           authError: AuthError.from(error),
//         ),
//       );
//     }
//
//     final dogsRepo = DogsRepo();
//     dogsRepo.loadListOfPets(limit: store.state.dogsState.limit, page: store.state.dogsState.page).then((dogs) {
//       if (dogs != null) {
//         store.dispatch(SuccessFetchDogs(dogs));
//       }
//     }).catchError((error) {
//       store.dispatch(ErrorFetchDogs('Error loading dogs ${error.toString()}'));
//     });
//   } else if (action is FetchCats) {
//     final catsRepo = CatsRepo();
//     catsRepo.loadListOfPets(limit: store.state.catsState.limit, page: store.state.catsState.page).then((cats) {
//       if (cats != null) {
//         store.dispatch(SuccessFetchCats(cats));
//       }
//     }).catchError((error) {
//       store.dispatch(ErrorFetchCats('Error loading cats ${error.toString()}'));
//     });
//   }
//   next(action);
// }
