// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'my_property_list_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$MyPropertyListEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String? search, FilterOptions? filterOptions,
            String? priceRange, List<String>? category, int? rating)
        fetchProperties,
    required TResult Function() fetchNearbyProperties,
    required TResult Function() clear,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String? search, FilterOptions? filterOptions,
            String? priceRange, List<String>? category, int? rating)?
        fetchProperties,
    TResult? Function()? fetchNearbyProperties,
    TResult? Function()? clear,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String? search, FilterOptions? filterOptions,
            String? priceRange, List<String>? category, int? rating)?
        fetchProperties,
    TResult Function()? fetchNearbyProperties,
    TResult Function()? clear,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_FetchProperties value) fetchProperties,
    required TResult Function(_FetchNearbyProperties value)
        fetchNearbyProperties,
    required TResult Function(_Clear value) clear,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_FetchProperties value)? fetchProperties,
    TResult? Function(_FetchNearbyProperties value)? fetchNearbyProperties,
    TResult? Function(_Clear value)? clear,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_FetchProperties value)? fetchProperties,
    TResult Function(_FetchNearbyProperties value)? fetchNearbyProperties,
    TResult Function(_Clear value)? clear,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MyPropertyListEventCopyWith<$Res> {
  factory $MyPropertyListEventCopyWith(
          MyPropertyListEvent value, $Res Function(MyPropertyListEvent) then) =
      _$MyPropertyListEventCopyWithImpl<$Res, MyPropertyListEvent>;
}

/// @nodoc
class _$MyPropertyListEventCopyWithImpl<$Res, $Val extends MyPropertyListEvent>
    implements $MyPropertyListEventCopyWith<$Res> {
  _$MyPropertyListEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of MyPropertyListEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$FetchPropertiesImplCopyWith<$Res> {
  factory _$$FetchPropertiesImplCopyWith(_$FetchPropertiesImpl value,
          $Res Function(_$FetchPropertiesImpl) then) =
      __$$FetchPropertiesImplCopyWithImpl<$Res>;
  @useResult
  $Res call(
      {String? search,
      FilterOptions? filterOptions,
      String? priceRange,
      List<String>? category,
      int? rating});
}

/// @nodoc
class __$$FetchPropertiesImplCopyWithImpl<$Res>
    extends _$MyPropertyListEventCopyWithImpl<$Res, _$FetchPropertiesImpl>
    implements _$$FetchPropertiesImplCopyWith<$Res> {
  __$$FetchPropertiesImplCopyWithImpl(
      _$FetchPropertiesImpl _value, $Res Function(_$FetchPropertiesImpl) _then)
      : super(_value, _then);

  /// Create a copy of MyPropertyListEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? search = freezed,
    Object? filterOptions = freezed,
    Object? priceRange = freezed,
    Object? category = freezed,
    Object? rating = freezed,
  }) {
    return _then(_$FetchPropertiesImpl(
      search: freezed == search
          ? _value.search
          : search // ignore: cast_nullable_to_non_nullable
              as String?,
      filterOptions: freezed == filterOptions
          ? _value.filterOptions
          : filterOptions // ignore: cast_nullable_to_non_nullable
              as FilterOptions?,
      priceRange: freezed == priceRange
          ? _value.priceRange
          : priceRange // ignore: cast_nullable_to_non_nullable
              as String?,
      category: freezed == category
          ? _value._category
          : category // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      rating: freezed == rating
          ? _value.rating
          : rating // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc

class _$FetchPropertiesImpl implements _FetchProperties {
  const _$FetchPropertiesImpl(
      {this.search,
      this.filterOptions,
      this.priceRange,
      final List<String>? category,
      this.rating})
      : _category = category;

  @override
  final String? search;
  @override
  final FilterOptions? filterOptions;
  @override
  final String? priceRange;
  final List<String>? _category;
  @override
  List<String>? get category {
    final value = _category;
    if (value == null) return null;
    if (_category is EqualUnmodifiableListView) return _category;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final int? rating;

  @override
  String toString() {
    return 'MyPropertyListEvent.fetchProperties(search: $search, filterOptions: $filterOptions, priceRange: $priceRange, category: $category, rating: $rating)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FetchPropertiesImpl &&
            (identical(other.search, search) || other.search == search) &&
            (identical(other.filterOptions, filterOptions) ||
                other.filterOptions == filterOptions) &&
            (identical(other.priceRange, priceRange) ||
                other.priceRange == priceRange) &&
            const DeepCollectionEquality().equals(other._category, _category) &&
            (identical(other.rating, rating) || other.rating == rating));
  }

  @override
  int get hashCode => Object.hash(runtimeType, search, filterOptions,
      priceRange, const DeepCollectionEquality().hash(_category), rating);

  /// Create a copy of MyPropertyListEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$FetchPropertiesImplCopyWith<_$FetchPropertiesImpl> get copyWith =>
      __$$FetchPropertiesImplCopyWithImpl<_$FetchPropertiesImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String? search, FilterOptions? filterOptions,
            String? priceRange, List<String>? category, int? rating)
        fetchProperties,
    required TResult Function() fetchNearbyProperties,
    required TResult Function() clear,
  }) {
    return fetchProperties(search, filterOptions, priceRange, category, rating);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String? search, FilterOptions? filterOptions,
            String? priceRange, List<String>? category, int? rating)?
        fetchProperties,
    TResult? Function()? fetchNearbyProperties,
    TResult? Function()? clear,
  }) {
    return fetchProperties?.call(
        search, filterOptions, priceRange, category, rating);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String? search, FilterOptions? filterOptions,
            String? priceRange, List<String>? category, int? rating)?
        fetchProperties,
    TResult Function()? fetchNearbyProperties,
    TResult Function()? clear,
    required TResult orElse(),
  }) {
    if (fetchProperties != null) {
      return fetchProperties(
          search, filterOptions, priceRange, category, rating);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_FetchProperties value) fetchProperties,
    required TResult Function(_FetchNearbyProperties value)
        fetchNearbyProperties,
    required TResult Function(_Clear value) clear,
  }) {
    return fetchProperties(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_FetchProperties value)? fetchProperties,
    TResult? Function(_FetchNearbyProperties value)? fetchNearbyProperties,
    TResult? Function(_Clear value)? clear,
  }) {
    return fetchProperties?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_FetchProperties value)? fetchProperties,
    TResult Function(_FetchNearbyProperties value)? fetchNearbyProperties,
    TResult Function(_Clear value)? clear,
    required TResult orElse(),
  }) {
    if (fetchProperties != null) {
      return fetchProperties(this);
    }
    return orElse();
  }
}

abstract class _FetchProperties implements MyPropertyListEvent {
  const factory _FetchProperties(
      {final String? search,
      final FilterOptions? filterOptions,
      final String? priceRange,
      final List<String>? category,
      final int? rating}) = _$FetchPropertiesImpl;

  String? get search;
  FilterOptions? get filterOptions;
  String? get priceRange;
  List<String>? get category;
  int? get rating;

  /// Create a copy of MyPropertyListEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$FetchPropertiesImplCopyWith<_$FetchPropertiesImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$FetchNearbyPropertiesImplCopyWith<$Res> {
  factory _$$FetchNearbyPropertiesImplCopyWith(
          _$FetchNearbyPropertiesImpl value,
          $Res Function(_$FetchNearbyPropertiesImpl) then) =
      __$$FetchNearbyPropertiesImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$FetchNearbyPropertiesImplCopyWithImpl<$Res>
    extends _$MyPropertyListEventCopyWithImpl<$Res, _$FetchNearbyPropertiesImpl>
    implements _$$FetchNearbyPropertiesImplCopyWith<$Res> {
  __$$FetchNearbyPropertiesImplCopyWithImpl(_$FetchNearbyPropertiesImpl _value,
      $Res Function(_$FetchNearbyPropertiesImpl) _then)
      : super(_value, _then);

  /// Create a copy of MyPropertyListEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$FetchNearbyPropertiesImpl implements _FetchNearbyProperties {
  const _$FetchNearbyPropertiesImpl();

  @override
  String toString() {
    return 'MyPropertyListEvent.fetchNearbyProperties()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FetchNearbyPropertiesImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String? search, FilterOptions? filterOptions,
            String? priceRange, List<String>? category, int? rating)
        fetchProperties,
    required TResult Function() fetchNearbyProperties,
    required TResult Function() clear,
  }) {
    return fetchNearbyProperties();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String? search, FilterOptions? filterOptions,
            String? priceRange, List<String>? category, int? rating)?
        fetchProperties,
    TResult? Function()? fetchNearbyProperties,
    TResult? Function()? clear,
  }) {
    return fetchNearbyProperties?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String? search, FilterOptions? filterOptions,
            String? priceRange, List<String>? category, int? rating)?
        fetchProperties,
    TResult Function()? fetchNearbyProperties,
    TResult Function()? clear,
    required TResult orElse(),
  }) {
    if (fetchNearbyProperties != null) {
      return fetchNearbyProperties();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_FetchProperties value) fetchProperties,
    required TResult Function(_FetchNearbyProperties value)
        fetchNearbyProperties,
    required TResult Function(_Clear value) clear,
  }) {
    return fetchNearbyProperties(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_FetchProperties value)? fetchProperties,
    TResult? Function(_FetchNearbyProperties value)? fetchNearbyProperties,
    TResult? Function(_Clear value)? clear,
  }) {
    return fetchNearbyProperties?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_FetchProperties value)? fetchProperties,
    TResult Function(_FetchNearbyProperties value)? fetchNearbyProperties,
    TResult Function(_Clear value)? clear,
    required TResult orElse(),
  }) {
    if (fetchNearbyProperties != null) {
      return fetchNearbyProperties(this);
    }
    return orElse();
  }
}

abstract class _FetchNearbyProperties implements MyPropertyListEvent {
  const factory _FetchNearbyProperties() = _$FetchNearbyPropertiesImpl;
}

/// @nodoc
abstract class _$$ClearImplCopyWith<$Res> {
  factory _$$ClearImplCopyWith(
          _$ClearImpl value, $Res Function(_$ClearImpl) then) =
      __$$ClearImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ClearImplCopyWithImpl<$Res>
    extends _$MyPropertyListEventCopyWithImpl<$Res, _$ClearImpl>
    implements _$$ClearImplCopyWith<$Res> {
  __$$ClearImplCopyWithImpl(
      _$ClearImpl _value, $Res Function(_$ClearImpl) _then)
      : super(_value, _then);

  /// Create a copy of MyPropertyListEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$ClearImpl implements _Clear {
  const _$ClearImpl();

  @override
  String toString() {
    return 'MyPropertyListEvent.clear()';
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
    required TResult Function(String? search, FilterOptions? filterOptions,
            String? priceRange, List<String>? category, int? rating)
        fetchProperties,
    required TResult Function() fetchNearbyProperties,
    required TResult Function() clear,
  }) {
    return clear();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String? search, FilterOptions? filterOptions,
            String? priceRange, List<String>? category, int? rating)?
        fetchProperties,
    TResult? Function()? fetchNearbyProperties,
    TResult? Function()? clear,
  }) {
    return clear?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String? search, FilterOptions? filterOptions,
            String? priceRange, List<String>? category, int? rating)?
        fetchProperties,
    TResult Function()? fetchNearbyProperties,
    TResult Function()? clear,
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
    required TResult Function(_FetchProperties value) fetchProperties,
    required TResult Function(_FetchNearbyProperties value)
        fetchNearbyProperties,
    required TResult Function(_Clear value) clear,
  }) {
    return clear(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_FetchProperties value)? fetchProperties,
    TResult? Function(_FetchNearbyProperties value)? fetchNearbyProperties,
    TResult? Function(_Clear value)? clear,
  }) {
    return clear?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_FetchProperties value)? fetchProperties,
    TResult Function(_FetchNearbyProperties value)? fetchNearbyProperties,
    TResult Function(_Clear value)? clear,
    required TResult orElse(),
  }) {
    if (clear != null) {
      return clear(this);
    }
    return orElse();
  }
}

abstract class _Clear implements MyPropertyListEvent {
  const factory _Clear() = _$ClearImpl;
}

/// @nodoc
mixin _$MyPropertyListState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<PropertyCardModel> propertyList) loaded,
    required TResult Function(String message) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<PropertyCardModel> propertyList)? loaded,
    TResult? Function(String message)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<PropertyCardModel> propertyList)? loaded,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Loaded value) loaded,
    required TResult Function(_Error value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Loaded value)? loaded,
    TResult? Function(_Error value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Loaded value)? loaded,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MyPropertyListStateCopyWith<$Res> {
  factory $MyPropertyListStateCopyWith(
          MyPropertyListState value, $Res Function(MyPropertyListState) then) =
      _$MyPropertyListStateCopyWithImpl<$Res, MyPropertyListState>;
}

/// @nodoc
class _$MyPropertyListStateCopyWithImpl<$Res, $Val extends MyPropertyListState>
    implements $MyPropertyListStateCopyWith<$Res> {
  _$MyPropertyListStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of MyPropertyListState
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
    extends _$MyPropertyListStateCopyWithImpl<$Res, _$InitialImpl>
    implements _$$InitialImplCopyWith<$Res> {
  __$$InitialImplCopyWithImpl(
      _$InitialImpl _value, $Res Function(_$InitialImpl) _then)
      : super(_value, _then);

  /// Create a copy of MyPropertyListState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$InitialImpl implements _Initial {
  const _$InitialImpl();

  @override
  String toString() {
    return 'MyPropertyListState.initial()';
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
    required TResult Function() loading,
    required TResult Function(List<PropertyCardModel> propertyList) loaded,
    required TResult Function(String message) error,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<PropertyCardModel> propertyList)? loaded,
    TResult? Function(String message)? error,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<PropertyCardModel> propertyList)? loaded,
    TResult Function(String message)? error,
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
    required TResult Function(_Loading value) loading,
    required TResult Function(_Loaded value) loaded,
    required TResult Function(_Error value) error,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Loaded value)? loaded,
    TResult? Function(_Error value)? error,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Loaded value)? loaded,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial implements MyPropertyListState {
  const factory _Initial() = _$InitialImpl;
}

/// @nodoc
abstract class _$$LoadingImplCopyWith<$Res> {
  factory _$$LoadingImplCopyWith(
          _$LoadingImpl value, $Res Function(_$LoadingImpl) then) =
      __$$LoadingImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$LoadingImplCopyWithImpl<$Res>
    extends _$MyPropertyListStateCopyWithImpl<$Res, _$LoadingImpl>
    implements _$$LoadingImplCopyWith<$Res> {
  __$$LoadingImplCopyWithImpl(
      _$LoadingImpl _value, $Res Function(_$LoadingImpl) _then)
      : super(_value, _then);

  /// Create a copy of MyPropertyListState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$LoadingImpl implements _Loading {
  const _$LoadingImpl();

  @override
  String toString() {
    return 'MyPropertyListState.loading()';
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
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<PropertyCardModel> propertyList) loaded,
    required TResult Function(String message) error,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<PropertyCardModel> propertyList)? loaded,
    TResult? Function(String message)? error,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<PropertyCardModel> propertyList)? loaded,
    TResult Function(String message)? error,
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
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Loaded value) loaded,
    required TResult Function(_Error value) error,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Loaded value)? loaded,
    TResult? Function(_Error value)? error,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Loaded value)? loaded,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class _Loading implements MyPropertyListState {
  const factory _Loading() = _$LoadingImpl;
}

/// @nodoc
abstract class _$$LoadedImplCopyWith<$Res> {
  factory _$$LoadedImplCopyWith(
          _$LoadedImpl value, $Res Function(_$LoadedImpl) then) =
      __$$LoadedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({List<PropertyCardModel> propertyList});
}

/// @nodoc
class __$$LoadedImplCopyWithImpl<$Res>
    extends _$MyPropertyListStateCopyWithImpl<$Res, _$LoadedImpl>
    implements _$$LoadedImplCopyWith<$Res> {
  __$$LoadedImplCopyWithImpl(
      _$LoadedImpl _value, $Res Function(_$LoadedImpl) _then)
      : super(_value, _then);

  /// Create a copy of MyPropertyListState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? propertyList = null,
  }) {
    return _then(_$LoadedImpl(
      null == propertyList
          ? _value._propertyList
          : propertyList // ignore: cast_nullable_to_non_nullable
              as List<PropertyCardModel>,
    ));
  }
}

/// @nodoc

class _$LoadedImpl implements _Loaded {
  const _$LoadedImpl(final List<PropertyCardModel> propertyList)
      : _propertyList = propertyList;

  final List<PropertyCardModel> _propertyList;
  @override
  List<PropertyCardModel> get propertyList {
    if (_propertyList is EqualUnmodifiableListView) return _propertyList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_propertyList);
  }

  @override
  String toString() {
    return 'MyPropertyListState.loaded(propertyList: $propertyList)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoadedImpl &&
            const DeepCollectionEquality()
                .equals(other._propertyList, _propertyList));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_propertyList));

  /// Create a copy of MyPropertyListState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LoadedImplCopyWith<_$LoadedImpl> get copyWith =>
      __$$LoadedImplCopyWithImpl<_$LoadedImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<PropertyCardModel> propertyList) loaded,
    required TResult Function(String message) error,
  }) {
    return loaded(propertyList);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<PropertyCardModel> propertyList)? loaded,
    TResult? Function(String message)? error,
  }) {
    return loaded?.call(propertyList);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<PropertyCardModel> propertyList)? loaded,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(propertyList);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Loaded value) loaded,
    required TResult Function(_Error value) error,
  }) {
    return loaded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Loaded value)? loaded,
    TResult? Function(_Error value)? error,
  }) {
    return loaded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Loaded value)? loaded,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(this);
    }
    return orElse();
  }
}

abstract class _Loaded implements MyPropertyListState {
  const factory _Loaded(final List<PropertyCardModel> propertyList) =
      _$LoadedImpl;

  List<PropertyCardModel> get propertyList;

  /// Create a copy of MyPropertyListState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LoadedImplCopyWith<_$LoadedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ErrorImplCopyWith<$Res> {
  factory _$$ErrorImplCopyWith(
          _$ErrorImpl value, $Res Function(_$ErrorImpl) then) =
      __$$ErrorImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$ErrorImplCopyWithImpl<$Res>
    extends _$MyPropertyListStateCopyWithImpl<$Res, _$ErrorImpl>
    implements _$$ErrorImplCopyWith<$Res> {
  __$$ErrorImplCopyWithImpl(
      _$ErrorImpl _value, $Res Function(_$ErrorImpl) _then)
      : super(_value, _then);

  /// Create a copy of MyPropertyListState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
  }) {
    return _then(_$ErrorImpl(
      null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$ErrorImpl implements _Error {
  const _$ErrorImpl(this.message);

  @override
  final String message;

  @override
  String toString() {
    return 'MyPropertyListState.error(message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ErrorImpl &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  /// Create a copy of MyPropertyListState
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
    required TResult Function() loading,
    required TResult Function(List<PropertyCardModel> propertyList) loaded,
    required TResult Function(String message) error,
  }) {
    return error(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<PropertyCardModel> propertyList)? loaded,
    TResult? Function(String message)? error,
  }) {
    return error?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<PropertyCardModel> propertyList)? loaded,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Loaded value) loaded,
    required TResult Function(_Error value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Loaded value)? loaded,
    TResult? Function(_Error value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Loaded value)? loaded,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class _Error implements MyPropertyListState {
  const factory _Error(final String message) = _$ErrorImpl;

  String get message;

  /// Create a copy of MyPropertyListState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ErrorImplCopyWith<_$ErrorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
