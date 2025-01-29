part of 'favorite_bloc.dart';

@freezed
class FavoriteState with _$FavoriteState {
  const factory FavoriteState.loading() = _Loading;

  const factory FavoriteState.loaded(List<PropertyCardModel> properties) =
      _Loaded;

  const factory FavoriteState.favoriteStatusChecked({
    required String propertyId,
    required bool isFavorite,
  }) = _FavoriteStatusChecked;

  const factory FavoriteState.error(String error) = _Error;
}
