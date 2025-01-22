import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:user_resort_booking_app/feature/home/models/property_card_model.dart';
import 'package:user_resort_booking_app/feature/home/repository/property_home_repository.dart';

part 'property_home_extra_list_event.dart';
part 'property_home_extra_list_state.dart';
part 'property_home_extra_list_bloc.freezed.dart';

class PropertyHomeExtraListBloc
    extends Bloc<PropertyHomeExtraListEvent, PropertyHomeExtraListState> {
  final PropertyHomeRepository _repository;
  PropertyHomeExtraListBloc(this._repository) : super(_Initial()) {
    on<_FetchProperties>((event, emit) async {
      emit(PropertyHomeExtraListState.loading());

      try {
        final propertyList =
            await _repository.fetchProperties(type: event.type);
        emit(PropertyHomeExtraListState.loaded(propertyList));
      } catch (e) {
        emit(PropertyHomeExtraListState.error(e.toString()));
      }
    });
  }
}
