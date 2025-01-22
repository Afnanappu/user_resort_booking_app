import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:user_resort_booking_app/core/components/custom_app_container.dart';
import 'package:user_resort_booking_app/core/constants/my_colors.dart';
import 'package:user_resort_booking_app/core/constants/my_constants.dart';
import 'package:user_resort_booking_app/core/constants/spaces.dart';
import 'package:user_resort_booking_app/core/constants/text_styles.dart';
import 'package:user_resort_booking_app/core/data/models/location_model.dart';
import 'package:user_resort_booking_app/feature/booking/views/components/price_per_day_widget.dart';

class PropertyWidget extends StatelessWidget {
  const PropertyWidget({
    super.key,
    required this.image,
    required this.propertyName,
    required this.location,
    required this.rating,
    required this.reviews,
    required this.rooms,
    required this.price,
    this.onTap,
  });
  final String image;
  final String propertyName;
  final LocationModel location;
  final double rating;
  final List<String> reviews;
  final int rooms;
  final double price;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: GestureDetector(
        onTap: onTap,
        child: CustomAppContainer(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(borderRad10),
                  topRight: Radius.circular(borderRad10),
                ),
                child: SizedBox(
                  height: 150,
                  child: Image.memory(
                    base64Decode(image),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              MySpaces.hSpace10,
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 8,
                  vertical: 5,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  spacing: 5,
                  children: [
                    Text(
                      propertyName,
                      style: MyTextStyles.titleMediumSemiBoldBlack,
                    ),
                    _locationAndReviewRow(),
                    _totalRoomsAndPriceRow(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Row _totalRoomsAndPriceRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'Total Rooms: $rooms',
          style: MyTextStyles.bodySmallMediumBlack,
        ),
        PricePerDayWidget(
          priceText: 'From ₹$price',
          priceStyle: MyTextStyles.bodySmallMediumBlack
              .copyWith(fontWeight: FontWeight.w700),
          suffixStyle: MyTextStyles.bodySmallMediumBlack,
        ),
      ],
    );
  }

  Row _locationAndReviewRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      spacing: 10,
      children: [
        Expanded(
          child: Row(
            children: [
              Icon(
                Icons.location_on_outlined,
                size: 20,
                color: MyColors.greyLight,
              ),
              MySpaces.wSpace5,
              Expanded(
                child: Text(
                  location.address,
                  style: MyTextStyles.textFieldMediumGreyLight,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          width: 1,
          child: Divider(
            color: MyColors.greyLight,
            thickness: 16,
          ),
        ),
        Row(
          children: [
            Icon(
              Icons.star_border,
              size: 20,
              color: MyColors.greyLight,
            ),
            MySpaces.wSpace5,
            Text(
              // '3.3 (251 Reviews)',
              '$rating (${reviews.length} Reviews)',
              style: MyTextStyles.textFieldMediumGreyLight,
            ),
          ],
        ),
      ],
    );
  }
}

class PropertyWidgetShimmer extends StatelessWidget {
  const PropertyWidgetShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: GestureDetector(
        child: CustomAppContainer(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              // Shimmer for Image
              ClipRRect(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10),
                  topRight: Radius.circular(10),
                ),
                child: ShimmerWidget.rectangular(height: 150),
              ),
              SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 8,
                  vertical: 5,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Shimmer for property name
                    ShimmerWidget.rectangular(height: 20, width: 150),
                    SizedBox(height: 10),
                    // Shimmer for location and reviews
                    ShimmerWidget.rectangular(height: 15, width: 230),
                    SizedBox(height: 10),
                    // Shimmer for rooms and price
                    ShimmerWidget.rectangular(height: 15, width: 230),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ShimmerWidget extends StatelessWidget {
  final double height;
  final double? width;
  final BorderRadius? borderRadius;

  const ShimmerWidget.rectangular({
    super.key,
    required this.height,
    this.width,
    this.borderRadius,
  });

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey.shade300,
      highlightColor: Colors.grey.shade100,
      child: Container(
        height: height,
        width: width ?? double.infinity,
        decoration: BoxDecoration(
          color: Colors.grey[300],
          borderRadius: borderRadius ?? BorderRadius.circular(8),
        ),
      ),
    );
  }
}
