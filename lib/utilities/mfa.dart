import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

/// This object describes Firebase internal state required in order to process
/// one of the two MFA flows, enrollment or verification.
abstract class MFA {
  T when<T>({
    required T Function(EnrollmentMFA) enrollment,
    required T Function(VerificationMFA) verification,
  }) {
    if (this is EnrollmentMFA) {
      return enrollment(this as EnrollmentMFA);
    } else {
      return verification(this as VerificationMFA);
    }
  }
}

class EnrollmentMFA extends MFA {
  EnrollmentMFA({
    required this.user,
  });

  final User user;
}

class VerificationMFA extends MFA {
  VerificationMFA({
    required this.resolver,
  });

  final MultiFactorResolver resolver;
}

/// Enrolls a user into SMS-based MFA. The [enrollment] parameter must be
/// acquired by a login attempt to the authentication service.
Future<void> enrollMFA({
  required BuildContext context,
  required EnrollmentMFA enrollment,
  required String phoneNumber,
}) async {
  final assertion = await _executeMFA(context, enrollment, phoneNumber);

  if (assertion != null) {
    await enrollment.user.multiFactor.enroll(assertion);
  }

  return null;
}

/// Verifies a user with SMS-based MFA. The [verification] parameter must be
/// acquired by a login attempt to the authentication service.
Future<void> verifyMFA({
  required BuildContext context,
  required VerificationMFA verification,
}) async {
  final assertion = await _executeMFA(context, verification);

  if (assertion != null) {
    await verification.resolver.resolveSignIn(assertion);
  }

  return null;
}

/// Requests an SMS-based MFA verification code for the given enrollment or
/// verification process. In the case of enrollment, the provided phone number
/// is used; for verification, the previously enrolled phone number is used.
///
/// On success, returns an assertion about the MFA process that can be used to
/// log in or complete enrollment as necessary. If the user cancels the process
/// for some reason, null will be returned instead.
Future<MultiFactorAssertion?> _executeMFA(
  BuildContext context,
  MFA mfa, [
  String? phoneNumber,
]) async {
  MultiFactorSession? multiFactorSession;
  PhoneMultiFactorInfo? multiFactorInfo;

  await mfa.when(
    enrollment: (mfa) async {
      // For enrollment, the phone number and session are required.
      assert(phoneNumber != null, 'Enrollment requires a phone number.');
      multiFactorSession = await mfa.user.multiFactor.getSession();
    },
    verification: (mfa) {
      // For verification, the session and info are required.
      multiFactorSession = mfa.resolver.session;
      multiFactorInfo = mfa.resolver.hints.first as PhoneMultiFactorInfo;
    },
  );

  final completer = Completer<MultiFactorAssertion?>();

  await FirebaseAuth.instance.verifyPhoneNumber(
    phoneNumber: phoneNumber,
    multiFactorInfo: multiFactorInfo,
    multiFactorSession: multiFactorSession,
    codeSent: (verificationId, forceResendingToken) async {
      final smsCode = await getSmsCodeFromUser(context);

      if (smsCode == null) {
        // User cancelled the dialog, so it's not an error but there's no result.
        completer.complete(null);
        return;
      }

      completer.complete(
        PhoneMultiFactorGenerator.getAssertion(
          PhoneAuthProvider.credential(
            verificationId: verificationId,
            smsCode: smsCode,
          ),
        ),
      );
    },
    codeAutoRetrievalTimeout: (_) {
      // No specific action necessary if auto-retrieval times out.
    },
    verificationCompleted: (credential) {
      completer.complete(PhoneMultiFactorGenerator.getAssertion(credential));
    },
    verificationFailed: (error) {
      completer.completeError(error);
    },
  );

  return completer.future;
}

Future<String?> getSmsCodeFromUser(BuildContext context) async {
  String? smsCode;

  // Update the UI - wait for the user to enter the SMS code
  await showDialog<String>(
    context: context,
    barrierDismissible: false,
    builder: (context) {
      return AlertDialog(
        title: const Text('SMS code:'),
        actions: [
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: const Text('Sign in'),
          ),
          OutlinedButton(
            onPressed: () {
              smsCode = null;
              Navigator.of(context).pop();
            },
            child: const Text('Cancel'),
          ),
        ],
        content: Container(
          padding: const EdgeInsets.all(20),
          child: TextField(
            onChanged: (value) {
              smsCode = value;
            },
            textAlign: TextAlign.center,
            autofocus: true,
          ),
        ),
      );
    },
  );

  return smsCode;
}
