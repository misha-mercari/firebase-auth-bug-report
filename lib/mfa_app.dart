import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:mfa_app/screens/login_screen.dart';
import 'package:flutter/material.dart';

class MfaApp extends HookWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: LoginScreen(),
    );
  }
}
