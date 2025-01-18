import 'dart:developer';

import 'package:user_resort_booking_app/core/data/models/room_model.dart';
import 'package:user_resort_booking_app/feature/home/models/property_card_model.dart';
import 'package:user_resort_booking_app/feature/home/models/property_details_model.dart';
import 'package:user_resort_booking_app/feature/home/services/property_home_services.dart';

class PropertyHomeRepository {
  final PropertyHomeServices _services;

  PropertyHomeRepository({required PropertyHomeServices services})
      : _services = services;

  Future<List<PropertyCardModel>> fetchProperties(
      {required String type}) async {
    try {
      final data = await _services.fetchProperties(type: type);

      return data
          .map(
            (e) => PropertyCardModel.fromMap(e),
          )
          .toList();
    } catch (e, stack) {
      log(e.toString(), stackTrace: stack);
      rethrow;
    }
  }

  Future<PropertyDetailsModel> fetchPropertyDetails(
      {required String id}) async {
    try {
      final data = await _services.fetchPropertyDetails(id: id);
      return PropertyDetailsModel.fromMap(data);
    } catch (e, stack) {
      log(e.toString(), stackTrace: stack);
      rethrow;
    }
  }

}
