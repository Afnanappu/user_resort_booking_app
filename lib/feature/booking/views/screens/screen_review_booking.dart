import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:user_resort_booking_app/core/components/custom_app_bar.dart';
import 'package:user_resort_booking_app/core/components/payment_review_widget.dart';
import 'package:user_resort_booking_app/core/components/property_simple_card_component.dart';
import 'package:user_resort_booking_app/core/components/selected_room_widget.dart';
import 'package:user_resort_booking_app/core/constants/spaces.dart';
import 'package:user_resort_booking_app/core/data/view_model/cubit/user_data_cubit.dart';
import 'package:user_resort_booking_app/core/utils/custom_date_formats.dart';
import 'package:user_resort_booking_app/feature/booking/view_model/cubit/booking_select_date_cubit.dart';
import 'package:user_resort_booking_app/feature/booking/view_model/cubit/booking_select_people_cubit.dart';
import 'package:user_resort_booking_app/feature/booking/view_model/cubit/booking_selected_rooms_cubit.dart';
import 'package:user_resort_booking_app/feature/booking/views/widgets/review_booking_bottom_navigation_widget.dart';
import 'package:user_resort_booking_app/feature/booking/views/widgets/your_booking_details_widget.dart';
import 'package:user_resort_booking_app/feature/home/view_model/bloc/bloc_property_details/property_details_home_bloc.dart';

class ScreenReviewBooking extends StatelessWidget {
  const ScreenReviewBooking({super.key});

  @override
  Widget build(BuildContext context) {
    // context.read<BookingDetailsCubit>().setBookingDetails(bookingModel: bookingModel, roomList: roomList);

    final property = context.read<PropertyDetailsHomeBloc>().state.maybeWhen(
          loaded: (propertyDetails) => propertyDetails,
          orElse: () {},
        );

    final roomList = context.read<BookingSelectedRoomsCubit>().state;

    final userData = context.read<UserDataCubit>().state!;

    final peoples = context.read<BookingSelectPeopleCubit>().state;

    final selectedDate = context.read<BookingSelectDateCubit>().state;

    final startingDate = customDateFormat(selectedDate.startDate!);

    final endDate = customDateFormat(selectedDate.endDate!);

    final nights = selectedDate.endDate!
        .difference(
          selectedDate.startDate!,
        )
        .inDays;

    final price = roomList.fold(
      0.0,
      (previousValue, element) => previousValue + double.parse(element.price),
    );

    return Scaffold(
      appBar: CustomAppBar(
        title: 'Review Booking',
      ),
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: ListView(
          children: [
            //Property
            PropertySimpleCardComponent(
              image: property!.images.first.base64file,
              propertyName: property.name,
              location: property.location,
              rating: property.rating,
              reviews: property.reviews,
              price: property.price,
            ),

            MySpaces.hSpace20,

            //booking details
            YourBookingDetailsWidget(
              startingDate: startingDate,
              endDate: endDate,
              peoples: peoples,
              userData: userData,
            ),

            MySpaces.hSpace20,

            //Selected room list
            SelectedRoomWidget(
              roomList: roomList,
              selectedDate: selectedDate,
              peoples: peoples,
              nights: nights,
            ),

            MySpaces.hSpace20,

            //Payment
            PaymentReviewWidget(
              roomList: roomList,
              nights: nights,
              price: price,
            ),
          ],
        ),
      ),
      // ReviewBookingContinueWidget
      bottomNavigationBar: ReviewBookingBottomNavigationWidget(
        price: price,
        nights: nights,
        userData: userData,
        property: property,
        selectedDate: selectedDate,
        roomList: roomList,
        peoples: peoples,
      ),
    );
  }
}
