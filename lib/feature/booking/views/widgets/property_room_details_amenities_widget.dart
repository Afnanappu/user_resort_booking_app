import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:user_resort_booking_app/core/components/custom_icon_widget.dart';
import 'package:user_resort_booking_app/core/constants/text_styles.dart';
import 'package:user_resort_booking_app/core/data/models/room_model.dart';

class PropertyRoomDetailsAmenitiesWidget extends StatelessWidget {
  const PropertyRoomDetailsAmenitiesWidget({
    super.key,
    required this.roomModel,
  });

  final RoomModel roomModel;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 8,
      children: [
        Text(
          'Amenities',
          style: MyTextStyles.titleMediumSemiBoldBlack,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 12),
          child: GridView.builder(
            shrinkWrap: true,
            physics:
                NeverScrollableScrollPhysics(), // Prevents scroll conflicts
            itemCount: roomModel.amenities.length,
            gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
              childAspectRatio: 4,
              maxCrossAxisExtent: 200,
              mainAxisSpacing: 10,
              crossAxisSpacing: 10,
            ),
            itemBuilder: (context, index) {
              final amenities = roomModel.amenities[index];
              return LayoutBuilder(
                builder: (context, constraints) {
                  return CustomIconTextWidget(
                    icon: amenities.image == null
                        ? SizedBox()
                        : Image.memory(
                            base64Decode(
                              amenities.image!,
                            ),
                            height: 20,
                          ),
                    content: Text(
                      amenities.name,
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 14),
                    ),
                  );
                },
              );
            },
          ),
        )
      ],
    );
  }
}
