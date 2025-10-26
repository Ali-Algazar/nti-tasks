part of 'auth_cubit.dart';

@immutable
sealed class AuthState {}

final class AuthInitial extends AuthState {}

final class AuthError extends AuthState {
  final String message;
  AuthError({required this.message});
}

// ignore: must_be_immutable
final class AuthSuccess extends AuthState {
  UserModel user;
  AuthSuccess({required this.user});
}

final class AuthLoading extends AuthState {}
