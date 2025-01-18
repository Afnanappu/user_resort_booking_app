import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';
import 'package:user_resort_booking_app/core/components/custom_circular_progress_indicator.dart';
import 'package:user_resort_booking_app/core/components/custom_snack_bar.dart';
import 'package:user_resort_booking_app/core/constants/api_keys.dart';
import 'package:user_resort_booking_app/core/data/models/room_model.dart';
import 'package:user_resort_booking_app/core/data/view_model/cubit/user_data_cubit.dart';
import 'package:user_resort_booking_app/core/utils/custom_date_formats.dart';
import 'package:user_resort_booking_app/core/data/models/booking_model.dart';
import 'package:user_resort_booking_app/feature/booking/view_model/bloc/bloc_booking/booking_bloc.dart';
import 'package:user_resort_booking_app/feature/booking/view_model/cubit/booking_details_cubit.dart';
import 'package:user_resort_booking_app/feature/booking/view_model/cubit/booking_select_date_cubit.dart';
import 'package:user_resort_booking_app/feature/booking/view_model/cubit/booking_selected_rooms_cubit.dart';
import 'package:user_resort_booking_app/feature/booking/views/components/booking_confirmation_screen.dart';
import 'package:user_resort_booking_app/feature/home/view_model/bloc/bloc_property_details/property_details_home_bloc.dart';

class ScreenPayment extends StatefulWidget {
  const ScreenPayment({super.key});

  @override
  State<ScreenPayment> createState() => _ScreenPaymentState();
}

class _ScreenPaymentState extends State<ScreenPayment> {
  late Razorpay _razorpay;

  @override
  void initState() {
    super.initState();

    _razorpay = Razorpay();
    _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
    _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
    _razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);

    //start payment
    openCheckout();
  }

  @override
  void dispose() {
    _razorpay.clear();
    super.dispose();
  }

  void openCheckout() {
    final userData = context.read<UserDataCubit>().state!;

    final roomList = context.read<BookingSelectedRoomsCubit>().state;
    final selectedDate = context.read<BookingSelectDateCubit>().state;
    final nights = selectedDate.endDate!
        .difference(
          selectedDate.startDate!,
        )
        .inDays;

    final price = roomList.fold(
      0.0,
      (previousValue, element) => previousValue + double.parse(element.price),
    );
    final amount = (price * nights) + 50 + ((price * nights) * .08);
    //payment details
    var options = {
      'key': RAZORPAY_API_KEY_ID,
      'amount': amount *
          100, // Amount in the smallest currency unit (e.g., 100 for ₹1.00)
      'name': userData.name,
      'description': 'Book resorts',
      'prefill': {
        // 'contact': '9876543210',
        'email': userData.email,
      },
      "notes": {"user_id": userData.uid},
      'theme': {
        'color': '#FB6E34',
      },
      'timeout': 300,
    };

    //Start payment
    try {
      log('opening the razorpay payment gate way');
      _razorpay.open(options);
      // log('opening the razorpay payment gate way');
    } catch (e) {
      debugPrint('Error: $e');
    }
  }

  void _handlePaymentSuccess(PaymentSuccessResponse response) {
    // Handle payment success
    final bookingDetails = context.read<BookingDetailsCubit>().state;

    if (bookingDetails.isEmpty) {
      throw Exception('Booking model is empty');
    }

    final bookingModel = bookingDetails['bookingModel']! as BookingModel;
    final roomList =
        List<RoomModel>.from(bookingDetails['roomList']! as List<dynamic>);

    //request booking
    context.read<BookingBloc>().add(BookingEvent.requestBooking(
          bookingModel: bookingModel,
          roomList: roomList,
        ));

    //TODO: maybe want to send this 'response' variable to bloc for success state.
    log(response.data.toString());
    // response.
    // context.pop();
  }

  void _handlePaymentError(PaymentFailureResponse response) {
    // Handle payment failure

    showCustomSnackBar(
        context: context,
        message: 'Payment Error: ${response.code} | ${response.message}');
    log('Payment Error: ${response.code} | ${response.message}');
    // context.pop();
  }

  void _handleExternalWallet(ExternalWalletResponse response) {
    // Handle external wallet
    log('External Wallet: ${response.walletName}');
    context.pop();
  }

  @override
  Widget build(BuildContext context) {
    final property = context.read<PropertyDetailsHomeBloc>().state.maybeWhen(
          loaded: (propertyDetails) => propertyDetails,
          orElse: () {},
        );
    return Scaffold(
      body: BlocBuilder<BookingBloc, BookingState>(
        builder: (context, state) {
          return state.maybeWhen(
            initial: () => SizedBox(),
            loading: () => Center(
              child: CustomCircularProgressIndicator(),
            ),
            error: (error) => Center(
              child: Text(error),
            ),
            orElse: () => SizedBox(),
            booked: (bookingDetails) {
              log(bookingDetails.toString());
              log(property.toString());
              return Center(
                child: BookingConfirmationScreen(
                  bookingId: bookingDetails.bookingId!,
                  resortName: property!.name,
                  checkInDate:
                      '${customDateFormat2(bookingDetails.startDate)}, ${property.checkInTime}',
                  checkOutDate:
                      '${customDateFormat2(bookingDetails.endDate)}, ${property.checkOutTime}',
                  amountPaid: customCurrencyFormat(bookingDetails.totalPrice),
                  // paymentStatus: true, // or false if payment failed
                ),
              );
            },
          );
        },
      ),
    );
  }
}
