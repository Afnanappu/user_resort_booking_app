import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:user_resort_booking_app/core/components/custom_app_container.dart';
import 'package:user_resort_booking_app/core/components/custom_elevated_button.dart';
import 'package:user_resort_booking_app/core/constants/my_colors.dart';
import 'package:user_resort_booking_app/core/constants/my_constants.dart';
import 'package:user_resort_booking_app/core/constants/spaces.dart';
import 'package:user_resort_booking_app/core/constants/text_styles.dart';
import 'package:user_resort_booking_app/core/utils/custom_date_formats.dart';

class BookedPropertyCard extends StatelessWidget {
  final String bookingId;
  final String propertyName;
  final String bookingDates;
  final String price;
  final String imageUrl;
  final String status;
  final VoidCallback? onInfoPressed;
  final VoidCallback? onStatusPressed;

  const BookedPropertyCard({
    super.key,
    required this.bookingId,
    required this.propertyName,
    required this.bookingDates,
    required this.price,
    required this.imageUrl,
    required this.status,
    this.onInfoPressed,
    this.onStatusPressed,
  });

  @override
  Widget build(BuildContext context) {
    return CustomAppContainer(
      height: 160,
      margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // _buildHeader(),
          Text(
            'Booking Id: $bookingId',
            style: MyTextStyles.bodyLargeBoldBlack,
          ),
          MySpaces.hSpace10,
          _buildDetails(),
        ],
      ),
    );
  }

  Widget _buildDetails() {
    return Row(
      children: [
        _buildImage(),
        MySpaces.wSpace10,
        Expanded(
          child: _buildPropertyInfo(),
        ),
      ],
    );
  }

  Widget _buildImage() {
    return Container(
      width: 90,
      height: 90,
      decoration: ShapeDecoration(
        image: DecorationImage(
          image: MemoryImage(base64Decode(imageUrl)),
          fit: BoxFit.fitHeight,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(borderRad10),
        ),
      ),
    );
  }

  Widget _buildPropertyInfo() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          propertyName,
          style: MyTextStyles.bodySmallMediumBlack,
        ),
        MySpaces.hSpace10,
        Text(
          bookingDates,
          style: MyTextStyles.bodySmallNormalBlack,
        ),
        MySpaces.hSpace10,
        _buildPriceAndStatus(),
      ],
    );
  }

  Widget _buildPriceAndStatus() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(customCurrencyFormat(double.parse(price), 0),
            style: MyTextStyles.bodySmallMediumBlack),
        CustomElevatedButton(
          backgroundColor: switch (status.toLowerCase()) {
            'active' => MyColors.success,
            String() => MyColors.orange,
          },
          onPressed: onStatusPressed,
          text: '',
          outlined: status == 'Cancelled' ? true : false,
          height: 25,
          child: Text(
            status,
            style: MyTextStyles.bodySmallMediumBlack.apply(
              color: switch (status.toLowerCase()) {
                'cancelled' => MyColors.orange,
                String() => MyColors.white,
              },
            ),
          ),
        )
      ],
    );
  }
}

//Shimmer

class BookedPropertyCardShimmer extends StatelessWidget {
  const BookedPropertyCardShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomAppContainer(
      height: 160,
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _shimmerBox(width: 170, height: 16), // Placeholder for Booking Id
          const SizedBox(height: 10),
          _buildDetailsShimmer(),
        ],
      ),
    );
  }

  Widget _buildDetailsShimmer() {
    return Row(
      children: [
        _shimmerBox(
            width: 90, height: 90, borderRadius: 10), // Image Placeholder
        const SizedBox(width: 10),
        Expanded(
          child: _buildPropertyInfoShimmer(),
        ),
      ],
    );
  }

  Widget _buildPropertyInfoShimmer() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _shimmerBox(width: double.infinity, height: 16), // Property Name
        const SizedBox(height: 10),
        _shimmerBox(width: 120, height: 16), // Booking Dates
        const SizedBox(height: 10),
        _buildPriceAndStatusShimmer(),
      ],
    );
  }

  Widget _buildPriceAndStatusShimmer() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _shimmerBox(width: 60, height: 16), // Price Placeholder
        _shimmerBox(
            width: 80,
            height: 25,
            borderRadius: 5), // Status Button Placeholder
      ],
    );
  }

  Widget _shimmerBox(
      {required double width,
      required double height,
      double borderRadius = 0}) {
    return Shimmer.fromColors(
      baseColor: Colors.grey.shade300,
      highlightColor: Colors.grey.shade100,
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          color: Colors.grey.shade300,
          borderRadius: BorderRadius.circular(borderRadius),
        ),
      ),
    );
  }

  Widget _shimmerCircle(double size) {
    return Shimmer.fromColors(
      baseColor: Colors.grey.shade300,
      highlightColor: Colors.grey.shade100,
      child: Container(
        width: size,
        height: size,
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.grey,
        ),
      ),
    );
  }
}
