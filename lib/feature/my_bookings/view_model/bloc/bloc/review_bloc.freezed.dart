// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'review_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ReviewEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(ReviewModel review) addReview,
    required TResult Function() clear,
    required TResult Function(String propertyId, String bookingId)
        fetchMyReview,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(ReviewModel review)? addReview,
    TResult? Function()? clear,
    TResult? Function(String propertyId, String bookingId)? fetchMyReview,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(ReviewModel review)? addReview,
    TResult Function()? clear,
    TResult Function(String propertyId, String bookingId)? fetchMyReview,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_AddReview value) addReview,
    required TResult Function(_Clear value) clear,
    required TResult Function(_FetchMyReview value) fetchMyReview,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_AddReview value)? addReview,
    TResult? Function(_Clear value)? clear,
    TResult? Function(_FetchMyReview value)? fetchMyReview,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_AddReview value)? addReview,
    TResult Function(_Clear value)? clear,
    TResult Function(_FetchMyReview value)? fetchMyReview,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ReviewEventCopyWith<$Res> {
  factory $ReviewEventCopyWith(
          ReviewEvent value, $Res Function(ReviewEvent) then) =
      _$ReviewEventCopyWithImpl<$Res, ReviewEvent>;
}

/// @nodoc
class _$ReviewEventCopyWithImpl<$Res, $Val extends ReviewEvent>
    implements $ReviewEventCopyWith<$Res> {
  _$ReviewEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ReviewEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$AddReviewImplCopyWith<$Res> {
  factory _$$AddReviewImplCopyWith(
          _$AddReviewImpl value, $Res Function(_$AddReviewImpl) then) =
      __$$AddReviewImplCopyWithImpl<$Res>;
  @useResult
  $Res call({ReviewModel review});
}

/// @nodoc
class __$$AddReviewImplCopyWithImpl<$Res>
    extends _$ReviewEventCopyWithImpl<$Res, _$AddReviewImpl>
    implements _$$AddReviewImplCopyWith<$Res> {
  __$$AddReviewImplCopyWithImpl(
      _$AddReviewImpl _value, $Res Function(_$AddReviewImpl) _then)
      : super(_value, _then);

  /// Create a copy of ReviewEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? review = null,
  }) {
    return _then(_$AddReviewImpl(
      null == review
          ? _value.review
          : review // ignore: cast_nullable_to_non_nullable
              as ReviewModel,
    ));
  }
}

/// @nodoc

class _$AddReviewImpl implements _AddReview {
  const _$AddReviewImpl(this.review);

  @override
  final ReviewModel review;

  @override
  String toString() {
    return 'ReviewEvent.addReview(review: $review)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AddReviewImpl &&
            (identical(other.review, review) || other.review == review));
  }

  @override
  int get hashCode => Object.hash(runtimeType, review);

  /// Create a copy of ReviewEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AddReviewImplCopyWith<_$AddReviewImpl> get copyWith =>
      __$$AddReviewImplCopyWithImpl<_$AddReviewImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(ReviewModel review) addReview,
    required TResult Function() clear,
    required TResult Function(String propertyId, String bookingId)
        fetchMyReview,
  }) {
    return addReview(review);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(ReviewModel review)? addReview,
    TResult? Function()? clear,
    TResult? Function(String propertyId, String bookingId)? fetchMyReview,
  }) {
    return addReview?.call(review);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(ReviewModel review)? addReview,
    TResult Function()? clear,
    TResult Function(String propertyId, String bookingId)? fetchMyReview,
    required TResult orElse(),
  }) {
    if (addReview != null) {
      return addReview(review);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_AddReview value) addReview,
    required TResult Function(_Clear value) clear,
    required TResult Function(_FetchMyReview value) fetchMyReview,
  }) {
    return addReview(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_AddReview value)? addReview,
    TResult? Function(_Clear value)? clear,
    TResult? Function(_FetchMyReview value)? fetchMyReview,
  }) {
    return addReview?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_AddReview value)? addReview,
    TResult Function(_Clear value)? clear,
    TResult Function(_FetchMyReview value)? fetchMyReview,
    required TResult orElse(),
  }) {
    if (addReview != null) {
      return addReview(this);
    }
    return orElse();
  }
}

abstract class _AddReview implements ReviewEvent {
  const factory _AddReview(final ReviewModel review) = _$AddReviewImpl;

  ReviewModel get review;

  /// Create a copy of ReviewEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AddReviewImplCopyWith<_$AddReviewImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ClearImplCopyWith<$Res> {
  factory _$$ClearImplCopyWith(
          _$ClearImpl value, $Res Function(_$ClearImpl) then) =
      __$$ClearImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ClearImplCopyWithImpl<$Res>
    extends _$ReviewEventCopyWithImpl<$Res, _$ClearImpl>
    implements _$$ClearImplCopyWith<$Res> {
  __$$ClearImplCopyWithImpl(
      _$ClearImpl _value, $Res Function(_$ClearImpl) _then)
      : super(_value, _then);

  /// Create a copy of ReviewEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$ClearImpl implements _Clear {
  const _$ClearImpl();

  @override
  String toString() {
    return 'ReviewEvent.clear()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$ClearImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(ReviewModel review) addReview,
    required TResult Function() clear,
    required TResult Function(String propertyId, String bookingId)
        fetchMyReview,
  }) {
    return clear();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(ReviewModel review)? addReview,
    TResult? Function()? clear,
    TResult? Function(String propertyId, String bookingId)? fetchMyReview,
  }) {
    return clear?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(ReviewModel review)? addReview,
    TResult Function()? clear,
    TResult Function(String propertyId, String bookingId)? fetchMyReview,
    required TResult orElse(),
  }) {
    if (clear != null) {
      return clear();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_AddReview value) addReview,
    required TResult Function(_Clear value) clear,
    required TResult Function(_FetchMyReview value) fetchMyReview,
  }) {
    return clear(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_AddReview value)? addReview,
    TResult? Function(_Clear value)? clear,
    TResult? Function(_FetchMyReview value)? fetchMyReview,
  }) {
    return clear?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_AddReview value)? addReview,
    TResult Function(_Clear value)? clear,
    TResult Function(_FetchMyReview value)? fetchMyReview,
    required TResult orElse(),
  }) {
    if (clear != null) {
      return clear(this);
    }
    return orElse();
  }
}

abstract class _Clear implements ReviewEvent {
  const factory _Clear() = _$ClearImpl;
}

/// @nodoc
abstract class _$$FetchMyReviewImplCopyWith<$Res> {
  factory _$$FetchMyReviewImplCopyWith(
          _$FetchMyReviewImpl value, $Res Function(_$FetchMyReviewImpl) then) =
      __$$FetchMyReviewImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String propertyId, String bookingId});
}

/// @nodoc
class __$$FetchMyReviewImplCopyWithImpl<$Res>
    extends _$ReviewEventCopyWithImpl<$Res, _$FetchMyReviewImpl>
    implements _$$FetchMyReviewImplCopyWith<$Res> {
  __$$FetchMyReviewImplCopyWithImpl(
      _$FetchMyReviewImpl _value, $Res Function(_$FetchMyReviewImpl) _then)
      : super(_value, _then);

  /// Create a copy of ReviewEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? propertyId = null,
    Object? bookingId = null,
  }) {
    return _then(_$FetchMyReviewImpl(
      propertyId: null == propertyId
          ? _value.propertyId
          : propertyId // ignore: cast_nullable_to_non_nullable
              as String,
      bookingId: null == bookingId
          ? _value.bookingId
          : bookingId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$FetchMyReviewImpl implements _FetchMyReview {
  const _$FetchMyReviewImpl(
      {required this.propertyId, required this.bookingId});

  @override
  final String propertyId;
  @override
  final String bookingId;

  @override
  String toString() {
    return 'ReviewEvent.fetchMyReview(propertyId: $propertyId, bookingId: $bookingId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FetchMyReviewImpl &&
            (identical(other.propertyId, propertyId) ||
                other.propertyId == propertyId) &&
            (identical(other.bookingId, bookingId) ||
                other.bookingId == bookingId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, propertyId, bookingId);

  /// Create a copy of ReviewEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$FetchMyReviewImplCopyWith<_$FetchMyReviewImpl> get copyWith =>
      __$$FetchMyReviewImplCopyWithImpl<_$FetchMyReviewImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(ReviewModel review) addReview,
    required TResult Function() clear,
    required TResult Function(String propertyId, String bookingId)
        fetchMyReview,
  }) {
    return fetchMyReview(propertyId, bookingId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(ReviewModel review)? addReview,
    TResult? Function()? clear,
    TResult? Function(String propertyId, String bookingId)? fetchMyReview,
  }) {
    return fetchMyReview?.call(propertyId, bookingId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(ReviewModel review)? addReview,
    TResult Function()? clear,
    TResult Function(String propertyId, String bookingId)? fetchMyReview,
    required TResult orElse(),
  }) {
    if (fetchMyReview != null) {
      return fetchMyReview(propertyId, bookingId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_AddReview value) addReview,
    required TResult Function(_Clear value) clear,
    required TResult Function(_FetchMyReview value) fetchMyReview,
  }) {
    return fetchMyReview(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_AddReview value)? addReview,
    TResult? Function(_Clear value)? clear,
    TResult? Function(_FetchMyReview value)? fetchMyReview,
  }) {
    return fetchMyReview?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_AddReview value)? addReview,
    TResult Function(_Clear value)? clear,
    TResult Function(_FetchMyReview value)? fetchMyReview,
    required TResult orElse(),
  }) {
    if (fetchMyReview != null) {
      return fetchMyReview(this);
    }
    return orElse();
  }
}

abstract class _FetchMyReview implements ReviewEvent {
  const factory _FetchMyReview(
      {required final String propertyId,
      required final String bookingId}) = _$FetchMyReviewImpl;

  String get propertyId;
  String get bookingId;

  /// Create a copy of ReviewEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$FetchMyReviewImplCopyWith<_$FetchMyReviewImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$ReviewState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(String error) error,
    required TResult Function(ReviewModel review) submitted,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(String error)? error,
    TResult? Function(ReviewModel review)? submitted,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(String error)? error,
    TResult Function(ReviewModel review)? submitted,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Error value) error,
    required TResult Function(_Submitted value) submitted,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Error value)? error,
    TResult? Function(_Submitted value)? submitted,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Error value)? error,
    TResult Function(_Submitted value)? submitted,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ReviewStateCopyWith<$Res> {
  factory $ReviewStateCopyWith(
          ReviewState value, $Res Function(ReviewState) then) =
      _$ReviewStateCopyWithImpl<$Res, ReviewState>;
}

/// @nodoc
class _$ReviewStateCopyWithImpl<$Res, $Val extends ReviewState>
    implements $ReviewStateCopyWith<$Res> {
  _$ReviewStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ReviewState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$InitialImplCopyWith<$Res> {
  factory _$$InitialImplCopyWith(
          _$InitialImpl value, $Res Function(_$InitialImpl) then) =
      __$$InitialImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$InitialImplCopyWithImpl<$Res>
    extends _$ReviewStateCopyWithImpl<$Res, _$InitialImpl>
    implements _$$InitialImplCopyWith<$Res> {
  __$$InitialImplCopyWithImpl(
      _$InitialImpl _value, $Res Function(_$InitialImpl) _then)
      : super(_value, _then);

  /// Create a copy of ReviewState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$InitialImpl implements _Initial {
  const _$InitialImpl();

  @override
  String toString() {
    return 'ReviewState.initial()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$InitialImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(String error) error,
    required TResult Function(ReviewModel review) submitted,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(String error)? error,
    TResult? Function(ReviewModel review)? submitted,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(String error)? error,
    TResult Function(ReviewModel review)? submitted,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Error value) error,
    required TResult Function(_Submitted value) submitted,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Error value)? error,
    TResult? Function(_Submitted value)? submitted,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Error value)? error,
    TResult Function(_Submitted value)? submitted,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial implements ReviewState {
  const factory _Initial() = _$InitialImpl;
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
    extends _$ReviewStateCopyWithImpl<$Res, _$ErrorImpl>
    implements _$$ErrorImplCopyWith<$Res> {
  __$$ErrorImplCopyWithImpl(
      _$ErrorImpl _value, $Res Function(_$ErrorImpl) _then)
      : super(_value, _then);

  /// Create a copy of ReviewState
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
    return 'ReviewState.error(error: $error)';
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

  /// Create a copy of ReviewState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ErrorImplCopyWith<_$ErrorImpl> get copyWith =>
      __$$ErrorImplCopyWithImpl<_$ErrorImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(String error) error,
    required TResult Function(ReviewModel review) submitted,
  }) {
    return error(this.error);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(String error)? error,
    TResult? Function(ReviewModel review)? submitted,
  }) {
    return error?.call(this.error);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(String error)? error,
    TResult Function(ReviewModel review)? submitted,
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
    required TResult Function(_Initial value) initial,
    required TResult Function(_Error value) error,
    required TResult Function(_Submitted value) submitted,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Error value)? error,
    TResult? Function(_Submitted value)? submitted,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Error value)? error,
    TResult Function(_Submitted value)? submitted,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class _Error implements ReviewState {
  const factory _Error(final String error) = _$ErrorImpl;

  String get error;

  /// Create a copy of ReviewState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ErrorImplCopyWith<_$ErrorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SubmittedImplCopyWith<$Res> {
  factory _$$SubmittedImplCopyWith(
          _$SubmittedImpl value, $Res Function(_$SubmittedImpl) then) =
      __$$SubmittedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({ReviewModel review});
}

/// @nodoc
class __$$SubmittedImplCopyWithImpl<$Res>
    extends _$ReviewStateCopyWithImpl<$Res, _$SubmittedImpl>
    implements _$$SubmittedImplCopyWith<$Res> {
  __$$SubmittedImplCopyWithImpl(
      _$SubmittedImpl _value, $Res Function(_$SubmittedImpl) _then)
      : super(_value, _then);

  /// Create a copy of ReviewState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? review = null,
  }) {
    return _then(_$SubmittedImpl(
      null == review
          ? _value.review
          : review // ignore: cast_nullable_to_non_nullable
              as ReviewModel,
    ));
  }
}

/// @nodoc

class _$SubmittedImpl implements _Submitted {
  const _$SubmittedImpl(this.review);

  @override
  final ReviewModel review;

  @override
  String toString() {
    return 'ReviewState.submitted(review: $review)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SubmittedImpl &&
            (identical(other.review, review) || other.review == review));
  }

  @override
  int get hashCode => Object.hash(runtimeType, review);

  /// Create a copy of ReviewState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SubmittedImplCopyWith<_$SubmittedImpl> get copyWith =>
      __$$SubmittedImplCopyWithImpl<_$SubmittedImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(String error) error,
    required TResult Function(ReviewModel review) submitted,
  }) {
    return submitted(review);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(String error)? error,
    TResult? Function(ReviewModel review)? submitted,
  }) {
    return submitted?.call(review);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(String error)? error,
    TResult Function(ReviewModel review)? submitted,
    required TResult orElse(),
  }) {
    if (submitted != null) {
      return submitted(review);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Error value) error,
    required TResult Function(_Submitted value) submitted,
  }) {
    return submitted(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Error value)? error,
    TResult? Function(_Submitted value)? submitted,
  }) {
    return submitted?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Error value)? error,
    TResult Function(_Submitted value)? submitted,
    required TResult orElse(),
  }) {
    if (submitted != null) {
      return submitted(this);
    }
    return orElse();
  }
}

abstract class _Submitted implements ReviewState {
  const factory _Submitted(final ReviewModel review) = _$SubmittedImpl;

  ReviewModel get review;

  /// Create a copy of ReviewState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SubmittedImplCopyWith<_$SubmittedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
