import 'dart:math';
import 'package:flutter/material.dart';
import 'package:user_resort_booking_app/core/constants/my_colors.dart';
import 'package:user_resort_booking_app/core/constants/my_constants.dart';
import 'package:user_resort_booking_app/core/constants/text_styles.dart';
import 'package:user_resort_booking_app/feature/home/models/property_details_model.dart';
import 'package:user_resort_booking_app/core/components/custom_container_for_property_details.dart';
import 'package:user_resort_booking_app/feature/home/views/components/rating_start_indicator_component.dart';

class ReviewAndRatingWidget extends StatelessWidget {
  const ReviewAndRatingWidget({
    super.key,
    required this.propertyModel,
  });

  final PropertyDetailsModel propertyModel;

  @override
  Widget build(BuildContext context) {
    return CustomContainerForPropertyDetails(
      padding: 20,
      title: 'Review & Rating',

      //TODO: Add Review & Rating.
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        spacing: 10,
        children: [
          //green box
          Container(
            height: 120,
            width: 120,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(borderRad10),
              color: const Color.fromARGB(255, 54, 187, 59),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  '${propertyModel.rating}/5',
                  style: MyTextStyles.ratingStyle.apply(
                    color: MyColors.white,
                  ),
                ),
                Text(
                  //? NOTE: user review count here
                  '${propertyModel.rating} Ratings',
                  style: TextStyle(
                    color: MyColors.white,
                  ),
                ),
                Text(
                  //? NOTE: user review count here
                  '${propertyModel.reviews.length} Reviews',
                  style: TextStyle(
                    color: MyColors.white,
                  ),
                ),
              ],
            ),
          ),

          //TODO: rating
          Expanded(
            child: ListView.builder(
              itemCount: 5,
              shrinkWrap: true,
              physics: AlwaysScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                return RatingStartIndicatorComponent(
                  index: 5 - index,
                  indicatorValue: Random().nextDouble(),
                  rating: Random().nextInt(30),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
