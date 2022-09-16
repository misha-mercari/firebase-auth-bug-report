// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'auth.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$AuthState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(User user) loggedIn,
    required TResult Function() loggedOut,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(User user)? loggedIn,
    TResult Function()? loggedOut,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(User user)? loggedIn,
    TResult Function()? loggedOut,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_LoggedInAuthState value) loggedIn,
    required TResult Function(_LoggedOutAuthState value) loggedOut,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_LoggedInAuthState value)? loggedIn,
    TResult Function(_LoggedOutAuthState value)? loggedOut,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_LoggedInAuthState value)? loggedIn,
    TResult Function(_LoggedOutAuthState value)? loggedOut,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AuthStateCopyWith<$Res> {
  factory $AuthStateCopyWith(AuthState value, $Res Function(AuthState) then) =
      _$AuthStateCopyWithImpl<$Res>;
}

/// @nodoc
class _$AuthStateCopyWithImpl<$Res> implements $AuthStateCopyWith<$Res> {
  _$AuthStateCopyWithImpl(this._value, this._then);

  final AuthState _value;
  // ignore: unused_field
  final $Res Function(AuthState) _then;
}

/// @nodoc
abstract class _$$_LoggedInAuthStateCopyWith<$Res> {
  factory _$$_LoggedInAuthStateCopyWith(_$_LoggedInAuthState value,
          $Res Function(_$_LoggedInAuthState) then) =
      __$$_LoggedInAuthStateCopyWithImpl<$Res>;
  $Res call({User user});

  $UserCopyWith<$Res> get user;
}

/// @nodoc
class __$$_LoggedInAuthStateCopyWithImpl<$Res>
    extends _$AuthStateCopyWithImpl<$Res>
    implements _$$_LoggedInAuthStateCopyWith<$Res> {
  __$$_LoggedInAuthStateCopyWithImpl(
      _$_LoggedInAuthState _value, $Res Function(_$_LoggedInAuthState) _then)
      : super(_value, (v) => _then(v as _$_LoggedInAuthState));

  @override
  _$_LoggedInAuthState get _value => super._value as _$_LoggedInAuthState;

  @override
  $Res call({
    Object? user = freezed,
  }) {
    return _then(_$_LoggedInAuthState(
      user: user == freezed
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as User,
    ));
  }

  @override
  $UserCopyWith<$Res> get user {
    return $UserCopyWith<$Res>(_value.user, (value) {
      return _then(_value.copyWith(user: value));
    });
  }
}

/// @nodoc

class _$_LoggedInAuthState extends _LoggedInAuthState {
  _$_LoggedInAuthState({required this.user}) : super._();

  @override
  final User user;

  @override
  String toString() {
    return 'AuthState.loggedIn(user: $user)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_LoggedInAuthState &&
            const DeepCollectionEquality().equals(other.user, user));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(user));

  @JsonKey(ignore: true)
  @override
  _$$_LoggedInAuthStateCopyWith<_$_LoggedInAuthState> get copyWith =>
      __$$_LoggedInAuthStateCopyWithImpl<_$_LoggedInAuthState>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(User user) loggedIn,
    required TResult Function() loggedOut,
  }) {
    return loggedIn(user);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(User user)? loggedIn,
    TResult Function()? loggedOut,
  }) {
    return loggedIn?.call(user);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(User user)? loggedIn,
    TResult Function()? loggedOut,
    required TResult orElse(),
  }) {
    if (loggedIn != null) {
      return loggedIn(user);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_LoggedInAuthState value) loggedIn,
    required TResult Function(_LoggedOutAuthState value) loggedOut,
  }) {
    return loggedIn(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_LoggedInAuthState value)? loggedIn,
    TResult Function(_LoggedOutAuthState value)? loggedOut,
  }) {
    return loggedIn?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_LoggedInAuthState value)? loggedIn,
    TResult Function(_LoggedOutAuthState value)? loggedOut,
    required TResult orElse(),
  }) {
    if (loggedIn != null) {
      return loggedIn(this);
    }
    return orElse();
  }
}

abstract class _LoggedInAuthState extends AuthState {
  factory _LoggedInAuthState({required final User user}) = _$_LoggedInAuthState;
  _LoggedInAuthState._() : super._();

  User get user;
  @JsonKey(ignore: true)
  _$$_LoggedInAuthStateCopyWith<_$_LoggedInAuthState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_LoggedOutAuthStateCopyWith<$Res> {
  factory _$$_LoggedOutAuthStateCopyWith(_$_LoggedOutAuthState value,
          $Res Function(_$_LoggedOutAuthState) then) =
      __$$_LoggedOutAuthStateCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_LoggedOutAuthStateCopyWithImpl<$Res>
    extends _$AuthStateCopyWithImpl<$Res>
    implements _$$_LoggedOutAuthStateCopyWith<$Res> {
  __$$_LoggedOutAuthStateCopyWithImpl(
      _$_LoggedOutAuthState _value, $Res Function(_$_LoggedOutAuthState) _then)
      : super(_value, (v) => _then(v as _$_LoggedOutAuthState));

  @override
  _$_LoggedOutAuthState get _value => super._value as _$_LoggedOutAuthState;
}

/// @nodoc

class _$_LoggedOutAuthState extends _LoggedOutAuthState {
  _$_LoggedOutAuthState() : super._();

  @override
  String toString() {
    return 'AuthState.loggedOut()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_LoggedOutAuthState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(User user) loggedIn,
    required TResult Function() loggedOut,
  }) {
    return loggedOut();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(User user)? loggedIn,
    TResult Function()? loggedOut,
  }) {
    return loggedOut?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(User user)? loggedIn,
    TResult Function()? loggedOut,
    required TResult orElse(),
  }) {
    if (loggedOut != null) {
      return loggedOut();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_LoggedInAuthState value) loggedIn,
    required TResult Function(_LoggedOutAuthState value) loggedOut,
  }) {
    return loggedOut(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_LoggedInAuthState value)? loggedIn,
    TResult Function(_LoggedOutAuthState value)? loggedOut,
  }) {
    return loggedOut?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_LoggedInAuthState value)? loggedIn,
    TResult Function(_LoggedOutAuthState value)? loggedOut,
    required TResult orElse(),
  }) {
    if (loggedOut != null) {
      return loggedOut(this);
    }
    return orElse();
  }
}

abstract class _LoggedOutAuthState extends AuthState {
  factory _LoggedOutAuthState() = _$_LoggedOutAuthState;
  _LoggedOutAuthState._() : super._();
}
