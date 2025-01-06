import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:user_resort_booking_app/core/components/custom_app_bar.dart';
import 'package:user_resort_booking_app/core/components/custom_snack_bar.dart';
import 'package:user_resort_booking_app/feature/home/view_model/bloc/bloc_property_details/property_details_home_bloc.dart';
import 'package:user_resort_booking_app/feature/home/view_model/bloc/bloc_property_room_list/property_home_room_list_bloc.dart';
import 'package:user_resort_booking_app/feature/home/views/components/room_list_card.dart';

class ScreenHomePropertyRoomsList extends StatelessWidget {
  const ScreenHomePropertyRoomsList({super.key});

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
        log('Worked');
        context
            .read<PropertyHomeRoomListBloc>()
            .add(PropertyHomeRoomListEvent.fetchRooms(propertyId: id));

        log('after Worked');
      },
    );
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Rooms',
      ),
      body: Padding(
        padding: const EdgeInsets.all(14),
        child: BlocBuilder<PropertyHomeRoomListBloc, PropertyHomeRoomListState>(
          builder: (context, state) {
            log(state.toString());
            return state.maybeWhen(
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
              orElse: () {
                return Center(
                  child: Text(
                    'Something unexpected happened, can\'t load property details',
                  ),
                );
              },
              loaded: (roomList) {
                //TODO: changed to list view
                return ListView(
                  children: [
                    //TODO: property sorting is need to be added

                    roomList.isEmpty
                        ? Center(
                            child: Text('No Room found'),
                          )
                        : ListView.builder(
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            itemCount: roomList.length,
                            itemBuilder: (context, index) {
                              final room = roomList[index];
                              return Padding(
                                padding: const EdgeInsets.only(bottom: 10),
                                child: RoomListCard(
                                  room: room,
                                  onTap: () {
                                    // final propertyId = context
                                    //     .read<PropertyDetailsBloc>()
                                    //     .getPropertyId();

                                    // context.read<PropertyRoomDetailsBloc>().add(
                                    //       PropertyRoomDetailsEvent
                                    //           .fetchRoomDetails(
                                    //         propertyId: propertyId!,
                                    //         roomId: room.id!,
                                    //       ),
                                    //     );
                                    // context.push(
                                    //     '/${AppRoutes.myPropertyRoomDetails}');
                                  },
                                ),
                              );
                            },
                          ),
                  ],
                );
              },
            );
          },
        ),
      ),
    );
  }
}
