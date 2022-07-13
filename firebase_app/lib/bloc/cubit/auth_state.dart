part of 'auth_cubit.dart';

abstract class AuthState extends Equatable {
  const AuthState();
}

class AuthInitial extends AuthState {
  @override
  List<Object?> get props => [];
}

class AuthLoading extends AuthState {
  final String loadingMessage;
  AuthLoading({required this.loadingMessage});

  @override
  List<Object?> get props => [loadingMessage];
}

class AuthError extends AuthState {
  final String errorMessage;
  AuthError({required this.errorMessage});

  @override
  List<Object?> get props => [errorMessage];
}

class AuthSuccess extends AuthState {
  final user;
  final List data;

  AuthSuccess({required this.user, this.data = const []});

  @override
  List<Object?> get props => [user, ...data];
}
