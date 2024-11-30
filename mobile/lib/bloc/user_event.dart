part of 'user_bloc.dart';

@immutable
sealed class UserEvent {}

final class AuthLoginRequested extends UserEvent {
  final String login;
  final String password;

  AuthLoginRequested({
    required this.login,
    required this.password,
  });
}

final class AuthRegisterRequested extends UserEvent {
  final String name;
  final String about;
  final String? email;
  final String? phone;
  final String organization;
  final String password;

  AuthRegisterRequested({
    this.email,
    this.phone,
    required this.name,
    required this.about,
    required this.organization,
    required this.password,
  });
}

final class AuthLogoutRequested extends UserEvent {}

final class UserUpdateRequested extends UserEvent {
  final String name;
  final String about;
  final String? email;
  final String? phone;
  final String organization;
  final String donationLink;
  final String photoPath;

  UserUpdateRequested({
    this.email,
    this.phone,
    required this.name,
    required this.about,
    required this.organization,
    required this.donationLink,
    required this.photoPath,
  });
}
