import 'package:mfa_app/services/auth.dart';
import 'package:mfa_app/utilities/mfa.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class LoginScreen extends HookConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(userProvider);
    final authService = ref.read(authServiceProvider);
    final emailController = useTextEditingController();
    final passwordController = useTextEditingController();
    final phoneNumberController = useTextEditingController();

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
                    final mfa = await authService.login(
                      email: emailController.text,
                      password: passwordController.text,
                    );

                    await mfa.map(
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
  }
}
