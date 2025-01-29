

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:user_resort_booking_app/core/components/custom_app_bar.dart';
import 'package:user_resort_booking_app/core/components/property_simple_card_component.dart';
import 'package:user_resort_booking_app/core/data/view_model/bloc/bloc_google_map/google_map_bloc.dart';
import 'package:user_resort_booking_app/core/data/view_model/cubit/user_data_cubit.dart';
import 'package:user_resort_booking_app/core/utils/math_functions.dart';
import 'package:user_resort_booking_app/core/utils/screen_size.dart';
import 'package:user_resort_booking_app/feature/home/view_model/bloc/bloc_property_details/property_details_home_bloc.dart';
import 'package:user_resort_booking_app/feature/profile/view_model/bloc/bloc_favorite/favorite_bloc.dart';
import 'package:user_resort_booking_app/routes/route_names.dart';

class ScreenFavorite extends StatelessWidget {
  const ScreenFavorite({super.key});
  final middle = 0.75;
  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _fetchFavorite(context);
    });
    return Scaffold(
        appBar: CustomAppBar(
          title: 'Favorite',
        ),
        body: RefreshIndicator.adaptive(
          onRefresh: () async {
            _fetchFavorite(context);
          },
          child: ListView(
            children: [
              BlocBuilder<FavoriteBloc, FavoriteState>(
                builder: (context, state) {
                  return state.maybeWhen(
                    loading: () => ListView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: 5,
                      itemBuilder: (context, index) =>
                          PropertySimpleCardShimmer(),
                    ),
                    error: (error) => SizedBox(
                      height: MyScreenSize.height * middle,
                      child: Center(
                        child: Text(error),
                      ),
                    ),
                    orElse: () => SizedBox(
                      height: MyScreenSize.height * middle,
                      child: Center(
                        child: Text('something unexpected happened'),
                      ),
                    ),
                    loaded: (propertyList) {
                      return propertyList.isEmpty
                          ? SizedBox(
                              height: MyScreenSize.height * middle,
                              child: Center(
                                child: Text('No property added'),
                              ),
                            )
                          : ListView.builder(
                              shrinkWrap: true,
                              physics: NeverScrollableScrollPhysics(),
                              itemCount: propertyList.length,
                              itemBuilder: (context, index) {
                                final property = propertyList[index];
                                
                                return PropertySimpleCardComponent(
                                  havePlaceholder: false,
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
                                  price: property.price,
                                  onTap: () {
                                    print("Tapped on ${property.name}");
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
                                );
                              },
                            );
                    },
                  );
                },
              ),
            ],
          ),
        ));
  }

  void _fetchFavorite(BuildContext context) {
    final userId = context.read<UserDataCubit>().state!.uid!;
    context.read<FavoriteBloc>().add(
          FavoriteEvent.fetchFavorites(userId: userId),
        );
  }
}
