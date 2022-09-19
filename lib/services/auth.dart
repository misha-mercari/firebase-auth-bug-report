import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart' as fb;
import 'package:flutter/material.dart';
import 'package:mfa_app/models/user.dart';
import 'package:mfa_app/utilities/mfa.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final _authStateProvider = StateProvider<AuthState>((_) => LoggedOutAuthState());

final authStateProvider = Provider((ref) => ref.watch(_authStateProvider));

final authServiceProvider = Provider<AuthService>((ref) => FirebaseAuthService(ref.read));

final userProvider = Provider((ref) => ref.watch(authStateProvider).user);

abstract class AuthState {
  User? get user;
}

class LoggedInAuthState extends AuthState {
  LoggedInAuthState({
    required this.user,
  });

  @override
  final User user;
}

class LoggedOutAuthState extends AuthState {
  LoggedOutAuthState();

  User? get user => null;
}

abstract class AuthService {
  Future<void> init();

  Future<MFA> login({
    required String email,
    required String password,
  });
}

class FirebaseAuthService implements AuthService {
  FirebaseAuthService(this._read);

  final Reader _read;

  @override
  Future<void> init() async {
    Future<AuthState> computeNextState(fb.User? user) async {
      if (user == null) {
        return LoggedOutAuthState();
      }

      final enrolledFactors = await user.multiFactor.getEnrolledFactors();

      // If the user has not enrolled in phone MFA, then they still can't use the
      // API - so for the rest of the application, the user is still "logged out".
      if (!enrolledFactors.any((factor) => factor is fb.PhoneMultiFactorInfo)) {
        return LoggedOutAuthState();
      }

      return LoggedInAuthState(
        user: User(
          id: user.uid,
          email: user.email!,
        ),
      );
    }

    state = await computeNextState(fb.FirebaseAuth.instance.currentUser);
    fb.FirebaseAuth.instance //
        .authStateChanges()
        .asyncMap(computeNextState)
        .forEach((nextState) => state = nextState);
  }

  @override
  Future<MFA> login({
    required String email,
    required String password,
  }) async {
    if (fb.FirebaseAuth.instance.currentUser != null) {
      await fb.FirebaseAuth.instance.signOut();
    }

    try {
      final credential = await fb.FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      return EnrollmentMFA(user: credential.user!);
    } on fb.FirebaseAuthMultiFactorException catch (e) {
      return VerificationMFA(resolver: e.resolver);
    }
  }

  @visibleForTesting
  AuthState get state => _read(_authStateProvider);

  @visibleForTesting
  set state(AuthState state) => _read(_authStateProvider.notifier).state = state;
}
