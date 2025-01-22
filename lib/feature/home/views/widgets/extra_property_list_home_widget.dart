import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:user_resort_booking_app/core/components/property_simple_card_component.dart';
import 'package:user_resort_booking_app/core/constants/my_colors.dart';
import 'package:user_resort_booking_app/core/utils/screen_size.dart';
import 'package:user_resort_booking_app/core/data/view_model/bloc/bloc_google_map/google_map_bloc.dart';
import 'package:user_resort_booking_app/feature/home/view_model/bloc/bloc_property_details/property_details_home_bloc.dart';
import 'package:user_resort_booking_app/feature/home/view_model/bloc/bloc_property_home_extra_list/property_home_extra_list_bloc.dart';
import 'package:user_resort_booking_app/routes/route_names.dart';

class ExtraPropertyListHomeWidget extends StatelessWidget {
  const ExtraPropertyListHomeWidget({
    super.key,
    required this.sizedBoxHeight,
  });

  final int sizedBoxHeight;

  @override
  Widget build(BuildContext context) {
    context.read<PropertyHomeExtraListBloc>().add(
          PropertyHomeExtraListEvent.fetchProperties(type: 'all'),
        );
    return BlocBuilder<PropertyHomeExtraListBloc, PropertyHomeExtraListState>(
      builder: (context, state) {
        return state.maybeWhen(
          initial: () => SizedBox(
            height: MyScreenSize.height - sizedBoxHeight,
            child: Align(
              alignment: Alignment.center,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.search, size: 48, color: Colors.grey),
                  SizedBox(height: 16),
                  Text(
                    'Looking for resorts...',
                    style: TextStyle(fontSize: 16, color: Colors.grey),
                  ),
                ],
              ),
            ),
          ),
          error: (message) => SizedBox(
            height: MyScreenSize.height - sizedBoxHeight,
            child: Center(
              child: Text(
                message,
                style: TextStyle(
                  color: MyColors.error,
                ),
              ),
            ),
          ),
          loading: () => ListView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemCount: 5,
            itemBuilder: (context, index) => PropertySimpleCardShimmer(),
          ),
          orElse: () {
            return Center(
              child: Text('Something unexpected happened, try again'),
            );
          },
          loaded: (propertyList) {
            return ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: propertyList.length,
              itemBuilder: (context, index) {
                final property = propertyList[index];
                return PropertySimpleCardComponent(
                  image: property.image.base64file,
                  propertyName: property.name,
                  rating: property.rating ?? 0,
                  location: property.location,
                  reviews: property.reviews,
                  price: property.price,
                  havePlaceholder: false,
                  onTap: () {
                    context.push('/${AppRoutes.propertyDetailsHome}');

                    //Loading the property details for next screen
                    context.read<PropertyDetailsHomeBloc>().add(
                          PropertyDetailsHomeEvent.fetchPropertyDetails(
                            id: property.id!,
                          ),
                        );

                    final latLng = LatLng(
                      property.location.latitude,
                      property.location.longitude,
                    );
                    context.read<GoogleMapBloc>().add(
                          GoogleMapEvent.mapInitialized(
                            latLng,
                          ),
                        );
                    context.read<GoogleMapBloc>().add(
                          GoogleMapEvent.confirmLocation(
                            latLng,
                          ),
                        );
                  },
                );
              },
            );
          },
        );
      },
    );
  }
}
