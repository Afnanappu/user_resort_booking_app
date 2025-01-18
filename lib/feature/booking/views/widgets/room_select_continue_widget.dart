import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:user_resort_booking_app/core/components/custom_elevated_button.dart';
import 'package:user_resort_booking_app/core/components/custom_snack_bar.dart';
import 'package:user_resort_booking_app/core/constants/my_colors.dart';
import 'package:user_resort_booking_app/core/constants/text_styles.dart';
import 'package:user_resort_booking_app/core/data/models/room_model.dart';
import 'package:user_resort_booking_app/core/utils/custom_date_formats.dart';
import 'package:user_resort_booking_app/feature/booking/view_model/cubit/booking_select_date_cubit.dart';
import 'package:user_resort_booking_app/feature/booking/view_model/cubit/booking_select_people_cubit.dart';
import 'package:user_resort_booking_app/feature/booking/view_model/cubit/booking_selected_rooms_cubit.dart';
import 'package:user_resort_booking_app/routes/route_names.dart';

class RoomSelectContinueWidget extends StatelessWidget {
  const RoomSelectContinueWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withValues(alpha: 0.4),
            blurRadius: 8,
            offset: const Offset(0, -3),
          ),
        ],
      ),
      child: Row(
        children: [
          // Left Section: Price, Room Count, and Days
          BlocBuilder<BookingSelectedRoomsCubit, List<RoomModel>>(
            builder: (context, selectedRooms) {
              final price = selectedRooms.fold(
                0.0,
                (previousValue, element) =>
                    previousValue + double.parse(element.price),
              );
              final roomCount = selectedRooms.length;
              final dateRange = context.read<BookingSelectDateCubit>().state;
              final days =
                  dateRange.endDate!.difference(dateRange.startDate!).inDays;
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    customCurrencyFormat(price),
                    style: MyTextStyles.titleLargeSemiBoldBlack,
                  ),
                  const SizedBox(height: 4),
                  Text(
                    '$roomCount Room${roomCount > 1 ? 's' : ''} • $days Day${days > 1 ? 's' : ''}',
                    style: MyTextStyles.bodySmallMediumGrey,
                  ),
                ],
              );
            },
          ),
          const Spacer(),
          // Right Section: Book Now Button
          CustomElevatedButton(
            text: 'Continue',
            onPressed: () {
              final selectedRoomList =
                  context.read<BookingSelectedRoomsCubit>().state;
              if (selectedRoomList.isEmpty) {
                showCustomSnackBar(
                  context: context,
                  message: 'Select room to continue',
                  bgColor: MyColors.grey,
                );
                return;
              }
              final roomsMaxGustCount = selectedRoomList.fold(
                0,
                (previousValue, element) =>
                    previousValue + int.parse(element.maxGustCount),
              );
              final selectedPeopleCount =
                  context.read<BookingSelectPeopleCubit>().state;

              log('$selectedPeopleCount > $roomsMaxGustCount : ${selectedPeopleCount > roomsMaxGustCount}');

              if (selectedPeopleCount > roomsMaxGustCount) {
                showCustomSnackBar(
                  context: context,
                  message:
                      'Looks like the room is not enough for you, try to select more room',
                  bgColor: MyColors.grey,
                );
                return;
              }

              context.push('/${AppRoutes.reviewBooking}');
            },
          )
        ],
      ),
    );
  }
}
