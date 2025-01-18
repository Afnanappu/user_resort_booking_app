import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';
import 'package:user_resort_booking_app/core/components/custom_snack_bar.dart';
import 'package:user_resort_booking_app/core/constants/my_colors.dart';
import 'package:user_resort_booking_app/feature/booking/view_model/cubit/booking_select_date_cubit.dart';

void bookingDatePickerDialog(
    BuildContext context, PickerDateRange initialDateRange) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        content: SizedBox(
          width: double.maxFinite,
          height: 400, // Adjust height as needed
          child: SfDateRangePicker(
            selectionMode: DateRangePickerSelectionMode.multiRange,
            showActionButtons: true,
            enablePastDates: false,
            confirmText: 'select',
            selectionRadius: 30,
            selectionColor: MyColors.orange,
            rangeSelectionColor: MyColors.orangeBackground,
            startRangeSelectionColor: MyColors.orange,
            endRangeSelectionColor: MyColors.orange,
            extendableRangeSelectionDirection:
                ExtendableRangeSelectionDirection.forward,
            // showTodayButton: true,
// view: DateRangePickerView.,
            // viewSpacing: 25,

            initialSelectedRanges: [
              initialDateRange,
            ],
            // initialDisplayDate: initialDate,
            onSubmit: (value) {
              if (value is! List<PickerDateRange>) {
                log('Selected date is not pickerDateRange');
                showCustomSnackBar(
                  context: context,
                  message: 'Select one date range',
                );
                // context.pop();
                return;
              }
              if (value.first.startDate == null &&
                  value.first.endDate == null) {
                log('Select a date between ranges, starting or ending date is null');
                showCustomSnackBar(
                  context: context,
                  message: 'Select range have no end or starting',
                );
              }
              context.read<BookingSelectDateCubit>().setDateRange(value.first);
              context.pop();
            },
            onCancel: () {
              context.pop();
            },
          ),
        ),
      );
    },
  );
}
