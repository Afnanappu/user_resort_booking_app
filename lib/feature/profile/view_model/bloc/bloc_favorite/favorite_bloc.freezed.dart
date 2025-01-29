// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'favorite_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$FavoriteEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String propertyId, String userId) toggleFavorite,
    required TResult Function(String propertyId, String userId)
        checkFavoriteStatus,
    required TResult Function(String userId) fetchFavorites,
    required TResult Function() reEmit,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String propertyId, String userId)? toggleFavorite,
    TResult? Function(String propertyId, String userId)? checkFavoriteStatus,
    TResult? Function(String userId)? fetchFavorites,
    TResult? Function()? reEmit,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String propertyId, String userId)? toggleFavorite,
    TResult Function(String propertyId, String userId)? checkFavoriteStatus,
    TResult Function(String userId)? fetchFavorites,
    TResult Function()? reEmit,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_ToggleFavorite value) toggleFavorite,
    required TResult Function(_CheckFavoriteStatus value) checkFavoriteStatus,
    required TResult Function(_FetchFavorites value) fetchFavorites,
    required TResult Function(_ReEmit value) reEmit,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_ToggleFavorite value)? toggleFavorite,
    TResult? Function(_CheckFavoriteStatus value)? checkFavoriteStatus,
    TResult? Function(_FetchFavorites value)? fetchFavorites,
    TResult? Function(_ReEmit value)? reEmit,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_ToggleFavorite value)? toggleFavorite,
    TResult Function(_CheckFavoriteStatus value)? checkFavoriteStatus,
    TResult Function(_FetchFavorites value)? fetchFavorites,
    TResult Function(_ReEmit value)? reEmit,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FavoriteEventCopyWith<$Res> {
  factory $FavoriteEventCopyWith(
          FavoriteEvent value, $Res Function(FavoriteEvent) then) =
      _$FavoriteEventCopyWithImpl<$Res, FavoriteEvent>;
}

/// @nodoc
class _$FavoriteEventCopyWithImpl<$Res, $Val extends FavoriteEvent>
    implements $FavoriteEventCopyWith<$Res> {
  _$FavoriteEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of FavoriteEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$ToggleFavoriteImplCopyWith<$Res> {
  factory _$$ToggleFavoriteImplCopyWith(_$ToggleFavoriteImpl value,
          $Res Function(_$ToggleFavoriteImpl) then) =
      __$$ToggleFavoriteImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String propertyId, String userId});
}

/// @nodoc
class __$$ToggleFavoriteImplCopyWithImpl<$Res>
    extends _$FavoriteEventCopyWithImpl<$Res, _$ToggleFavoriteImpl>
    implements _$$ToggleFavoriteImplCopyWith<$Res> {
  __$$ToggleFavoriteImplCopyWithImpl(
      _$ToggleFavoriteImpl _value, $Res Function(_$ToggleFavoriteImpl) _then)
      : super(_value, _then);

  /// Create a copy of FavoriteEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? propertyId = null,
    Object? userId = null,
  }) {
    return _then(_$ToggleFavoriteImpl(
      propertyId: null == propertyId
          ? _value.propertyId
          : propertyId // ignore: cast_nullable_to_non_nullable
              as String,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$ToggleFavoriteImpl implements _ToggleFavorite {
  const _$ToggleFavoriteImpl({required this.propertyId, required this.userId});

  @override
  final String propertyId;
  @override
  final String userId;

  @override
  String toString() {
    return 'FavoriteEvent.toggleFavorite(propertyId: $propertyId, userId: $userId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ToggleFavoriteImpl &&
            (identical(other.propertyId, propertyId) ||
                other.propertyId == propertyId) &&
            (identical(other.userId, userId) || other.userId == userId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, propertyId, userId);

  /// Create a copy of FavoriteEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ToggleFavoriteImplCopyWith<_$ToggleFavoriteImpl> get copyWith =>
      __$$ToggleFavoriteImplCopyWithImpl<_$ToggleFavoriteImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String propertyId, String userId) toggleFavorite,
    required TResult Function(String propertyId, String userId)
        checkFavoriteStatus,
    required TResult Function(String userId) fetchFavorites,
    required TResult Function() reEmit,
  }) {
    return toggleFavorite(propertyId, userId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String propertyId, String userId)? toggleFavorite,
    TResult? Function(String propertyId, String userId)? checkFavoriteStatus,
    TResult? Function(String userId)? fetchFavorites,
    TResult? Function()? reEmit,
  }) {
    return toggleFavorite?.call(propertyId, userId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String propertyId, String userId)? toggleFavorite,
    TResult Function(String propertyId, String userId)? checkFavoriteStatus,
    TResult Function(String userId)? fetchFavorites,
    TResult Function()? reEmit,
    required TResult orElse(),
  }) {
    if (toggleFavorite != null) {
      return toggleFavorite(propertyId, userId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_ToggleFavorite value) toggleFavorite,
    required TResult Function(_CheckFavoriteStatus value) checkFavoriteStatus,
    required TResult Function(_FetchFavorites value) fetchFavorites,
    required TResult Function(_ReEmit value) reEmit,
  }) {
    return toggleFavorite(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_ToggleFavorite value)? toggleFavorite,
    TResult? Function(_CheckFavoriteStatus value)? checkFavoriteStatus,
    TResult? Function(_FetchFavorites value)? fetchFavorites,
    TResult? Function(_ReEmit value)? reEmit,
  }) {
    return toggleFavorite?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_ToggleFavorite value)? toggleFavorite,
    TResult Function(_CheckFavoriteStatus value)? checkFavoriteStatus,
    TResult Function(_FetchFavorites value)? fetchFavorites,
    TResult Function(_ReEmit value)? reEmit,
    required TResult orElse(),
  }) {
    if (toggleFavorite != null) {
      return toggleFavorite(this);
    }
    return orElse();
  }
}

abstract class _ToggleFavorite implements FavoriteEvent {
  const factory _ToggleFavorite(
      {required final String propertyId,
      required final String userId}) = _$ToggleFavoriteImpl;

  String get propertyId;
  String get userId;

  /// Create a copy of FavoriteEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ToggleFavoriteImplCopyWith<_$ToggleFavoriteImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$CheckFavoriteStatusImplCopyWith<$Res> {
  factory _$$CheckFavoriteStatusImplCopyWith(_$CheckFavoriteStatusImpl value,
          $Res Function(_$CheckFavoriteStatusImpl) then) =
      __$$CheckFavoriteStatusImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String propertyId, String userId});
}

/// @nodoc
class __$$CheckFavoriteStatusImplCopyWithImpl<$Res>
    extends _$FavoriteEventCopyWithImpl<$Res, _$CheckFavoriteStatusImpl>
    implements _$$CheckFavoriteStatusImplCopyWith<$Res> {
  __$$CheckFavoriteStatusImplCopyWithImpl(_$CheckFavoriteStatusImpl _value,
      $Res Function(_$CheckFavoriteStatusImpl) _then)
      : super(_value, _then);

  /// Create a copy of FavoriteEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? propertyId = null,
    Object? userId = null,
  }) {
    return _then(_$CheckFavoriteStatusImpl(
      propertyId: null == propertyId
          ? _value.propertyId
          : propertyId // ignore: cast_nullable_to_non_nullable
              as String,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$CheckFavoriteStatusImpl implements _CheckFavoriteStatus {
  const _$CheckFavoriteStatusImpl(
      {required this.propertyId, required this.userId});

  @override
  final String propertyId;
  @override
  final String userId;

  @override
  String toString() {
    return 'FavoriteEvent.checkFavoriteStatus(propertyId: $propertyId, userId: $userId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CheckFavoriteStatusImpl &&
            (identical(other.propertyId, propertyId) ||
                other.propertyId == propertyId) &&
            (identical(other.userId, userId) || other.userId == userId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, propertyId, userId);

  /// Create a copy of FavoriteEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CheckFavoriteStatusImplCopyWith<_$CheckFavoriteStatusImpl> get copyWith =>
      __$$CheckFavoriteStatusImplCopyWithImpl<_$CheckFavoriteStatusImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String propertyId, String userId) toggleFavorite,
    required TResult Function(String propertyId, String userId)
        checkFavoriteStatus,
    required TResult Function(String userId) fetchFavorites,
    required TResult Function() reEmit,
  }) {
    return checkFavoriteStatus(propertyId, userId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String propertyId, String userId)? toggleFavorite,
    TResult? Function(String propertyId, String userId)? checkFavoriteStatus,
    TResult? Function(String userId)? fetchFavorites,
    TResult? Function()? reEmit,
  }) {
    return checkFavoriteStatus?.call(propertyId, userId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String propertyId, String userId)? toggleFavorite,
    TResult Function(String propertyId, String userId)? checkFavoriteStatus,
    TResult Function(String userId)? fetchFavorites,
    TResult Function()? reEmit,
    required TResult orElse(),
  }) {
    if (checkFavoriteStatus != null) {
      return checkFavoriteStatus(propertyId, userId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_ToggleFavorite value) toggleFavorite,
    required TResult Function(_CheckFavoriteStatus value) checkFavoriteStatus,
    required TResult Function(_FetchFavorites value) fetchFavorites,
    required TResult Function(_ReEmit value) reEmit,
  }) {
    return checkFavoriteStatus(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_ToggleFavorite value)? toggleFavorite,
    TResult? Function(_CheckFavoriteStatus value)? checkFavoriteStatus,
    TResult? Function(_FetchFavorites value)? fetchFavorites,
    TResult? Function(_ReEmit value)? reEmit,
  }) {
    return checkFavoriteStatus?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_ToggleFavorite value)? toggleFavorite,
    TResult Function(_CheckFavoriteStatus value)? checkFavoriteStatus,
    TResult Function(_FetchFavorites value)? fetchFavorites,
    TResult Function(_ReEmit value)? reEmit,
    required TResult orElse(),
  }) {
    if (checkFavoriteStatus != null) {
      return checkFavoriteStatus(this);
    }
    return orElse();
  }
}

abstract class _CheckFavoriteStatus implements FavoriteEvent {
  const factory _CheckFavoriteStatus(
      {required final String propertyId,
      required final String userId}) = _$CheckFavoriteStatusImpl;

  String get propertyId;
  String get userId;

  /// Create a copy of FavoriteEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CheckFavoriteStatusImplCopyWith<_$CheckFavoriteStatusImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$FetchFavoritesImplCopyWith<$Res> {
  factory _$$FetchFavoritesImplCopyWith(_$FetchFavoritesImpl value,
          $Res Function(_$FetchFavoritesImpl) then) =
      __$$FetchFavoritesImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String userId});
}

/// @nodoc
class __$$FetchFavoritesImplCopyWithImpl<$Res>
    extends _$FavoriteEventCopyWithImpl<$Res, _$FetchFavoritesImpl>
    implements _$$FetchFavoritesImplCopyWith<$Res> {
  __$$FetchFavoritesImplCopyWithImpl(
      _$FetchFavoritesImpl _value, $Res Function(_$FetchFavoritesImpl) _then)
      : super(_value, _then);

  /// Create a copy of FavoriteEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = null,
  }) {
    return _then(_$FetchFavoritesImpl(
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$FetchFavoritesImpl implements _FetchFavorites {
  const _$FetchFavoritesImpl({required this.userId});

  @override
  final String userId;

  @override
  String toString() {
    return 'FavoriteEvent.fetchFavorites(userId: $userId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FetchFavoritesImpl &&
            (identical(other.userId, userId) || other.userId == userId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, userId);

  /// Create a copy of FavoriteEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$FetchFavoritesImplCopyWith<_$FetchFavoritesImpl> get copyWith =>
      __$$FetchFavoritesImplCopyWithImpl<_$FetchFavoritesImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String propertyId, String userId) toggleFavorite,
    required TResult Function(String propertyId, String userId)
        checkFavoriteStatus,
    required TResult Function(String userId) fetchFavorites,
    required TResult Function() reEmit,
  }) {
    return fetchFavorites(userId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String propertyId, String userId)? toggleFavorite,
    TResult? Function(String propertyId, String userId)? checkFavoriteStatus,
    TResult? Function(String userId)? fetchFavorites,
    TResult? Function()? reEmit,
  }) {
    return fetchFavorites?.call(userId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String propertyId, String userId)? toggleFavorite,
    TResult Function(String propertyId, String userId)? checkFavoriteStatus,
    TResult Function(String userId)? fetchFavorites,
    TResult Function()? reEmit,
    required TResult orElse(),
  }) {
    if (fetchFavorites != null) {
      return fetchFavorites(userId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_ToggleFavorite value) toggleFavorite,
    required TResult Function(_CheckFavoriteStatus value) checkFavoriteStatus,
    required TResult Function(_FetchFavorites value) fetchFavorites,
    required TResult Function(_ReEmit value) reEmit,
  }) {
    return fetchFavorites(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_ToggleFavorite value)? toggleFavorite,
    TResult? Function(_CheckFavoriteStatus value)? checkFavoriteStatus,
    TResult? Function(_FetchFavorites value)? fetchFavorites,
    TResult? Function(_ReEmit value)? reEmit,
  }) {
    return fetchFavorites?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_ToggleFavorite value)? toggleFavorite,
    TResult Function(_CheckFavoriteStatus value)? checkFavoriteStatus,
    TResult Function(_FetchFavorites value)? fetchFavorites,
    TResult Function(_ReEmit value)? reEmit,
    required TResult orElse(),
  }) {
    if (fetchFavorites != null) {
      return fetchFavorites(this);
    }
    return orElse();
  }
}

abstract class _FetchFavorites implements FavoriteEvent {
  const factory _FetchFavorites({required final String userId}) =
      _$FetchFavoritesImpl;

  String get userId;

  /// Create a copy of FavoriteEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$FetchFavoritesImplCopyWith<_$FetchFavoritesImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ReEmitImplCopyWith<$Res> {
  factory _$$ReEmitImplCopyWith(
          _$ReEmitImpl value, $Res Function(_$ReEmitImpl) then) =
      __$$ReEmitImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ReEmitImplCopyWithImpl<$Res>
    extends _$FavoriteEventCopyWithImpl<$Res, _$ReEmitImpl>
    implements _$$ReEmitImplCopyWith<$Res> {
  __$$ReEmitImplCopyWithImpl(
      _$ReEmitImpl _value, $Res Function(_$ReEmitImpl) _then)
      : super(_value, _then);

  /// Create a copy of FavoriteEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$ReEmitImpl implements _ReEmit {
  const _$ReEmitImpl();

  @override
  String toString() {
    return 'FavoriteEvent.reEmit()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$ReEmitImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String propertyId, String userId) toggleFavorite,
    required TResult Function(String propertyId, String userId)
        checkFavoriteStatus,
    required TResult Function(String userId) fetchFavorites,
    required TResult Function() reEmit,
  }) {
    return reEmit();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String propertyId, String userId)? toggleFavorite,
    TResult? Function(String propertyId, String userId)? checkFavoriteStatus,
    TResult? Function(String userId)? fetchFavorites,
    TResult? Function()? reEmit,
  }) {
    return reEmit?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String propertyId, String userId)? toggleFavorite,
    TResult Function(String propertyId, String userId)? checkFavoriteStatus,
    TResult Function(String userId)? fetchFavorites,
    TResult Function()? reEmit,
    required TResult orElse(),
  }) {
    if (reEmit != null) {
      return reEmit();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_ToggleFavorite value) toggleFavorite,
    required TResult Function(_CheckFavoriteStatus value) checkFavoriteStatus,
    required TResult Function(_FetchFavorites value) fetchFavorites,
    required TResult Function(_ReEmit value) reEmit,
  }) {
    return reEmit(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_ToggleFavorite value)? toggleFavorite,
    TResult? Function(_CheckFavoriteStatus value)? checkFavoriteStatus,
    TResult? Function(_FetchFavorites value)? fetchFavorites,
    TResult? Function(_ReEmit value)? reEmit,
  }) {
    return reEmit?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_ToggleFavorite value)? toggleFavorite,
    TResult Function(_CheckFavoriteStatus value)? checkFavoriteStatus,
    TResult Function(_FetchFavorites value)? fetchFavorites,
    TResult Function(_ReEmit value)? reEmit,
    required TResult orElse(),
  }) {
    if (reEmit != null) {
      return reEmit(this);
    }
    return orElse();
  }
}

abstract class _ReEmit implements FavoriteEvent {
  const factory _ReEmit() = _$ReEmitImpl;
}

/// @nodoc
mixin _$FavoriteState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(List<PropertyCardModel> properties) loaded,
    required TResult Function(String propertyId, bool isFavorite)
        favoriteStatusChecked,
    required TResult Function(String error) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function(List<PropertyCardModel> properties)? loaded,
    TResult? Function(String propertyId, bool isFavorite)?
        favoriteStatusChecked,
    TResult? Function(String error)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(List<PropertyCardModel> properties)? loaded,
    TResult Function(String propertyId, bool isFavorite)? favoriteStatusChecked,
    TResult Function(String error)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Loading value) loading,
    required TResult Function(_Loaded value) loaded,
    required TResult Function(_FavoriteStatusChecked value)
        favoriteStatusChecked,
    required TResult Function(_Error value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Loaded value)? loaded,
    TResult? Function(_FavoriteStatusChecked value)? favoriteStatusChecked,
    TResult? Function(_Error value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Loading value)? loading,
    TResult Function(_Loaded value)? loaded,
    TResult Function(_FavoriteStatusChecked value)? favoriteStatusChecked,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FavoriteStateCopyWith<$Res> {
  factory $FavoriteStateCopyWith(
          FavoriteState value, $Res Function(FavoriteState) then) =
      _$FavoriteStateCopyWithImpl<$Res, FavoriteState>;
}

/// @nodoc
class _$FavoriteStateCopyWithImpl<$Res, $Val extends FavoriteState>
    implements $FavoriteStateCopyWith<$Res> {
  _$FavoriteStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of FavoriteState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$LoadingImplCopyWith<$Res> {
  factory _$$LoadingImplCopyWith(
          _$LoadingImpl value, $Res Function(_$LoadingImpl) then) =
      __$$LoadingImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$LoadingImplCopyWithImpl<$Res>
    extends _$FavoriteStateCopyWithImpl<$Res, _$LoadingImpl>
    implements _$$LoadingImplCopyWith<$Res> {
  __$$LoadingImplCopyWithImpl(
      _$LoadingImpl _value, $Res Function(_$LoadingImpl) _then)
      : super(_value, _then);

  /// Create a copy of FavoriteState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$LoadingImpl implements _Loading {
  const _$LoadingImpl();

  @override
  String toString() {
    return 'FavoriteState.loading()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$LoadingImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(List<PropertyCardModel> properties) loaded,
    required TResult Function(String propertyId, bool isFavorite)
        favoriteStatusChecked,
    required TResult Function(String error) error,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function(List<PropertyCardModel> properties)? loaded,
    TResult? Function(String propertyId, bool isFavorite)?
        favoriteStatusChecked,
    TResult? Function(String error)? error,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(List<PropertyCardModel> properties)? loaded,
    TResult Function(String propertyId, bool isFavorite)? favoriteStatusChecked,
    TResult Function(String error)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Loading value) loading,
    required TResult Function(_Loaded value) loaded,
    required TResult Function(_FavoriteStatusChecked value)
        favoriteStatusChecked,
    required TResult Function(_Error value) error,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Loaded value)? loaded,
    TResult? Function(_FavoriteStatusChecked value)? favoriteStatusChecked,
    TResult? Function(_Error value)? error,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Loading value)? loading,
    TResult Function(_Loaded value)? loaded,
    TResult Function(_FavoriteStatusChecked value)? favoriteStatusChecked,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class _Loading implements FavoriteState {
  const factory _Loading() = _$LoadingImpl;
}

/// @nodoc
abstract class _$$LoadedImplCopyWith<$Res> {
  factory _$$LoadedImplCopyWith(
          _$LoadedImpl value, $Res Function(_$LoadedImpl) then) =
      __$$LoadedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({List<PropertyCardModel> properties});
}

/// @nodoc
class __$$LoadedImplCopyWithImpl<$Res>
    extends _$FavoriteStateCopyWithImpl<$Res, _$LoadedImpl>
    implements _$$LoadedImplCopyWith<$Res> {
  __$$LoadedImplCopyWithImpl(
      _$LoadedImpl _value, $Res Function(_$LoadedImpl) _then)
      : super(_value, _then);

  /// Create a copy of FavoriteState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? properties = null,
  }) {
    return _then(_$LoadedImpl(
      null == properties
          ? _value._properties
          : properties // ignore: cast_nullable_to_non_nullable
              as List<PropertyCardModel>,
    ));
  }
}

/// @nodoc

class _$LoadedImpl implements _Loaded {
  const _$LoadedImpl(final List<PropertyCardModel> properties)
      : _properties = properties;

  final List<PropertyCardModel> _properties;
  @override
  List<PropertyCardModel> get properties {
    if (_properties is EqualUnmodifiableListView) return _properties;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_properties);
  }

  @override
  String toString() {
    return 'FavoriteState.loaded(properties: $properties)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoadedImpl &&
            const DeepCollectionEquality()
                .equals(other._properties, _properties));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_properties));

  /// Create a copy of FavoriteState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LoadedImplCopyWith<_$LoadedImpl> get copyWith =>
      __$$LoadedImplCopyWithImpl<_$LoadedImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(List<PropertyCardModel> properties) loaded,
    required TResult Function(String propertyId, bool isFavorite)
        favoriteStatusChecked,
    required TResult Function(String error) error,
  }) {
    return loaded(properties);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function(List<PropertyCardModel> properties)? loaded,
    TResult? Function(String propertyId, bool isFavorite)?
        favoriteStatusChecked,
    TResult? Function(String error)? error,
  }) {
    return loaded?.call(properties);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(List<PropertyCardModel> properties)? loaded,
    TResult Function(String propertyId, bool isFavorite)? favoriteStatusChecked,
    TResult Function(String error)? error,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(properties);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Loading value) loading,
    required TResult Function(_Loaded value) loaded,
    required TResult Function(_FavoriteStatusChecked value)
        favoriteStatusChecked,
    required TResult Function(_Error value) error,
  }) {
    return loaded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Loaded value)? loaded,
    TResult? Function(_FavoriteStatusChecked value)? favoriteStatusChecked,
    TResult? Function(_Error value)? error,
  }) {
    return loaded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Loading value)? loading,
    TResult Function(_Loaded value)? loaded,
    TResult Function(_FavoriteStatusChecked value)? favoriteStatusChecked,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(this);
    }
    return orElse();
  }
}

abstract class _Loaded implements FavoriteState {
  const factory _Loaded(final List<PropertyCardModel> properties) =
      _$LoadedImpl;

  List<PropertyCardModel> get properties;

  /// Create a copy of FavoriteState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LoadedImplCopyWith<_$LoadedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$FavoriteStatusCheckedImplCopyWith<$Res> {
  factory _$$FavoriteStatusCheckedImplCopyWith(
          _$FavoriteStatusCheckedImpl value,
          $Res Function(_$FavoriteStatusCheckedImpl) then) =
      __$$FavoriteStatusCheckedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String propertyId, bool isFavorite});
}

/// @nodoc
class __$$FavoriteStatusCheckedImplCopyWithImpl<$Res>
    extends _$FavoriteStateCopyWithImpl<$Res, _$FavoriteStatusCheckedImpl>
    implements _$$FavoriteStatusCheckedImplCopyWith<$Res> {
  __$$FavoriteStatusCheckedImplCopyWithImpl(_$FavoriteStatusCheckedImpl _value,
      $Res Function(_$FavoriteStatusCheckedImpl) _then)
      : super(_value, _then);

  /// Create a copy of FavoriteState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? propertyId = null,
    Object? isFavorite = null,
  }) {
    return _then(_$FavoriteStatusCheckedImpl(
      propertyId: null == propertyId
          ? _value.propertyId
          : propertyId // ignore: cast_nullable_to_non_nullable
              as String,
      isFavorite: null == isFavorite
          ? _value.isFavorite
          : isFavorite // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$FavoriteStatusCheckedImpl implements _FavoriteStatusChecked {
  const _$FavoriteStatusCheckedImpl(
      {required this.propertyId, required this.isFavorite});

  @override
  final String propertyId;
  @override
  final bool isFavorite;

  @override
  String toString() {
    return 'FavoriteState.favoriteStatusChecked(propertyId: $propertyId, isFavorite: $isFavorite)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FavoriteStatusCheckedImpl &&
            (identical(other.propertyId, propertyId) ||
                other.propertyId == propertyId) &&
            (identical(other.isFavorite, isFavorite) ||
                other.isFavorite == isFavorite));
  }

  @override
  int get hashCode => Object.hash(runtimeType, propertyId, isFavorite);

  /// Create a copy of FavoriteState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$FavoriteStatusCheckedImplCopyWith<_$FavoriteStatusCheckedImpl>
      get copyWith => __$$FavoriteStatusCheckedImplCopyWithImpl<
          _$FavoriteStatusCheckedImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(List<PropertyCardModel> properties) loaded,
    required TResult Function(String propertyId, bool isFavorite)
        favoriteStatusChecked,
    required TResult Function(String error) error,
  }) {
    return favoriteStatusChecked(propertyId, isFavorite);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function(List<PropertyCardModel> properties)? loaded,
    TResult? Function(String propertyId, bool isFavorite)?
        favoriteStatusChecked,
    TResult? Function(String error)? error,
  }) {
    return favoriteStatusChecked?.call(propertyId, isFavorite);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(List<PropertyCardModel> properties)? loaded,
    TResult Function(String propertyId, bool isFavorite)? favoriteStatusChecked,
    TResult Function(String error)? error,
    required TResult orElse(),
  }) {
    if (favoriteStatusChecked != null) {
      return favoriteStatusChecked(propertyId, isFavorite);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Loading value) loading,
    required TResult Function(_Loaded value) loaded,
    required TResult Function(_FavoriteStatusChecked value)
        favoriteStatusChecked,
    required TResult Function(_Error value) error,
  }) {
    return favoriteStatusChecked(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Loaded value)? loaded,
    TResult? Function(_FavoriteStatusChecked value)? favoriteStatusChecked,
    TResult? Function(_Error value)? error,
  }) {
    return favoriteStatusChecked?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Loading value)? loading,
    TResult Function(_Loaded value)? loaded,
    TResult Function(_FavoriteStatusChecked value)? favoriteStatusChecked,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (favoriteStatusChecked != null) {
      return favoriteStatusChecked(this);
    }
    return orElse();
  }
}

abstract class _FavoriteStatusChecked implements FavoriteState {
  const factory _FavoriteStatusChecked(
      {required final String propertyId,
      required final bool isFavorite}) = _$FavoriteStatusCheckedImpl;

  String get propertyId;
  bool get isFavorite;

  /// Create a copy of FavoriteState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$FavoriteStatusCheckedImplCopyWith<_$FavoriteStatusCheckedImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ErrorImplCopyWith<$Res> {
  factory _$$ErrorImplCopyWith(
          _$ErrorImpl value, $Res Function(_$ErrorImpl) then) =
      __$$ErrorImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String error});
}

/// @nodoc
class __$$ErrorImplCopyWithImpl<$Res>
    extends _$FavoriteStateCopyWithImpl<$Res, _$ErrorImpl>
    implements _$$ErrorImplCopyWith<$Res> {
  __$$ErrorImplCopyWithImpl(
      _$ErrorImpl _value, $Res Function(_$ErrorImpl) _then)
      : super(_value, _then);

  /// Create a copy of FavoriteState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? error = null,
  }) {
    return _then(_$ErrorImpl(
      null == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$ErrorImpl implements _Error {
  const _$ErrorImpl(this.error);

  @override
  final String error;

  @override
  String toString() {
    return 'FavoriteState.error(error: $error)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ErrorImpl &&
            (identical(other.error, error) || other.error == error));
  }

  @override
  int get hashCode => Object.hash(runtimeType, error);

  /// Create a copy of FavoriteState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ErrorImplCopyWith<_$ErrorImpl> get copyWith =>
      __$$ErrorImplCopyWithImpl<_$ErrorImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(List<PropertyCardModel> properties) loaded,
    required TResult Function(String propertyId, bool isFavorite)
        favoriteStatusChecked,
    required TResult Function(String error) error,
  }) {
    return error(this.error);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function(List<PropertyCardModel> properties)? loaded,
    TResult? Function(String propertyId, bool isFavorite)?
        favoriteStatusChecked,
    TResult? Function(String error)? error,
  }) {
    return error?.call(this.error);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(List<PropertyCardModel> properties)? loaded,
    TResult Function(String propertyId, bool isFavorite)? favoriteStatusChecked,
    TResult Function(String error)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this.error);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Loading value) loading,
    required TResult Function(_Loaded value) loaded,
    required TResult Function(_FavoriteStatusChecked value)
        favoriteStatusChecked,
    required TResult Function(_Error value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Loaded value)? loaded,
    TResult? Function(_FavoriteStatusChecked value)? favoriteStatusChecked,
    TResult? Function(_Error value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Loading value)? loading,
    TResult Function(_Loaded value)? loaded,
    TResult Function(_FavoriteStatusChecked value)? favoriteStatusChecked,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class _Error implements FavoriteState {
  const factory _Error(final String error) = _$ErrorImpl;

  String get error;

  /// Create a copy of FavoriteState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ErrorImplCopyWith<_$ErrorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
