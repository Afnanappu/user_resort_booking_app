import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:user_resort_booking_app/core/constants/my_colors.dart';
import 'package:user_resort_booking_app/core/constants/spaces.dart';
import 'package:user_resort_booking_app/core/constants/text_styles.dart';
import 'package:user_resort_booking_app/core/utils/math_functions.dart';
import 'package:user_resort_booking_app/core/utils/screen_size.dart';
import 'package:user_resort_booking_app/core/data/view_model/bloc/bloc_google_map/google_map_bloc.dart';
import 'package:user_resort_booking_app/feature/home/view_model/bloc/bloc_property_details/property_details_home_bloc.dart';
import 'package:user_resort_booking_app/feature/home/view_model/bloc/bloc_property_home_list/property_list_home_bloc.dart';
import 'package:user_resort_booking_app/feature/home/views/widgets/property_widget.dart';
import 'package:user_resort_booking_app/routes/route_names.dart';

class TopRatedPropertyListWidget extends StatelessWidget {
  const TopRatedPropertyListWidget({
    super.key,
    required this.sizedBoxHeight,
  });

  final int sizedBoxHeight;

  @override
  Widget build(BuildContext context) {
    //fetching data
    context.read<PropertyListHomeBloc>().add(
          PropertyListHomeEvent.fetchProperties(type: 'top-rated'),
        );
    return BlocBuilder<PropertyListHomeBloc, PropertyListHomeState>(
      builder: (context, state) {
        return state.maybeWhen(
          initial: () => SizedBox(
            height: MyScreenSize.height - sizedBoxHeight,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.search, size: 48, color: Colors.grey),
                SizedBox(height: 16),
                Text(
                  'Welcome! Start exploring properties.',
                  style: TextStyle(fontSize: 16, color: Colors.grey),
                ),
              ],
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
          loading: () => SizedBox(
            height: 250,
            child: ListView(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              children: [1, 2, 3].map(
                (property) {
                  return SizedBox(
                    // height: 100,
                    width: MyScreenSize.width * .8,
                    child: PropertyWidgetShimmer(),
                  );
                },
              ).toList(),
            ),
          ),
          loaded: (propertyList) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Top Rated Resorts',
                  style: MyTextStyles.titleMediumSemiBoldBlack,
                ),
                MySpaces.hSpace10,
                propertyList.isEmpty
                    ? Center(
                        child: Text('No property added'),
                      )
                    : SizedBox(
                        height: 250,
                        child: ListView(
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          children: propertyList.map(
                            (property) {
                              return SizedBox(
                                // height: 100,
                                width: MyScreenSize.width * .8,
                                child: PropertyWidget(
                                  image: property.image.base64file,
                                  propertyName: property.name,
                                  location: property.location,
                                  rating: getAverage(
                                    property.reviews
                                        .map(
                                          (e) => e.rating,
                                        )
                                        .toList(),
                                  ),
                                  reviews: property.reviews
                                      .map(
                                        (e) => e.feedback,
                                      )
                                      .toList(),
                                  rooms: property.rooms,
                                  price: property.price,
                                  onTap: () {
                                    context.push(
                                        '/${AppRoutes.propertyDetailsHome}');

                                    //Loading the property details for next screen
                                    context.read<PropertyDetailsHomeBloc>().add(
                                          PropertyDetailsHomeEvent
                                              .fetchPropertyDetails(
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
                                ),
                              );
                            },
                          ).toList(),
                        ),
                      )
              ],
            );
          },
          orElse: () {
            return Center(
              child: Text('Something unexpected happened, try again'),
            );
          },
        );
      },
    );
  }
}
