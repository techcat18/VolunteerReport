import 'dart:async';
import 'dart:math';

import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile/data/organization_repository.dart';
import 'package:mobile/data/user_repository.dart';
import 'package:mobile/models/user.dart';

part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  final UserRepository _userRepository;
  final OrganizationRepository _organizationRepository;

  UserBloc(
    this._userRepository,
    this._organizationRepository,
  ) : super(UserInitial()) {
    on<AuthLoginRequested>(_onAuthLoginRequested);
    on<AuthRegisterRequested>(_onAuthRegisterRequested);
    on<AuthLogoutRequested>(_onAuthLogoutRequested);
    on<UserUpdateRequested>(_onUserUpdateRequested);
  }

  FutureOr<void> _onUserUpdateRequested(
    UserUpdateRequested event,
    Emitter<UserState> emit,
  ) async {
    final currentUser = (state as AuthSuccess).user;
    emit(UserUpdating());
    try {
      final organization = await _organizationRepository.getOrCreate(
        event.organization,
      );

      currentUser.name = event.name;
      currentUser.about = event.about;
      currentUser.email = event.email;
      currentUser.phone = event.phone;
      currentUser.organization = organization;
      currentUser.donationLink = event.donationLink;
      currentUser.photoPath = event.photoPath;

      await _userRepository.update(currentUser);
      return emit(AuthSuccess(user: currentUser));
    } catch (e) {
      return emit(
        UpdateFailure(
          e.toString(),
          user: currentUser,
        ),
      );
    }
  }

  FutureOr<void> _onAuthLogoutRequested(
    AuthLogoutRequested event,
    Emitter<UserState> emit,
  ) async {
    emit(AuthLoading());
    try {
      await _userRepository.logout();
      return emit(UserInitial());
    } catch (e) {
      return emit(AuthFailure(e.toString()));
    }
  }

  FutureOr<void> _onAuthRegisterRequested(
    AuthRegisterRequested event,
    Emitter<UserState> emit,
  ) async {
    emit(AuthLoading());
    try {
      final organization = await _organizationRepository.getOrCreate(
        event.organization,
      );
      final user = await _userRepository.register(
        User(
          id: Random().nextInt(200) + 10,
          name: event.name,
          password: event.password,
          about: event.about,
          organization: organization,
          email: event.email,
          phone: event.phone,
        ),
      );
      return emit(AuthSuccess(user: user));
    } catch (e) {
      return emit(AuthFailure(e.toString()));
    }
  }

  void _onAuthLoginRequested(
    AuthLoginRequested event,
    Emitter<UserState> emit,
  ) async {
    emit(AuthLoading());
    try {
      final user = await _userRepository.login(
        event.login,
        event.password,
      );
      return emit(AuthSuccess(user: user));
    } catch (e) {
      return emit(AuthFailure(e.toString()));
    }
  }
}
