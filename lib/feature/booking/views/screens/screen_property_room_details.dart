import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:user_resort_booking_app/core/components/carousel_image_picked_show_widget.dart';
import 'package:user_resort_booking_app/core/components/custom_app_bar.dart';
import 'package:user_resort_booking_app/core/components/custom_app_container.dart';
import 'package:user_resort_booking_app/core/constants/spaces.dart';
import 'package:user_resort_booking_app/core/constants/text_styles.dart';
import 'package:user_resort_booking_app/core/utils/screen_size.dart';
import 'package:user_resort_booking_app/feature/booking/view_model/bloc/bloc_room_details/property_room_details_bloc.dart';
import 'package:user_resort_booking_app/feature/booking/views/components/price_per_day_widget.dart';
import 'package:user_resort_booking_app/feature/booking/views/widgets/property_room_details_amenities_widget.dart';

class ScreenPropertyRoomDetails extends StatelessWidget {
  const ScreenPropertyRoomDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Details Resort',
        needUnderline: false,
        // actions: [
        //   IconButton(
        //     onPressed: () {
        //     },
        //     icon: Icon(Icons.edit_note_outlined),
        //   ),
        //   MySpaces.hSpace5,
        // ],
      ),
      body: BlocBuilder<PropertyRoomDetailsBloc, PropertyRoomDetailsState>(
        builder: (context, state) {
          return state.maybeWhen(
            initial: () {
              return Center(
                child: Text(
                  'Loading room details, please wait!',
                ),
              );
            },
            loading: () {
              return Center(
                child: Text(
                  'Loading room details, please wait!',
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
            loaded: (roomModel) {
              return ListView(
                // shrinkWrap: true,
                children: [
                  CarouselImagePickedShowWidget(
                    horizontal: 0,
                    pickedImages: roomModel.images,
                  ),
                  MySpaces.hSpace20,
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      spacing: 20,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        //main details
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          spacing: 10,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Room Id: ${roomModel.roomId}',
                                  style: MyTextStyles.titleLargeSemiBoldBlack,
                                ),
                                PricePerDayWidget(
                                  priceText: '₹${roomModel.price}',
                                  priceStyle:
                                      MyTextStyles.titleLargeSemiBoldBlack,
                                  suffixStyle:
                                      MyTextStyles.bodySmallMediumBlack,
                                ),
                              ],
                            ),
                            Text(
                              '${roomModel.roomArea} sqm • ${roomModel.roomType} • ${roomModel.bedType} • Max ${roomModel.maxGustCount} gust',
                            ),

                            MySpaces.hSpace20,

                            CustomAppContainer(
                              width: MyScreenSize.width,
                              padding: EdgeInsets.all(15),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                spacing: 25,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    spacing: 8,
                                    children: [
                                      Text(
                                        'Description',
                                        style: MyTextStyles
                                            .titleMediumSemiBoldBlack,
                                      ),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(left: 12),
                                        child: Text(
                                          roomModel.description,
                                          style:
                                              MyTextStyles.bodySmallNormalBlack,
                                        ),
                                      )
                                    ],
                                  ),
                                  PropertyRoomDetailsAmenitiesWidget(
                                    roomModel: roomModel,
                                  ),
                                ],
                              ),
                            ),

                            // Column(
                            //   crossAxisAlignment: CrossAxisAlignment.start,
                            //   spacing: 15,
                            //   children: [
                            //     Text(
                            //       'Availability',
                            //       style: MyTextStyles.titleLargeSemiBoldBlack,
                            //     ),
                            // CustomCalendarWidget(
                            //   selectedDates: [
                            //     DateTime(2025, 1, 5),
                            //     DateTime(2025, 1, 10),
                            //     DateTime(2025, 1, 15),
                            //   ],
                            // ),
                            //   ],
                            // ),
                            // MySpaces.hSpace60,
                          ],
                        )
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
    );
  }
}
