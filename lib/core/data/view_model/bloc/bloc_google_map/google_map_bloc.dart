import 'dart:async';
import 'dart:developer';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:geocode/geocode.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:permission_handler/permission_handler.dart' as ph;
import 'package:user_resort_booking_app/core/constants/api_keys.dart';
import 'package:user_resort_booking_app/core/data/models/location_model.dart';
import 'package:user_resort_booking_app/core/utils/exceptions/google_map_exception.dart';
part 'google_map_bloc.freezed.dart';
part 'google_map_event.dart';
part 'google_map_state.dart';

class GoogleMapBloc extends Bloc<GoogleMapEvent, GoogleMapState> {
  GoogleMapBloc() : super(_Initial()) {
    late LatLng myLocation;

    ///initialization of map and getting current user location
    on<_MapInitialized>((event, emit) async {
      try {
        myLocation = await getCurrentLocation();
        final cameraPosition = CameraPosition(
          target: event.location == null
              ? LatLng(myLocation.latitude, myLocation.longitude)
              : event.location!,
          zoom: 13,
        );

        //emit initial location
        emit(
          GoogleMapState.mapLoaded(
            cameraPosition: cameraPosition,
            selectedMarker: {},
          ),
        );
      } on GoogleMapException catch (e) {
        emit(GoogleMapState.error(e.message));
      } catch (e) {
        emit(
          GoogleMapState.error(
              "An error occurred while initializing the map: $e"),
        );
      }
    });

    ///location selection
    on<_SelectLocation>(
      (event, emit) {
        //emit selected location
        emit(
          GoogleMapState.locationSelected(
            selectedLocation: event.selectedLocation,
          ),
        );
      },
    );

    /// Clearing the current location selections
    on<_ClearSelection>(
      (event, emit) {
        emit(GoogleMapState.initial());
      },
    );

    ///Confirm selection, take current location if selected location is null
    on<_ConfirmLocation>(
      (event, emit) async {
        LatLng? location = event.selectedLocation;

        location ??= myLocation;
        late final Address address;
        late final String addressLocation;
        try {
          address = await getAddressFromLatLng(location);
          addressLocation =
              "${address.streetAddress ?? ''}, ${address.city ?? ''}, ${address.region ?? ''}, ${address.countryName ?? ''}";
        } catch (e, stack) {
          log(e.toString(), stackTrace: stack);
          emit(GoogleMapState.error(e.toString()));
        }

        // if (addressLocation.contains('Throttled')) {
        //   log('find it is throttled, so assigning location directly');
        //   addressLocation =
        //       "${location.latitude.toStringAsFixed(3)}° N, ${location.longitude.toStringAsFixed(3)}° W";
        // } else {
        //   log('No throttled');
        // }
        final locationModel = LocationModel(
          latitude: location.latitude,
          longitude: location.longitude,
          address: addressLocation,
        );

        List<LatLng> polylineCoordinates = [];

        try {
          polylineCoordinates = await drawPolyline(
            origin: myLocation,
            destination: location,
          );
        } catch (e, stack) {
          log(e.toString(), stackTrace: stack);
        }

        final polylines = Polyline(
          polylineId: PolylineId("route"),
          points: polylineCoordinates,
          color: Colors.blue,
          width: 5,
        );

        emit(
          GoogleMapState.locationConfirmed(
            confirmedLocation: locationModel,
            polylines: {
              polylines,
            },
          ),
        );
      },
    );

    on<_SetLocation>(
      (event, emit) {
        emit(
          GoogleMapState.locationConfirmed(
              confirmedLocation: event.locationModel),
        );
      },
    );

    // on<_OpenSettings>((event, emit) async {
    //  final isOpened = await openSettingsToEnableLocation();
    //  if(isOpened){
    //   emit
    //  }
    // });
  }

  ///Map Controller
  final Completer<GoogleMapController> _mapController =
      Completer<GoogleMapController>();

  ///Location Controller
  final Location _locationController = Location();

  ///Map controller getter
  Completer<GoogleMapController> get getMapController => _mapController;

  ///Location controller getter
  Location get getLocationController => _locationController;

  Future<bool> openSettingsToEnableLocation() async {
    final permission = ph.Permission.location;

    log('settings is opening to enable location');
    await ph.openAppSettings();
//  final isOpened =
    return await permission.isGranted;
  }

  Future<LatLng> getCurrentLocation() async {
    bool isServiceEnabled;
    PermissionStatus permissionGranted;

    try {
      isServiceEnabled = await _locationController.serviceEnabled();

      if (!isServiceEnabled) {
        isServiceEnabled = await _locationController.requestService();
        if (!isServiceEnabled) {
          throw GoogleMapException(
              "Location Service is not enabled, try to enable it!");
        }
      }

      permissionGranted = await _locationController.hasPermission();

      if (permissionGranted == PermissionStatus.denied) {
        permissionGranted = await _locationController.requestPermission();
        if (permissionGranted == PermissionStatus.denied ||
            permissionGranted == PermissionStatus.deniedForever) {
          throw GoogleMapException("Location permissions are not granted.");
        }
      }

      final location = await _locationController.getLocation();

      if (location.latitude == null || location.longitude == null) {
        throw GoogleMapException(
            'Due to some issue, we can\'t retrieve the location, try again');
      }

      return LatLng(location.latitude!, location.longitude!);
    } catch (e, stack) {
      log(e.toString(), stackTrace: stack);
      rethrow;
    }
  }

  Future<void> goToAnyLocation(LatLng? latLng) async {
    try {
      final GoogleMapController controller = await _mapController.future;
      if (latLng == null) {
        log('latLng is null, can\'t change camera position');
        throw GoogleMapException('Google map is facing some issue');
      }
      await controller.animateCamera(
        CameraUpdate.newCameraPosition(
          CameraPosition(
            target: latLng,
            zoom: 18,
            bearing: 0,
            tilt: 50,
          ),
        ),
      );
    } catch (e, stack) {
      log(e.toString(), stackTrace: stack);
      rethrow;
    }
  }

//Function to get the latitude and longitude of the address.
  Future<LatLng?> getLatLngFromAddress(String address) async {
    try {
      final coordinates = await GeoCode().forwardGeocoding(address: address);
      log('coordinates: ${coordinates.latitude}, ${coordinates.longitude}');
      if (coordinates.latitude == null || coordinates.longitude == null) {
        log('Can\'t get any location from the query, returning null');
        throw GoogleMapException('Can\'t find any location');
      }
      return LatLng(coordinates.latitude!, coordinates.longitude!);
    } catch (e) {
      rethrow;
    }
  }

  Future<Address> getAddressFromLatLng(LatLng latLng) async {
    try {
      final address = await GeoCode().reverseGeocoding(
          latitude: latLng.latitude, longitude: latLng.longitude);
      return address;
    } on GeocodeException catch (e, stack) {
      log(e.toString(), stackTrace: stack);
      rethrow;
    } catch (e) {
      rethrow;
    }
  }

  Future<List<LatLng>> drawPolyline({
    required LatLng origin,
    required LatLng destination,
  }) async {
    try {
      PolylinePoints polylinePoints = PolylinePoints();

      PolylineResult result = await polylinePoints.getRouteBetweenCoordinates(
        googleApiKey: GOOGLE_MAP_API_KEY,
        request: PolylineRequest(
          origin: PointLatLng(origin.latitude, origin.longitude),
          destination: PointLatLng(destination.latitude, destination.longitude),
          mode: TravelMode.driving,
        ),
      );

      if (result.points.isNotEmpty) {
        return result.points
            .map((point) => LatLng(point.latitude, point.longitude))
            .toList();
      } else {
        throw Exception("No points found in the route.");
      }
    } catch (e) {
      print("Error fetching polyline: $e");
      return [];
    }
  }

  double _haversineDistance(LatLng start, LatLng end) {
    const double R = 6371; // Radius of the Earth in kilometers
    double lat1 = start.latitude * (math.pi / 180);
    double lon1 = start.longitude * (math.pi / 180);
    double lat2 = end.latitude * (math.pi / 180);
    double lon2 = end.longitude * (math.pi / 180);

    double dlat = lat2 - lat1;
    double dlon = lon2 - lon1;

    double a = (math.sin(dlat / 2) * math.sin(dlat / 2)) +
        (math.cos(lat1) *
            math.cos(lat2) *
            math.sin(dlon / 2) *
            math.sin(dlon / 2));
    double c = 2 * math.atan2(math.sqrt(a), math.sqrt(1 - a));

    return R * c; // Distance in kilometers
  }

  List<LatLng> nearbyPropertiesLocations(
      LatLng startingLocation, List<LatLng> propertyLocations) {
    final nearbyLocations = <LatLng>[];
    for (var property in propertyLocations) {
      final distance = _haversineDistance(startingLocation, property);
      if (distance < 10) {
        nearbyLocations.add(property);
      }
    }

    return nearbyLocations;
  }
}
