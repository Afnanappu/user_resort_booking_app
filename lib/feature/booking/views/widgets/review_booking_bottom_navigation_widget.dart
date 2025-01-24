import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

import 'package:user_resort_booking_app/core/components/custom_bottom_navigation_bar.dart';
import 'package:user_resort_booking_app/core/components/custom_elevated_button.dart';
import 'package:user_resort_booking_app/core/constants/text_styles.dart';
import 'package:user_resort_booking_app/core/data/models/booking_model.dart';
import 'package:user_resort_booking_app/core/data/models/room_model.dart';
import 'package:user_resort_booking_app/core/data/models/user_model.dart';
import 'package:user_resort_booking_app/core/utils/custom_date_formats.dart';
import 'package:user_resort_booking_app/core/utils/custom_id_generate.dart';
import 'package:user_resort_booking_app/feature/booking/view_model/cubit/booking_details_cubit.dart';
import 'package:user_resort_booking_app/feature/home/models/property_details_model.dart';
import 'package:user_resort_booking_app/routes/route_names.dart';

class ReviewBookingBottomNavigationWidget extends StatelessWidget {
  const ReviewBookingBottomNavigationWidget({
    super.key,
    required this.price,
    required this.nights,
    required this.userData,
    required this.property,
    required this.selectedDate,
    required this.roomList,
    required this.peoples,
  });

  final double price;
  final int nights;
  final UserModel userData;
  final PropertyDetailsModel? property;
  final PickerDateRange selectedDate;
  final List<RoomModel> roomList;
  final int peoples;

  @override
  Widget build(BuildContext context) {
    return CustomBottomNavigationBarForBooking(
      left: Expanded(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              customCurrencyFormat(
                  (price * nights) + 50 + ((price * nights) * .08)),
              style: MyTextStyles.titleLargeSemiBoldBlack,
            ),
            const SizedBox(height: 4),
            Text(
              '+${(price * nights) * .08} taxes & fees included ',
              style: MyTextStyles.bodySmallMediumGrey,
              softWrap: true,
              overflow: TextOverflow.visible,
            ),
          ],
        ),
      ),
      right: CustomElevatedButton(
        text: 'Continue',
        onPressed: () {
          final transactionId = customIdGenerate(
            prefix: 'pay',
            separator: '_',
          );

          //creating a booking model
          final bookingModel = BookingModel(
            userId: userData.uid!,
            propertyId: property!.id!,
            startDate: selectedDate.startDate!,
            endDate: selectedDate.endDate!,
            totalPrice: (price * nights) + 50 + ((price * nights) * .08),
            bookedRoomsId: roomList
                .map(
                  (e) => e.id!,
                )
                .toList(),
            createdAt: DateTime.now(),
            updatedAt: DateTime.now(),
            status: 'Booked',
            transactionId: transactionId,
            gustCount: peoples,

            // propertyName: property.name,
          );
          context.read<BookingDetailsCubit>().setBookingDetails(
              bookingModel: bookingModel, roomList: roomList);
          context.push('/${AppRoutes.payment}');
        },
      ),
    );
  }
}
