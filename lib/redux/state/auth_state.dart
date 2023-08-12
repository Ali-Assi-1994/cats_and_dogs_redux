import 'package:equatable/equatable.dart';

enum AuthStatus { loggedIn, loggedOut }

class AuthState extends Equatable {
  final bool isLoading;
  final Object? error;
  final AuthStatus authStatus;

  const AuthState({
    required this.isLoading,
    required this.error,
    required this.authStatus,
  });

  const AuthState.empty()
      : isLoading = false,
        authStatus = AuthStatus.loggedOut,
        error = null;

  AuthState copyWith({
    bool? isLoading,
    Object? error,
    AuthStatus? authStatus,
  }) {
    return AuthState(
      authStatus: authStatus ?? this.authStatus,
      isLoading: isLoading ?? this.isLoading,
      error: error ?? this.error,
    );
  }

  @override
  List<Object?> get props => [isLoading, error, authStatus];
}
