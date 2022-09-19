import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:mfa_app/firebase_options.dart';
import 'package:mfa_app/mfa_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  // FirebaseAuth.instance.tenantId = 'initialize if necessary';
  runApp(MfaApp());
}
