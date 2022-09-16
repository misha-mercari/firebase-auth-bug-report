import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart' as fb;
import 'package:mfa_app/models/user.dart';
import 'package:mfa_app/utilities/mfa.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth.freezed.dart';

final _authStateProvider = StateProvider((_) => AuthState.loggedOut());

final authStateProvider = Provider((ref) => ref.watch(_authStateProvider));

final authServiceProvider = Provider<AuthService>((ref) => FirebaseAuthService(ref.read));

final userProvider = Provider((ref) => ref.watch(authStateProvider).user);

@freezed
class AuthState with _$AuthState {
  AuthState._();

  factory AuthState.loggedIn({
    required User user,
  }) = _LoggedInAuthState;

  factory AuthState.loggedOut() = _LoggedOutAuthState;

  User? get user => mapOrNull(
        loggedIn: (login) => login.user,
      );
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
        return AuthState.loggedOut();
      }

      final enrolledFactors = await user.multiFactor.getEnrolledFactors();

      // If the user has not enrolled in phone MFA, then they still can't use the
      // API - so for the rest of the application, the user is still "logged out".
      if (!enrolledFactors.any((factor) => factor is fb.PhoneMultiFactorInfo)) {
        return AuthState.loggedOut();
      }

      return AuthState.loggedIn(
        user: User(
          id: user.uid,
          email: user.email!,
          displayName: user.displayName,
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

      return MFA.enrollment(user: credential.user!);
    } on fb.FirebaseAuthMultiFactorException catch (e) {
      return MFA.verification(resolver: e.resolver);
    }
  }

  @visibleForTesting
  AuthState get state => _read(_authStateProvider);

  @visibleForTesting
  set state(AuthState state) => _read(_authStateProvider.notifier).state = state;
}
