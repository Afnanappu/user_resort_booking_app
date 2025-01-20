import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:user_resort_booking_app/core/components/custom_app_bar.dart';
import 'package:user_resort_booking_app/core/components/custom_snack_bar.dart';
import 'package:user_resort_booking_app/feature/booking/view_model/bloc/bloc_property_room_list/property_room_list_bloc.dart';
import 'package:user_resort_booking_app/feature/booking/view_model/cubit/booking_select_date_cubit.dart';
import 'package:user_resort_booking_app/feature/booking/view_model/cubit/booking_select_people_cubit.dart';
import 'package:user_resort_booking_app/feature/booking/view_model/cubit/booking_selected_rooms_cubit.dart';
import 'package:user_resort_booking_app/feature/booking/views/widgets/room_list_widget.dart';
import 'package:user_resort_booking_app/feature/booking/views/widgets/room_select_continue_widget.dart';
import 'package:user_resort_booking_app/feature/home/view_model/bloc/bloc_property_details/property_details_home_bloc.dart';
import 'package:user_resort_booking_app/feature/booking/views/widgets/room_list_card.dart';

class ScreenPropertyRoomsList extends StatelessWidget {
  const ScreenPropertyRoomsList({super.key});

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback(
      (_) {
        final id = context.read<PropertyDetailsHomeBloc>().getPropertyId();
        if (id == null) {
          showCustomSnackBar(
              context: context, message: 'Id is null, can\'t show rooms');
          return;
        }
        final selectedDate = context.read<BookingSelectDateCubit>().state;

        context.read<PropertyRoomListBloc>().add(
              PropertyRoomListEvent.fetchRooms(
                propertyId: id,
                selectedDateRange: selectedDate,
              ),
            );
      },
    );
    return PopScope(
      onPopInvokedWithResult: (didPop, result) {
        context.read<BookingSelectedRoomsCubit>().clear();
        context.read<BookingSelectPeopleCubit>().clear();
        context.read<BookingSelectDateCubit>().clear();

        log('Data cleared');
      },
      child: Scaffold(
        appBar: CustomAppBar(
          title: 'Rooms',
        ),
        body: Padding(
          padding: const EdgeInsets.all(14),
          child: BlocBuilder<PropertyRoomListBloc, PropertyRoomListState>(
            builder: (context, state) {
              return state.maybeWhen(
                loading: () {
                  return ListView.builder(
                    shrinkWrap: true,
                    itemCount: 3,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 10),
                        child: RoomListCardShimmer(),
                      );
                    },
                  );
                },
                error: (message) {
                  return Center(
                    child: Text(
                      message,
                    ),
                  );
                },
                orElse: () {
                  return Center(
                    child: Text(
                      'Something unexpected happened, can\'t load property details',
                    ),
                  );
                },
                loaded: (roomList) {
                  return roomList.isEmpty
                      ? Center(
                          child: Text(
                            'No Room found available for your selected date',
                          ),
                        )
                      : RoomListWidget(
                          roomList: roomList,
                        );
                },
              );
            },
          ),
        ),
        bottomNavigationBar: RoomSelectContinueWidget(),
      ),
    );
  }
}
