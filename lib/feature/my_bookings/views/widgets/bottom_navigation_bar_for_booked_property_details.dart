import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:user_resort_booking_app/core/components/custom_alert_dialog.dart';
import 'package:user_resort_booking_app/core/components/custom_bottom_navigation_bar.dart';
import 'package:user_resort_booking_app/core/components/custom_elevated_button.dart';
import 'package:user_resort_booking_app/core/constants/text_styles.dart';
import 'package:user_resort_booking_app/feature/my_bookings/view_model/bloc/bloc_booked_property_details/booked_property_details_bloc.dart';

class BottomNavigationBarForBookedPropertyDetails extends StatelessWidget {
  const BottomNavigationBarForBookedPropertyDetails({
    super.key,
    required this.state,
  });
  final BookedPropertyDetailsState state;
  @override
  Widget build(BuildContext context) {
    final bookedDetails = state.maybeWhen(
      loaded: (bookedPropertyDetails) => bookedPropertyDetails,
      orElse: () {},
    );
    return CustomBottomNavigationBarForBooking(
      left: Expanded(
        child: Text(
          'Cancellation may be subject to charges or refund rules',
          style: MyTextStyles.bodySmallMediumGreyLight.copyWith(fontSize: 13),
        ),
      ),
      right: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child:
            // getBookingStatus(
            //           bookedDetails?.bookingDetails.status ?? 'cancelled',
            //         ) !=
            //         BookingStatus.completed
            //     ?
            CustomElevatedButton(
          style: MyTextStyles.titleMediumSemiBoldWhite.copyWith(fontSize: 16),
          text: 'Cancel',
          onPressed: () {
            if (bookedDetails == null) {
              // showCustomSnackBar(context: context, message: '');
              return;
            }

            customAlertDialog(
              context: context,
              title: 'Cancel Booking',
              content:
                  'Read the cancellation policy before cancelling the booking!',
              firstText: 'Yes',
              secondText: 'Cancel',
              secondOnPressed: () {
                context.pop();
              },
              firstOnPressed: () {
                context
                    .read<BookedPropertyDetailsBloc>()
                    .add(BookedPropertyDetailsEvent.cancelBooking(
                      bookedPropertyDetailsModel: bookedDetails,
                    ));
                context.pop();
              },
            );
          },
        ),
        // : ReviewAndRatingWidget(
        //     bookingId: bookedDetails!.bookingDetails.bookingId!,
        //     onSubmit: (review, rating) {},
        //   ),
      ),
    );
  }
}
