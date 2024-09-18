// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'application_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ApplicationEvent {
  Object get request => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(UserInfoRequestEntity request) getUserInfo,
    required TResult Function(ApplicationRequest request) createApplication,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(UserInfoRequestEntity request)? getUserInfo,
    TResult? Function(ApplicationRequest request)? createApplication,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(UserInfoRequestEntity request)? getUserInfo,
    TResult Function(ApplicationRequest request)? createApplication,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetUserInfoEvent value) getUserInfo,
    required TResult Function(_CreateApplication value) createApplication,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GetUserInfoEvent value)? getUserInfo,
    TResult? Function(_CreateApplication value)? createApplication,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetUserInfoEvent value)? getUserInfo,
    TResult Function(_CreateApplication value)? createApplication,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ApplicationEventCopyWith<$Res> {
  factory $ApplicationEventCopyWith(
          ApplicationEvent value, $Res Function(ApplicationEvent) then) =
      _$ApplicationEventCopyWithImpl<$Res, ApplicationEvent>;
}

/// @nodoc
class _$ApplicationEventCopyWithImpl<$Res, $Val extends ApplicationEvent>
    implements $ApplicationEventCopyWith<$Res> {
  _$ApplicationEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ApplicationEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$GetUserInfoEventImplCopyWith<$Res> {
  factory _$$GetUserInfoEventImplCopyWith(_$GetUserInfoEventImpl value,
          $Res Function(_$GetUserInfoEventImpl) then) =
      __$$GetUserInfoEventImplCopyWithImpl<$Res>;
  @useResult
  $Res call({UserInfoRequestEntity request});
}

/// @nodoc
class __$$GetUserInfoEventImplCopyWithImpl<$Res>
    extends _$ApplicationEventCopyWithImpl<$Res, _$GetUserInfoEventImpl>
    implements _$$GetUserInfoEventImplCopyWith<$Res> {
  __$$GetUserInfoEventImplCopyWithImpl(_$GetUserInfoEventImpl _value,
      $Res Function(_$GetUserInfoEventImpl) _then)
      : super(_value, _then);

  /// Create a copy of ApplicationEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? request = null,
  }) {
    return _then(_$GetUserInfoEventImpl(
      null == request
          ? _value.request
          : request // ignore: cast_nullable_to_non_nullable
              as UserInfoRequestEntity,
    ));
  }
}

/// @nodoc

class _$GetUserInfoEventImpl implements _GetUserInfoEvent {
  const _$GetUserInfoEventImpl(this.request);

  @override
  final UserInfoRequestEntity request;

  @override
  String toString() {
    return 'ApplicationEvent.getUserInfo(request: $request)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GetUserInfoEventImpl &&
            (identical(other.request, request) || other.request == request));
  }

  @override
  int get hashCode => Object.hash(runtimeType, request);

  /// Create a copy of ApplicationEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$GetUserInfoEventImplCopyWith<_$GetUserInfoEventImpl> get copyWith =>
      __$$GetUserInfoEventImplCopyWithImpl<_$GetUserInfoEventImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(UserInfoRequestEntity request) getUserInfo,
    required TResult Function(ApplicationRequest request) createApplication,
  }) {
    return getUserInfo(request);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(UserInfoRequestEntity request)? getUserInfo,
    TResult? Function(ApplicationRequest request)? createApplication,
  }) {
    return getUserInfo?.call(request);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(UserInfoRequestEntity request)? getUserInfo,
    TResult Function(ApplicationRequest request)? createApplication,
    required TResult orElse(),
  }) {
    if (getUserInfo != null) {
      return getUserInfo(request);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetUserInfoEvent value) getUserInfo,
    required TResult Function(_CreateApplication value) createApplication,
  }) {
    return getUserInfo(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GetUserInfoEvent value)? getUserInfo,
    TResult? Function(_CreateApplication value)? createApplication,
  }) {
    return getUserInfo?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetUserInfoEvent value)? getUserInfo,
    TResult Function(_CreateApplication value)? createApplication,
    required TResult orElse(),
  }) {
    if (getUserInfo != null) {
      return getUserInfo(this);
    }
    return orElse();
  }
}

abstract class _GetUserInfoEvent implements ApplicationEvent {
  const factory _GetUserInfoEvent(final UserInfoRequestEntity request) =
      _$GetUserInfoEventImpl;

  @override
  UserInfoRequestEntity get request;

  /// Create a copy of ApplicationEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$GetUserInfoEventImplCopyWith<_$GetUserInfoEventImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$CreateApplicationImplCopyWith<$Res> {
  factory _$$CreateApplicationImplCopyWith(_$CreateApplicationImpl value,
          $Res Function(_$CreateApplicationImpl) then) =
      __$$CreateApplicationImplCopyWithImpl<$Res>;
  @useResult
  $Res call({ApplicationRequest request});
}

/// @nodoc
class __$$CreateApplicationImplCopyWithImpl<$Res>
    extends _$ApplicationEventCopyWithImpl<$Res, _$CreateApplicationImpl>
    implements _$$CreateApplicationImplCopyWith<$Res> {
  __$$CreateApplicationImplCopyWithImpl(_$CreateApplicationImpl _value,
      $Res Function(_$CreateApplicationImpl) _then)
      : super(_value, _then);

  /// Create a copy of ApplicationEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? request = null,
  }) {
    return _then(_$CreateApplicationImpl(
      null == request
          ? _value.request
          : request // ignore: cast_nullable_to_non_nullable
              as ApplicationRequest,
    ));
  }
}

/// @nodoc

class _$CreateApplicationImpl implements _CreateApplication {
  const _$CreateApplicationImpl(this.request);

  @override
  final ApplicationRequest request;

  @override
  String toString() {
    return 'ApplicationEvent.createApplication(request: $request)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CreateApplicationImpl &&
            (identical(other.request, request) || other.request == request));
  }

  @override
  int get hashCode => Object.hash(runtimeType, request);

  /// Create a copy of ApplicationEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CreateApplicationImplCopyWith<_$CreateApplicationImpl> get copyWith =>
      __$$CreateApplicationImplCopyWithImpl<_$CreateApplicationImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(UserInfoRequestEntity request) getUserInfo,
    required TResult Function(ApplicationRequest request) createApplication,
  }) {
    return createApplication(request);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(UserInfoRequestEntity request)? getUserInfo,
    TResult? Function(ApplicationRequest request)? createApplication,
  }) {
    return createApplication?.call(request);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(UserInfoRequestEntity request)? getUserInfo,
    TResult Function(ApplicationRequest request)? createApplication,
    required TResult orElse(),
  }) {
    if (createApplication != null) {
      return createApplication(request);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetUserInfoEvent value) getUserInfo,
    required TResult Function(_CreateApplication value) createApplication,
  }) {
    return createApplication(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GetUserInfoEvent value)? getUserInfo,
    TResult? Function(_CreateApplication value)? createApplication,
  }) {
    return createApplication?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetUserInfoEvent value)? getUserInfo,
    TResult Function(_CreateApplication value)? createApplication,
    required TResult orElse(),
  }) {
    if (createApplication != null) {
      return createApplication(this);
    }
    return orElse();
  }
}

abstract class _CreateApplication implements ApplicationEvent {
  const factory _CreateApplication(final ApplicationRequest request) =
      _$CreateApplicationImpl;

  @override
  ApplicationRequest get request;

  /// Create a copy of ApplicationEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CreateApplicationImplCopyWith<_$CreateApplicationImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$ApplicationState {
  bool get isLoading => throw _privateConstructorUsedError;
  ErrorModel? get error => throw _privateConstructorUsedError;
  PersonModel? get userInfo => throw _privateConstructorUsedError;
  InvoiceResponse? get invoiceResponse => throw _privateConstructorUsedError;

  /// Create a copy of ApplicationState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ApplicationStateCopyWith<ApplicationState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ApplicationStateCopyWith<$Res> {
  factory $ApplicationStateCopyWith(
          ApplicationState value, $Res Function(ApplicationState) then) =
      _$ApplicationStateCopyWithImpl<$Res, ApplicationState>;
  @useResult
  $Res call(
      {bool isLoading,
      ErrorModel? error,
      PersonModel? userInfo,
      InvoiceResponse? invoiceResponse});
}

/// @nodoc
class _$ApplicationStateCopyWithImpl<$Res, $Val extends ApplicationState>
    implements $ApplicationStateCopyWith<$Res> {
  _$ApplicationStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ApplicationState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? error = freezed,
    Object? userInfo = freezed,
    Object? invoiceResponse = freezed,
  }) {
    return _then(_value.copyWith(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as ErrorModel?,
      userInfo: freezed == userInfo
          ? _value.userInfo
          : userInfo // ignore: cast_nullable_to_non_nullable
              as PersonModel?,
      invoiceResponse: freezed == invoiceResponse
          ? _value.invoiceResponse
          : invoiceResponse // ignore: cast_nullable_to_non_nullable
              as InvoiceResponse?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ApplicationStateImplCopyWith<$Res>
    implements $ApplicationStateCopyWith<$Res> {
  factory _$$ApplicationStateImplCopyWith(_$ApplicationStateImpl value,
          $Res Function(_$ApplicationStateImpl) then) =
      __$$ApplicationStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool isLoading,
      ErrorModel? error,
      PersonModel? userInfo,
      InvoiceResponse? invoiceResponse});
}

/// @nodoc
class __$$ApplicationStateImplCopyWithImpl<$Res>
    extends _$ApplicationStateCopyWithImpl<$Res, _$ApplicationStateImpl>
    implements _$$ApplicationStateImplCopyWith<$Res> {
  __$$ApplicationStateImplCopyWithImpl(_$ApplicationStateImpl _value,
      $Res Function(_$ApplicationStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of ApplicationState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? error = freezed,
    Object? userInfo = freezed,
    Object? invoiceResponse = freezed,
  }) {
    return _then(_$ApplicationStateImpl(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as ErrorModel?,
      userInfo: freezed == userInfo
          ? _value.userInfo
          : userInfo // ignore: cast_nullable_to_non_nullable
              as PersonModel?,
      invoiceResponse: freezed == invoiceResponse
          ? _value.invoiceResponse
          : invoiceResponse // ignore: cast_nullable_to_non_nullable
              as InvoiceResponse?,
    ));
  }
}

/// @nodoc

class _$ApplicationStateImpl implements _ApplicationState {
  const _$ApplicationStateImpl(
      {this.isLoading = false,
      this.error,
      this.userInfo,
      this.invoiceResponse});

  @override
  @JsonKey()
  final bool isLoading;
  @override
  final ErrorModel? error;
  @override
  final PersonModel? userInfo;
  @override
  final InvoiceResponse? invoiceResponse;

  @override
  String toString() {
    return 'ApplicationState(isLoading: $isLoading, error: $error, userInfo: $userInfo, invoiceResponse: $invoiceResponse)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ApplicationStateImpl &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.error, error) || other.error == error) &&
            (identical(other.userInfo, userInfo) ||
                other.userInfo == userInfo) &&
            (identical(other.invoiceResponse, invoiceResponse) ||
                other.invoiceResponse == invoiceResponse));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, isLoading, error, userInfo, invoiceResponse);

  /// Create a copy of ApplicationState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ApplicationStateImplCopyWith<_$ApplicationStateImpl> get copyWith =>
      __$$ApplicationStateImplCopyWithImpl<_$ApplicationStateImpl>(
          this, _$identity);
}

abstract class _ApplicationState implements ApplicationState {
  const factory _ApplicationState(
      {final bool isLoading,
      final ErrorModel? error,
      final PersonModel? userInfo,
      final InvoiceResponse? invoiceResponse}) = _$ApplicationStateImpl;

  @override
  bool get isLoading;
  @override
  ErrorModel? get error;
  @override
  PersonModel? get userInfo;
  @override
  InvoiceResponse? get invoiceResponse;

  /// Create a copy of ApplicationState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ApplicationStateImplCopyWith<_$ApplicationStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
