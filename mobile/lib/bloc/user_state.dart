part of 'user_bloc.dart';

@immutable
sealed class UserState {}

final class UserInitial extends UserState {}

final class AuthLoading extends UserState {}

final class AuthSuccess extends UserState {
  final User user;

  AuthSuccess({required this.user});
}

final class AuthFailure extends UserState {
  final String error;

  AuthFailure(this.error);
}

final class UserUpdating extends UserState {}

final class UpdateFailure extends AuthSuccess {
  final String error;

  UpdateFailure(
    this.error, {
    required super.user,
  });
}
