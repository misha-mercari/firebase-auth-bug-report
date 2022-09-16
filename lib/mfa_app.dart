import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:mfa_app/screens/login_screen.dart';
import 'package:mfa_app/services/auth.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter/material.dart';

class MfaApp extends HookConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final initialization = useMemoized(() {
      return Future.wait([
        ref.read(authServiceProvider).init(),
      ]);
    });

    final snapshot = useFuture(initialization);

    if (!snapshot.hasData) {
      return SizedBox();
    }

    return MaterialApp(
      home: LoginScreen(),
    );
  }
}
