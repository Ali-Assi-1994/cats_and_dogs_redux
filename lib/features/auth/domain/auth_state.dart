import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';

enum AuthStatus { loggedIn, loggedOut }

class AuthState extends Equatable {
  final bool isLoading;
  final Object? error;
  final AuthStatus authStatus;
  final User? user;

  const AuthState({
    required this.isLoading,
    required this.error,
    required this.authStatus,
    required this.user,
  });

  const AuthState.empty()
      : isLoading = false,
        authStatus = AuthStatus.loggedOut,
        error = null,
        user = null;

  AuthState copyWith({
    bool? isLoading,
    Object? error,
    AuthStatus? authStatus,
    User? user,
  }) {
    return AuthState(
      authStatus: authStatus ?? this.authStatus,
      isLoading: isLoading ?? this.isLoading,
      error: error ?? this.error,
      user: user ?? this.user,
    );
  }

  @override
  List<Object?> get props => [isLoading, error, authStatus, user];
}
