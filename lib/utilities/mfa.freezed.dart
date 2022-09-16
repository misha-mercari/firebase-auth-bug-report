// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'mfa.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$MFA {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(User user) enrollment,
    required TResult Function(MultiFactorResolver resolver) verification,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(User user)? enrollment,
    TResult Function(MultiFactorResolver resolver)? verification,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(User user)? enrollment,
    TResult Function(MultiFactorResolver resolver)? verification,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(MFAEnrollment value) enrollment,
    required TResult Function(MFAVerification value) verification,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(MFAEnrollment value)? enrollment,
    TResult Function(MFAVerification value)? verification,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(MFAEnrollment value)? enrollment,
    TResult Function(MFAVerification value)? verification,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MFACopyWith<$Res> {
  factory $MFACopyWith(MFA value, $Res Function(MFA) then) =
      _$MFACopyWithImpl<$Res>;
}

/// @nodoc
class _$MFACopyWithImpl<$Res> implements $MFACopyWith<$Res> {
  _$MFACopyWithImpl(this._value, this._then);

  final MFA _value;
  // ignore: unused_field
  final $Res Function(MFA) _then;
}

/// @nodoc
abstract class _$$MFAEnrollmentCopyWith<$Res> {
  factory _$$MFAEnrollmentCopyWith(
          _$MFAEnrollment value, $Res Function(_$MFAEnrollment) then) =
      __$$MFAEnrollmentCopyWithImpl<$Res>;
  $Res call({User user});
}

/// @nodoc
class __$$MFAEnrollmentCopyWithImpl<$Res> extends _$MFACopyWithImpl<$Res>
    implements _$$MFAEnrollmentCopyWith<$Res> {
  __$$MFAEnrollmentCopyWithImpl(
      _$MFAEnrollment _value, $Res Function(_$MFAEnrollment) _then)
      : super(_value, (v) => _then(v as _$MFAEnrollment));

  @override
  _$MFAEnrollment get _value => super._value as _$MFAEnrollment;

  @override
  $Res call({
    Object? user = freezed,
  }) {
    return _then(_$MFAEnrollment(
      user: user == freezed
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as User,
    ));
  }
}

/// @nodoc

class _$MFAEnrollment implements MFAEnrollment {
  _$MFAEnrollment({required this.user});

  @override
  final User user;

  @override
  String toString() {
    return 'MFA.enrollment(user: $user)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MFAEnrollment &&
            const DeepCollectionEquality().equals(other.user, user));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(user));

  @JsonKey(ignore: true)
  @override
  _$$MFAEnrollmentCopyWith<_$MFAEnrollment> get copyWith =>
      __$$MFAEnrollmentCopyWithImpl<_$MFAEnrollment>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(User user) enrollment,
    required TResult Function(MultiFactorResolver resolver) verification,
  }) {
    return enrollment(user);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(User user)? enrollment,
    TResult Function(MultiFactorResolver resolver)? verification,
  }) {
    return enrollment?.call(user);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(User user)? enrollment,
    TResult Function(MultiFactorResolver resolver)? verification,
    required TResult orElse(),
  }) {
    if (enrollment != null) {
      return enrollment(user);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(MFAEnrollment value) enrollment,
    required TResult Function(MFAVerification value) verification,
  }) {
    return enrollment(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(MFAEnrollment value)? enrollment,
    TResult Function(MFAVerification value)? verification,
  }) {
    return enrollment?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(MFAEnrollment value)? enrollment,
    TResult Function(MFAVerification value)? verification,
    required TResult orElse(),
  }) {
    if (enrollment != null) {
      return enrollment(this);
    }
    return orElse();
  }
}

abstract class MFAEnrollment implements MFA {
  factory MFAEnrollment({required final User user}) = _$MFAEnrollment;

  User get user;
  @JsonKey(ignore: true)
  _$$MFAEnrollmentCopyWith<_$MFAEnrollment> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$MFAVerificationCopyWith<$Res> {
  factory _$$MFAVerificationCopyWith(
          _$MFAVerification value, $Res Function(_$MFAVerification) then) =
      __$$MFAVerificationCopyWithImpl<$Res>;
  $Res call({MultiFactorResolver resolver});
}

/// @nodoc
class __$$MFAVerificationCopyWithImpl<$Res> extends _$MFACopyWithImpl<$Res>
    implements _$$MFAVerificationCopyWith<$Res> {
  __$$MFAVerificationCopyWithImpl(
      _$MFAVerification _value, $Res Function(_$MFAVerification) _then)
      : super(_value, (v) => _then(v as _$MFAVerification));

  @override
  _$MFAVerification get _value => super._value as _$MFAVerification;

  @override
  $Res call({
    Object? resolver = freezed,
  }) {
    return _then(_$MFAVerification(
      resolver: resolver == freezed
          ? _value.resolver
          : resolver // ignore: cast_nullable_to_non_nullable
              as MultiFactorResolver,
    ));
  }
}

/// @nodoc

class _$MFAVerification implements MFAVerification {
  _$MFAVerification({required this.resolver});

  @override
  final MultiFactorResolver resolver;

  @override
  String toString() {
    return 'MFA.verification(resolver: $resolver)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MFAVerification &&
            const DeepCollectionEquality().equals(other.resolver, resolver));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(resolver));

  @JsonKey(ignore: true)
  @override
  _$$MFAVerificationCopyWith<_$MFAVerification> get copyWith =>
      __$$MFAVerificationCopyWithImpl<_$MFAVerification>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(User user) enrollment,
    required TResult Function(MultiFactorResolver resolver) verification,
  }) {
    return verification(resolver);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(User user)? enrollment,
    TResult Function(MultiFactorResolver resolver)? verification,
  }) {
    return verification?.call(resolver);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(User user)? enrollment,
    TResult Function(MultiFactorResolver resolver)? verification,
    required TResult orElse(),
  }) {
    if (verification != null) {
      return verification(resolver);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(MFAEnrollment value) enrollment,
    required TResult Function(MFAVerification value) verification,
  }) {
    return verification(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(MFAEnrollment value)? enrollment,
    TResult Function(MFAVerification value)? verification,
  }) {
    return verification?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(MFAEnrollment value)? enrollment,
    TResult Function(MFAVerification value)? verification,
    required TResult orElse(),
  }) {
    if (verification != null) {
      return verification(this);
    }
    return orElse();
  }
}

abstract class MFAVerification implements MFA {
  factory MFAVerification({required final MultiFactorResolver resolver}) =
      _$MFAVerification;

  MultiFactorResolver get resolver;
  @JsonKey(ignore: true)
  _$$MFAVerificationCopyWith<_$MFAVerification> get copyWith =>
      throw _privateConstructorUsedError;
}
