import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:user_resort_booking_app/core/components/custom_search_bar.dart';
import 'package:user_resort_booking_app/core/constants/my_colors.dart';
import 'package:user_resort_booking_app/core/constants/spaces.dart';
import 'package:user_resort_booking_app/core/constants/text_styles.dart';
import 'package:user_resort_booking_app/core/utils/debouncer.dart';
import 'package:user_resort_booking_app/core/utils/math_functions.dart';
import 'package:user_resort_booking_app/core/utils/screen_size.dart';
import 'package:user_resort_booking_app/core/data/view_model/bloc/bloc_google_map/google_map_bloc.dart';
import 'package:user_resort_booking_app/feature/home/view_model/bloc/bloc_property_details/property_details_home_bloc.dart';
import 'package:user_resort_booking_app/feature/search/view/components/custom_filter_widget.dart';
import 'package:user_resort_booking_app/core/components/property_simple_card_component.dart';
import 'package:user_resort_booking_app/feature/search/view_model/bloc_property_list/my_property_list_bloc.dart';
import 'package:user_resort_booking_app/routes/route_names.dart';

class ScreenSearch extends StatelessWidget {
  ScreenSearch({super.key});
  final searchController = SearchController();
  final height = MyScreenSize.height * .65;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: RefreshIndicator.adaptive(
          onRefresh: () async {
            if (searchController.text.trim().isNotEmpty) {
              context.read<MyPropertyListBloc>().add(
                    MyPropertyListEvent.fetchProperties(
                      search: searchController.text.trim(),
                    ),
                  );
            } else {
              context
                  .read<MyPropertyListBloc>()
                  .add(MyPropertyListEvent.clear());
            }
          },
          edgeOffset: 170,
          child: ListView(
            physics: AlwaysScrollableScrollPhysics(),
            children: [
              MySpaces.hSpace10,
              CustomSearchBar(
                searchController: searchController,
                trailing: [
                  IconButton(
                    onPressed: () {
                      showModalBottomSheet(
                        context: context,
                        builder: (context) => FilterBottomSheet(),
                      );
                    },
                    icon: Image.asset(
                      'assets/icons/filter.png',
                      height: 20,
                    ),
                  )
                ],
                onChanged: (value) {
                  Debouncer().call(() {
                    context.read<MyPropertyListBloc>().add(
                          MyPropertyListEvent.fetchProperties(
                            search: value.trim(),
                          ),
                        );
                  });
                },
                suggestionsBuilder:
                    (BuildContext context, SearchController controller) {
                  return [];
                },
              ),
              MySpaces.hSpace20,
              ListTile(
                leading: Icon(
                  Icons.my_location_outlined,
                  color: MyColors.blue,
                ),
                title: Text('find nearby resorts'),
                onTap: () async {
                  //get the nearby properties
                  context.read<MyPropertyListBloc>().add(
                        MyPropertyListEvent.fetchNearbyProperties(),
                      );
                },
              ),
              MySpaces.hSpace20,
              BlocBuilder<MyPropertyListBloc, MyPropertyListState>(
                builder: (context, state) {
                  return state.maybeWhen(
                    initial: () => SizedBox(
                      height: height,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.search, size: 48, color: Colors.grey),
                          SizedBox(height: 16),
                          Text(
                            'Welcome! Start searching properties.',
                            style: TextStyle(fontSize: 16, color: Colors.grey),
                          ),
                        ],
                      ),
                    ),
                    error: (message) => SizedBox(
                      height: height,
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
                      itemBuilder: (context, index) =>
                          PropertySimpleCardShimmer(),
                    ),
                    loaded: (propertyList) {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '${propertyList.length} Results found',
                            style: MyTextStyles.titleMediumSemiBoldBlack,
                          ),
                          MySpaces.hSpace10,
                          propertyList.isEmpty
                              ? Center(
                                  child: Text('No property added'),
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
                                        context
                                            .read<PropertyDetailsHomeBloc>()
                                            .add(
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
                                ),
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
              ),
            ],
          ),
        ),
      ),
    );
  }
}
