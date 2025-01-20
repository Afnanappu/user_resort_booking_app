import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:user_resort_booking_app/core/data/models/room_model.dart';
import 'package:user_resort_booking_app/feature/booking/view_model/bloc/bloc_room_details/property_room_details_bloc.dart';
import 'package:user_resort_booking_app/feature/booking/views/widgets/room_list_card.dart';
import 'package:user_resort_booking_app/feature/home/view_model/bloc/bloc_property_details/property_details_home_bloc.dart';
import 'package:user_resort_booking_app/routes/route_names.dart';

class RoomListWidget extends StatelessWidget {
  const RoomListWidget({
    super.key,
    required this.roomList,
  });

  final List<RoomModel> roomList;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: roomList.length,
      itemBuilder: (context, index) {
        final room = roomList[index];

        return Padding(
          padding: const EdgeInsets.only(bottom: 10),
          child: RoomListCard(
            room: room,
            index: index,
            onTap: () {
              final propertyId =
                  context.read<PropertyDetailsHomeBloc>().getPropertyId();

              context.read<PropertyRoomDetailsBloc>().add(
                    PropertyRoomDetailsEvent.fetchRoomDetails(
                      propertyId: propertyId!,
                      roomId: room.id!,
                    ),
                  );
              context.push('/${AppRoutes.propertyRoomDetails}');
            },
          ),
        );
      },
    );
  }
}
