
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:user_resort_booking_app/core/components/carousel_image_picked_show_widget.dart';
import 'package:user_resort_booking_app/core/components/custom_app_bar.dart';
import 'package:user_resort_booking_app/core/components/custom_divider.dart';
import 'package:user_resort_booking_app/core/components/custom_elevated_button.dart';
import 'package:user_resort_booking_app/core/components/custom_google_map_widget.dart';
import 'package:user_resort_booking_app/core/constants/my_colors.dart';
import 'package:user_resort_booking_app/core/constants/spaces.dart';
import 'package:user_resort_booking_app/core/constants/text_styles.dart';
import 'package:user_resort_booking_app/core/data/models/rules_details_model.dart';
import 'package:user_resort_booking_app/core/utils/screen_size.dart';
import 'package:user_resort_booking_app/core/data/view_model/bloc/bloc_google_map/google_map_bloc.dart';
import 'package:user_resort_booking_app/feature/booking/views/widgets/select_date_and_gust_sheet.dart';
import 'package:user_resort_booking_app/feature/home/models/property_details_model.dart';
import 'package:user_resort_booking_app/feature/home/view_model/bloc/bloc_property_details/property_details_home_bloc.dart';
import 'package:user_resort_booking_app/feature/home/views/components/custom_container_for_property_details.dart';
import 'package:user_resort_booking_app/feature/home/views/components/custom_list_points_widget_for_property_details.dart';
import 'package:user_resort_booking_app/feature/home/views/widgets/about_the_resort_widget_for_property_details.dart';
import 'package:user_resort_booking_app/feature/home/views/widgets/main_details_widget_for_property_details.dart';
import 'package:user_resort_booking_app/feature/home/views/widgets/review_and_rating_widget.dart';
import 'package:user_resort_booking_app/routes/route_names.dart';

// ignore: must_be_immutable
class ScreenHomePropertyDetails extends StatelessWidget {
  ScreenHomePropertyDetails({super.key});
  CameraPosition? initialCameraPosition;
  late LatLng propertyLocation;
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Details Resort',
        needUnderline: false,
        actions: [
          IconButton(
            onPressed: () {
              //TODO: Add favorite option here

              //!currently adding payment option here

              context.push('/${AppRoutes.payment}');
            },
            icon: Icon(
              Icons.favorite_border,
              color: MyColors.orange,
              size: 22,
            ),
          ),

          //TODO: Add chat option here
          MySpaces.hSpace5,
        ],
      ),
      body: BlocBuilder<PropertyDetailsHomeBloc, PropertyDetailsHomeState>(
        builder: (context, state) {
          return state.maybeWhen(
            initial: () {
              return Center(
                child: Text(
                  'Loading property details, please wait!',
                ),
              );
            },
            loading: () {
              return Center(
                child: Text(
                  'Loading property details, please wait!',
                ),
              );
            },
            error: (message) {
              return Center(
                child: Text(
                  message,
                ),
              );
            },
            loaded: (propertyModel) {
              final rules = propertyModel.extraDetails.rulesDetailsModel;
              final basicDetails = propertyModel.extraDetails.basicDetailsModel;

              return ListView(
                children: [
                  CarouselImagePickedShowWidget(
                    horizontal: 0,
                    pickedImages: propertyModel.images,
                  ),
                  MySpaces.hSpace20,
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Column(
                      spacing: 20,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        //main details
                        MainDetailsWidgetForPropertyDetails(
                          propertyModel: propertyModel,
                        ),

                        CustomDivider(
                          horizontal: 35,
                        ),

                        //About the Resort
                        AboutTheResortWidgetForPropertyDetails(
                          basicDetails: basicDetails,
                          propertyModel: propertyModel,
                        ),

                        //Resort rules
                        _resortRulesBuilder(propertyModel, rules),

                        //Location
                        _locationBuilder(),

                        //Review and rating
                        ReviewAndRatingWidget(
                          propertyModel: propertyModel,
                        ),
                        MySpaces.hSpace60,
                        //
                      ],
                    ),
                  ),
                ],
              );
            },
            orElse: () {
              return Center(
                child: Text(
                  'Something unexpected happened, can\'t load property details',
                ),
              );
            },
          );
        },
      ),
      floatingActionButton: CustomElevatedButton(
        width: MyScreenSize.width * .65,
        text: 'Select Rooms',
        onPressed: () {
          selectDateAndGustBottomSheet(context);
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }

  CustomContainerForPropertyDetails _resortRulesBuilder(
      PropertyDetailsModel propertyModel, RulesDetailsModel rules) {
    return CustomContainerForPropertyDetails(
      title: 'Resort Rules',
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Check-In: ${propertyModel.checkInTime} | Check-Out: ${propertyModel.checkOutTime}',
                style: MyTextStyles.bodySmallMediumBlack
                    .copyWith(letterSpacing: 0),
              ),
            ],
          ),
          CustomDivider(
            vertical: 10,
            horizontal: 34,
          ),
          CustomListPointsWidgetForPropertyDetails(
            title: rules.title,
            details: rules.rules,
          ),
        ],
      ),
    );
  }

  CustomContainerForPropertyDetails _locationBuilder() {
    return CustomContainerForPropertyDetails(
      title: 'Location',

      //TODO: Add location here using google map.
      child: SizedBox(
        height: 250,
        width: .5,
        child: BlocBuilder<GoogleMapBloc, GoogleMapState>(
          builder: (context, state) {
            final cameraPosition = state.maybeWhen(
              mapLoaded: (cameraPosition, selectedMarker) {
                return cameraPosition;
              },
              orElse: () {
                return null;
              },
            );
            if (cameraPosition != null) {
              initialCameraPosition = cameraPosition;
            } else {
              // context.read<GoogleMapBloc>().add(GoogleMapEvent.confirmLocation());
            }

            return initialCameraPosition == null
                ? Center(
                    child: Text(
                      'Loading...',
                    ),
                  )
                : CustomGoogleMapWidget(
                    initialCameraPosition: initialCameraPosition,
                    onMapCreated: (controller) {
                      context
                          .read<GoogleMapBloc>()
                          .getMapController
                          .complete(controller);
                    },
                    markers: state.maybeWhen(
                      locationConfirmed: (selectedLocation, _) => {
                        Marker(
                          markerId: MarkerId('selectedPlace'),
                          icon: BitmapDescriptor.defaultMarker,
                          position: LatLng(
                            selectedLocation.latitude,
                            selectedLocation.longitude,
                          ),
                        )
                      },
                      orElse: () => {},
                    ),
                    polylines: state.maybeWhen(
                      locationConfirmed: (_, polylines) => polylines ?? {},
                      orElse: () => {},
                    ),
                  );
          },
        ),
      ),
    );
  }
}
