import 'package:firebase_auth/firebase_auth.dart' as fb;
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:mfa_app/models/user.dart';

User? useCurrentUser() {
  final snapshot = useStream<User?>(
    fb.FirebaseAuth.instance //
        .authStateChanges()
        .asyncMap(
      (user) {
        if (user != null) {
          return User(
            id: user.uid,
            email: user.email!,
          );
        } else {
          return null;
        }
      },
    ),
  );

  return snapshot.data;
}
