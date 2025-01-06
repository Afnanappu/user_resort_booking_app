import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:user_resort_booking_app/feature/home/models/property_card_model.dart';
import 'package:user_resort_booking_app/feature/home/repository/property_home_repository.dart';

part 'property_list_home_event.dart';
part 'property_list_home_state.dart';
part 'property_list_home_bloc.freezed.dart';

class PropertyListHomeBloc
    extends Bloc<PropertyListHomeEvent, PropertyListHomeState> {
  final PropertyHomeRepository _repository;
  PropertyListHomeBloc(this._repository) : super(_Initial()) {
    on<_FetchProperties>((event, emit) async {
      emit(PropertyListHomeState.loading());

      try {
        final propertyList = await _repository.fetchProperties();
        emit(PropertyListHomeState.loaded(propertyList));
        log(propertyList.toString());
      } catch (e) {
        emit(PropertyListHomeState.error(e.toString()));
      }
    });
  }
}
