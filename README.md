# Firebase Auth Bug Report

This project is a minimum reproduction of the following Flutter Firebase Auth error:

```
E/FirebaseAuth( 6458): [SmsRetrieverHelper] SMS verification code request failed: unknown status code: 17499 INVALID_PROJECT_ID:Project ID does not match MFA pending credential.
```

We haven't been able to find a root cause for this error and need help.

## Setup

1. Place a `google-services.json` in `android/app`.
1. Place FlutterFire's `firebase_options.dart` in `lib`.
1. Replace `com.example.mfa` with your Firebase project's app ID.
1. Install your own debug keystore, whose SHA1/SHA256 is saved in Firebase.
1. Hard-code a tenant in `main.dart` if your configuration has one.
1. Enable email/password and phone authentication with phone-based MFA in the Firebase console.

You should be able to reproduce the bug now.

The files also have a `.gitignore` with a `SETUP` tag inside so you can confirm where the files in our setup exist.

## Reproduction

1. Enter a valid email, password, and phone number.
   1. First, the enrollment flow happens. You will be redirected to a Captcha challenge, after which an SMS input dialog is popped. Enter the required SMS code to enroll in MFA.
   1. Upon completion, nothing happens - now you have to log in for real.
2. Enter a valid email and password, again.
    1. Now the login verification flow happens. You may or may not have a Captcha challenge. An SMS input dialog will unfortunately not emerge, and the error will print in the logs.

## Other Notes

1. Enrollment works great - you can confirm the second factor in the Firebase console. This makes it all the more confusing why the error could possibly occur in the exact same configuration.
2. This code works as expected on iOS, but it is not in this report repository. You are able to log in successfully, and the user is show under the login button. This leads us to believe the issue is in Android's platform-specific code, rather than the Dart side.
3. Our setup does in fact use a tenant, but it's not clear if this is relevant information.

## Unrelated Issues

Note that there is an additional bug that throws a casting exception when attempting to report the above exception, in `method_channel_firebase_auth.dart`:

```

E/flutter ( 6458): [ERROR:flutter/runtime/dart_vm_initializer.cc(41)] Unhandled Exception: type 'Null' is not a subtype of type 'String'
E/flutter ( 6458): #0      MethodChannelFirebaseAuth.verifyPhoneNumber.<anonymous closure>
E/flutter ( 6458): #1      _RootZone.runUnaryGuarded (dart:async/zone.dart:1586:10)
E/flutter ( 6458): #2      _BufferingStreamSubscription._sendData (dart:async/stream_impl.dart:339:11)
E/flutter ( 6458): #3      _DelayedData.perform (dart:async/stream_impl.dart:515:14)
E/flutter ( 6458): #4      _PendingEvents.handleNext (dart:async/stream_impl.dart:620:11)
E/flutter ( 6458): #5      _PendingEvents.schedule.<anonymous closure> (dart:async/stream_impl.dart:591:7)
E/flutter ( 6458): #6      _microtaskLoop (dart:async/schedule_microtask.dart:40:21)
E/flutter ( 6458): #7      _startMicrotaskLoop (dart:async/schedule_microtask.dart:49:5)
```

This appears to be a simple logic error, unrelated to the actual bug for which this repository was constructed.
