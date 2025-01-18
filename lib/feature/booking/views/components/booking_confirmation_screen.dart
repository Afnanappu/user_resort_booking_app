import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:user_resort_booking_app/core/components/custom_app_bar.dart';
import 'package:user_resort_booking_app/core/components/custom_app_container.dart';
import 'package:user_resort_booking_app/core/components/custom_elevated_button.dart';
import 'package:user_resort_booking_app/core/constants/my_colors.dart';
import 'package:user_resort_booking_app/core/constants/text_styles.dart';
import 'package:user_resort_booking_app/feature/booking/view_model/bloc/bloc_booking/booking_bloc.dart';
import 'package:user_resort_booking_app/feature/booking/view_model/cubit/booking_details_cubit.dart';
import 'package:user_resort_booking_app/feature/booking/view_model/cubit/booking_select_date_cubit.dart';
import 'package:user_resort_booking_app/feature/booking/view_model/cubit/booking_select_people_cubit.dart';
import 'package:user_resort_booking_app/feature/booking/view_model/cubit/booking_selected_rooms_cubit.dart';
import 'package:user_resort_booking_app/routes/route_names.dart';

class BookingConfirmationScreen extends StatelessWidget {
  final String bookingId;
  final String resortName;
  final String checkInDate;
  final String checkOutDate;
  final String amountPaid;

  const BookingConfirmationScreen({
    super.key,
    required this.bookingId,
    required this.resortName,
    required this.checkInDate,
    required this.checkOutDate,
    required this.amountPaid,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: "Booking Confirmed",
        hadLeading: false,
        // needUnderline: false,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Icon(Icons.check_circle, color: MyColors.orange, size: 80),
            SizedBox(height: 20),
            Text(
              "Your Booking is Confirmed!",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: MyColors.orange,
              ),
            ),
            SizedBox(height: 20),
            CustomAppContainer(
              margin: EdgeInsets.symmetric(vertical: 10),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  spacing: 10,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _infoRow("Booking ID:", bookingId),
                    _infoRow("Resort:", resortName),
                    _infoRow("Check-in:", checkInDate),
                    _infoRow("Check-out:", checkOutDate),
                    _infoRow("Amount Paid:", amountPaid),
                  ],
                ),
              ),
            ),
            SizedBox(height: 20),
            CustomElevatedButton(
              onPressed: () {
                context.read<BookingBloc>().add(BookingEvent.clear());
                context.read<BookingDetailsCubit>().clear();
                context.read<BookingSelectedRoomsCubit>().clear();
                context.read<BookingSelectPeopleCubit>().clear();
                context.read<BookingSelectDateCubit>().clear();
                context.go('/${AppRoutes.home}');
              },
              text: "Go to Home",
            ),
          ],
        ),
      ),
    );
  }

  Widget _infoRow(String title, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title, style: MyTextStyles.bodyLargeBoldBlack
              // TextStyle(fontWeight: FontWeight.bold),
              ),
          Text(value, style: MyTextStyles.bodyLargeNormalGrey
              // TextStyle(color: Colors.grey[700],),
              ),
        ],
      ),
    );
  }
}
