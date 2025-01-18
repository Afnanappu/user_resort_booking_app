import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:user_resort_booking_app/core/data/view_model/bloc/bloc_google_map/google_map_bloc.dart';
import 'package:user_resort_booking_app/feature/home/models/property_card_model.dart';
import 'package:user_resort_booking_app/feature/search/repository/my_property_repository.dart';
import 'package:user_resort_booking_app/feature/search/services/my_property_services.dart';

part 'my_property_list_event.dart';
part 'my_property_list_state.dart';
part 'my_property_list_bloc.freezed.dart';

class MyPropertyListBloc
    extends Bloc<MyPropertyListEvent, MyPropertyListState> {
  final MyPropertyRepository _repository;
  final GoogleMapBloc googleMapBloc;
  MyPropertyListBloc(
      {required MyPropertyRepository repository, required this.googleMapBloc})
      : _repository = repository,
        super(_Initial()) {
    on<_FetchProperties>((event, emit) async {
      emit(MyPropertyListState.loading());

      try {
        final propertyList = await _repository.fetchProperties(
          search: event.search,
          filterOptions: event.filterOptions,
          category: event.category ?? [],
          priceRange: event.priceRange,
          rating: event.rating,
        );
        emit(MyPropertyListState.loaded(propertyList));
      } catch (e) {
        emit(MyPropertyListState.error(e.toString()));
      }
    });

    on<_FetchNearbyProperties>((event, emit) async {
      emit(MyPropertyListState.loading());

      try {
         log('Search to nearby location is started...');
         
        //first fetch all properties from the firebase
        final propertyList = await _repository.fetchProperties();

        //get location of all the properties
        final propertyLocations = await getPropertyLocations(propertyList);

        //get the current location of the user
        final currentLocation = await googleMapBloc.getCurrentLocation();

        //final the nearbyLocation by giving the current and all property location
        final nearbyLocations = googleMapBloc.nearbyPropertiesLocations(
          currentLocation,
          propertyLocations,
        );

        //get the corresponding property model from the locations
        final nearbyProperties = findNearbyProperties(
          propertyList: propertyList,
          nearbyLocations: nearbyLocations,
        );

        log('nearby Property locations: ');
        for (var element in nearbyLocations) {
          log('LatLng(${element.latitude}, ${element.longitude})');
        }

        log('Search to nearby location is ended...');

        emit(MyPropertyListState.loaded(nearbyProperties));
      } catch (e) {
        emit(MyPropertyListState.error(e.toString()));
      }
    });

    on<_Clear>((event, emit) {
      emit(MyPropertyListState.initial());
    });
  }

  Future<List<LatLng>> getPropertyLocations(
      List<PropertyCardModel> propertyList) async {
    // final propertyList = await _repository.fetchProperties();
    final propertyLocations = propertyList.map(
      (e) {
        final model = e.location;
        return LatLng(model.latitude, model.longitude);
      },
    ).toList();
    if (propertyLocations.isEmpty) {
      log('propertyLocations is empty or null: $propertyLocations');
    } else {
      log('get propertyLocation successfully');
    }

    return propertyLocations;
  }

  List<PropertyCardModel> findNearbyProperties({
    required List<PropertyCardModel> propertyList,
    required List<LatLng> nearbyLocations,
  }) {
    return propertyList.where(
      (element) {
        final latLng =
            LatLng(element.location.latitude, element.location.longitude);
        return nearbyLocations.contains(latLng);
      },
    ).toList();
  }
}
