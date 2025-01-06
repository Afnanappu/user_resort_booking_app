
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:user_resort_booking_app/feature/home/models/property_details_model.dart';
import 'package:user_resort_booking_app/feature/home/repository/property_home_repository.dart';

part 'property_details_home_bloc.freezed.dart';
part 'property_details_home_event.dart';
part 'property_details_home_state.dart';

class PropertyDetailsHomeBloc
    extends Bloc<PropertyDetailsHomeEvent, PropertyDetailsHomeState> {
  final PropertyHomeRepository _repository;

  PropertyDetailsHomeBloc(this._repository) : super(_Initial()) {
    on<_FetchPropertyDetails>((event, emit) async {
      emit(PropertyDetailsHomeState.loading());

      try {
        final propertyDetailsModel =
            await _repository.fetchPropertyDetails(id: event.id);
        emit(PropertyDetailsHomeState.loaded(propertyDetailsModel));
      } catch (e) {
        emit(PropertyDetailsHomeState.error(e.toString()));
      }
    });
  }

  String? getPropertyId() {
    if (state is _Loaded) {
      return (state as _Loaded).propertyDetails.id;
    }
    return null;
  }
}
