import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:user_resort_booking_app/core/data/models/property_card_model.dart';
import 'package:user_resort_booking_app/feature/profile/repository/favorite_repository.dart';

part 'favorite_event.dart';
part 'favorite_state.dart';
part 'favorite_bloc.freezed.dart';

class FavoriteBloc extends Bloc<FavoriteEvent, FavoriteState> {
  final FavoriteRepository _repository;
  List<String> _favorites = [];

  List<String> get favorites => _favorites;

  FavoriteBloc(this._repository) : super(_Loading()) {
    on<_FetchFavorites>((event, emit) async {
      try {
        final properties =
            await _repository.fetchFavorites(userId: event.userId);

        _favorites = properties
            .map(
              (e) => e.id!,
            )
            .toList();
        emit(FavoriteState.loaded(properties));
      } catch (e) {
        emit(FavoriteState.error(e.toString()));
      }
    });

    on<_ToggleFavorite>((event, emit) async {
      try {
        // final favorites =
        //     await _repository.fetchFavoriteIds(userId: event.userId);
        if (!_favorites.contains(event.propertyId)) {
          await _repository.addToFavorite(
            userId: event.userId,
            propertyId: event.propertyId,
          );
        } else {
          await _repository.removeFromFavorite(
            userId: event.userId,
            propertyId: event.propertyId,
          );
        }

        log(_favorites.toString());

        add(FavoriteEvent.fetchFavorites(userId: event.userId));
      } catch (e) {
        emit(FavoriteState.error(e.toString()));
      }
    });

    // on<_ReEmit>(
    //   (event, emit) {
    //     emit(FavoriteState.loaded(_favorites));
    //   }
    // );

    // on<_RemoveFromFavorite>((event, emit) async {
    //   try {
    //     // final favorites =
    //     //     await _repository.fetchFavoriteIds(userId: event.userId);
    //     if (_favorites.contains(event.propertyId)) {

    //     }
    //     add(FavoriteEvent.fetchFavorites(userId: event.userId));
    //   } catch (e) {
    //     emit(FavoriteState.error(e.toString()));
    //   }
    // });

    on<_CheckFavoriteStatus>((event, emit) async {
      try {
        final isFavorite = _favorites.contains(event.propertyId);
        emit(FavoriteState.favoriteStatusChecked(
          propertyId: event.propertyId,
          isFavorite: isFavorite,
        ));
      } catch (e) {
        emit(FavoriteState.error(e.toString()));
      }
    });
  }
}
