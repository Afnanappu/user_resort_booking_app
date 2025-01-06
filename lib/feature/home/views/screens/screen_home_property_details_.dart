import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:user_resort_booking_app/core/components/carousel_image_picked_show_widget.dart';
import 'package:user_resort_booking_app/core/components/custom_app_bar.dart';
import 'package:user_resort_booking_app/core/components/custom_divider.dart';
import 'package:user_resort_booking_app/core/components/custom_elevated_button.dart';
import 'package:user_resort_booking_app/core/constants/my_colors.dart';
import 'package:user_resort_booking_app/core/constants/my_constants.dart';
import 'package:user_resort_booking_app/core/constants/spaces.dart';
import 'package:user_resort_booking_app/core/constants/text_styles.dart';
import 'package:user_resort_booking_app/core/utils/screen_size.dart';
import 'package:user_resort_booking_app/feature/home/view_model/bloc/bloc_property_details/property_details_home_bloc.dart';
import 'package:user_resort_booking_app/feature/home/views/components/custom_container_for_property_details.dart';
import 'package:user_resort_booking_app/feature/home/views/components/custom_list_points_widget_for_property_details.dart';
import 'package:user_resort_booking_app/feature/home/views/widgets/about_the_resort_widget_for_property_details.dart';
import 'package:user_resort_booking_app/feature/home/views/widgets/main_details_widget_for_property_details.dart';
import 'package:user_resort_booking_app/routes/route_names.dart';

class ScreenHomePropertyDetails extends StatelessWidget {
  const ScreenHomePropertyDetails({super.key});

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
                        CustomContainerForPropertyDetails(
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
                        ),

                        //Location
                        CustomContainerForPropertyDetails(
                          title: 'Location',

                          //TODO: Add location here using google map.
                          child: Placeholder(
                            fallbackHeight: 250,
                            strokeWidth: .5,
                          ),
                        ),

                        //Review and rating
                        CustomContainerForPropertyDetails(
                          padding: 20,
                          title: 'Review & Rating',

                          //TODO: Add Review & Rating.
                          child: Row(
                            children: [
                              Container(
                                height: 120,
                                width: 120,
                                decoration: BoxDecoration(
                                  borderRadius:
                                      BorderRadius.circular(borderRad10),
                                  color: const Color.fromARGB(255, 54, 187, 59),
                                ),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      '${propertyModel.rating ?? 0}/5',
                                      style: MyTextStyles.ratingStyle.apply(
                                        color: MyColors.white,
                                      ),
                                    ),
                                    Text(
                                      //? NOTE: user review count here
                                      '186 Ratings',
                                      style: TextStyle(
                                        color: MyColors.white,
                                      ),
                                    ),
                                    Text(
                                      //? NOTE: user review count here
                                      '1064 Ratings',
                                      style: TextStyle(
                                        color: MyColors.white,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
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
          
          context.push('/${AppRoutes.propertyRoomListHome}');
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
