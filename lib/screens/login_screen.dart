import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:mfa_app/utilities/mfa.dart';
import 'package:flutter/material.dart';

class LoginScreenState extends State<LoginScreen> {
  final StreamController<User?> userController = StreamController();

  final TextEditingController emailController = TextEditingController();

  final TextEditingController passwordController = TextEditingController();

  final TextEditingController phoneNumberController = TextEditingController();

  @override
  void initState() {
    super.initState();
    userController.addStream(FirebaseAuth.instance.authStateChanges());
  }

  @override
  void dispose() {
    super.dispose();
    userController.close();
    emailController.dispose();
    passwordController.dispose();
    phoneNumberController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      builder: (context, snapshot) {
        final user = snapshot.data;

        return Scaffold(
          body: Padding(
            padding: EdgeInsets.all(32),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Email'),
                  TextField(controller: emailController),
                  SizedBox(height: 16),
                  Text('Password'),
                  TextField(
                    controller: passwordController,
                    obscureText: true,
                  ),
                  SizedBox(height: 16),
                  TextField(controller: phoneNumberController),
                  SizedBox(height: 4),
                  Text('Phone number is only used for the initial login.'),
                  SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () async {
                      try {
                        final mfa = await login(
                          email: emailController.text,
                          password: passwordController.text,
                        );

                        await mfa.when(
                          enrollment: (enrollment) => enrollMFA(
                            context: context,
                            enrollment: enrollment,
                            phoneNumber: phoneNumberController.text,
                          ),
                          verification: (verification) => verifyMFA(
                            context: context,
                            verification: verification,
                          ),
                        );
                      } catch (error) {
                        showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              title: Text('Login Error'),
                              content: Text(error.toString()),
                            );
                          },
                        );
                      }
                    },
                    child: Text('Login'),
                  ),
                  SizedBox(height: 16),
                  Text('Current user: $user'),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

class LoginScreen extends StatefulWidget {
  @override
  State<LoginScreen> createState() {
    return LoginScreenState();
  }
}
