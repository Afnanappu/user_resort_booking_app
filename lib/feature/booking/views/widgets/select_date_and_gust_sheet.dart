import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';
import 'package:user_resort_booking_app/core/components/custom_elevated_button.dart';
import 'package:user_resort_booking_app/core/constants/spaces.dart';
import 'package:user_resort_booking_app/core/constants/text_styles.dart';
import 'package:user_resort_booking_app/core/utils/custom_date_formats.dart';
import 'package:user_resort_booking_app/feature/booking/view_model/cubit/booking_select_date_cubit.dart';
import 'package:user_resort_booking_app/feature/booking/view_model/cubit/booking_select_people_cubit.dart';
import 'package:user_resort_booking_app/feature/booking/views/widgets/booking_date_picker_dialog.dart';
import 'package:user_resort_booking_app/routes/route_names.dart';

void selectDateAndGustBottomSheet(BuildContext context) {
  showModalBottomSheet(
    context: context,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(
        top: Radius.circular(20),
      ),
    ),
    builder: (context) {
      return Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Select date and guests',
              style: MyTextStyles.titleMediumSemiBoldBlack,
            ),
            SizedBox(height: 16),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                BlocBuilder<BookingSelectDateCubit, PickerDateRange>(
                  builder: (context, pickedDate) {
                    final startingDate =
                        customDateFormat(pickedDate.startDate!);
                    final endDate = customDateFormat(
                      pickedDate.endDate!,
                    );
                    return ListTile(
                      leading: Icon(Icons.calendar_today),
                      title: Text("Select Date"),
                      trailing: TextButton(
                        child: Text(
                          '$startingDate - $endDate',
                          style: TextStyle(fontSize: 14),
                        ),
                        onPressed: () {
                          bookingDatePickerDialog(context, pickedDate);
                        },
                      ),
                    );
                  },
                ),
                Divider(),
                BlocBuilder<BookingSelectPeopleCubit, int>(
                  builder: (context, peopleCount) {
                    return ListTile(
                      leading: Icon(Icons.group),
                      title: Text("Peoples"),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          IconButton(
                            onPressed: () {
                              if (peopleCount > 1) {
                                context
                                    .read<BookingSelectPeopleCubit>()
                                    .setPeople(peopleCount - 1);
                              }
                            },
                            icon: Icon(Icons.remove),
                            color: peopleCount > 1 ? Colors.black : Colors.grey,
                          ),
                          SizedBox(
                            width: 40,
                            child: Text(
                              '$peopleCount',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold),
                            ),
                          ),
                          IconButton(
                            onPressed: () {
                              if (peopleCount < 20) {
                                context
                                    .read<BookingSelectPeopleCubit>()
                                    .setPeople(peopleCount + 1);
                              }
                            },
                            icon: Icon(Icons.add),
                            color:
                                peopleCount < 20 ? Colors.black : Colors.grey,
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ],
            ),
            MySpaces.hSpace20,
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomElevatedButton(
                  text: 'Continue',
                  onPressed: () {
                    context.pop();
                    context.push('/${AppRoutes.propertyRoomList}');
                  },
                ),
              ],
            ),
          ],
        ),
      );
    },
  );
}
