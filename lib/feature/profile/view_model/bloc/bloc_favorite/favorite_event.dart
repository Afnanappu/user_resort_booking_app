part of 'favorite_bloc.dart';

@freezed
class FavoriteEvent with _$FavoriteEvent {
  const factory FavoriteEvent.toggleFavorite({
    required String propertyId,
    required String userId,
  }) = _ToggleFavorite;

  // const factory FavoriteEvent.removeFromFavorite({
  //   required String propertyId,
  //   required String userId,
  // }) = _RemoveFromFavorite;

  const factory FavoriteEvent.checkFavoriteStatus({
    required String propertyId,
    required String userId,
  }) = _CheckFavoriteStatus;

  const factory FavoriteEvent.fetchFavorites({required String userId}) =
      _FetchFavorites;
  const factory FavoriteEvent.reEmit() = _ReEmit;
}
