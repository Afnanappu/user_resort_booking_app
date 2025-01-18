// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:core';

import 'package:user_resort_booking_app/feature/search/services/my_property_services.dart';

class FilterDataModel {
  FilterOptions? filterOptions;
  String? priceRange;
  List<String> category = const [];
  int? rating;
  FilterDataModel({
    this.filterOptions,
    this.priceRange,
    this.category = const [],
    this.rating,
  });
}
