import 'package:freezed_annotation/freezed_annotation.dart';

part 'user.freezed.dart';

@freezed
class User with _$User {
  User._();

  factory User({
    required String id,
    required String email,
    String? displayName,
  }) = _User;
}
