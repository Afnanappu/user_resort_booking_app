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

//enum for bookings
enum BookingStatus { booked, active, cancelled, completed }

class BookedPropertyCard extends StatelessWidget {
  final String bookingId;
  final String propertyName;
  final String bookingDates;
  final String price;
  final String imageUrl;
  final BookingStatus status;
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
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Booking Id: $bookingId',
              style: MyTextStyles.bodyLargeBoldBlack),
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
        Expanded(child: _buildPropertyInfo()),
      ],
    );
  }

  Widget _buildImage() {
    try {
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
    } catch (_) {
      return Icon(Icons.image, size: 90); // Fallback icon
    }
  }

  Widget _buildPropertyInfo() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(propertyName, style: MyTextStyles.bodySmallMediumBlack),
        MySpaces.hSpace10,
        Text(bookingDates, style: MyTextStyles.bodySmallNormalBlack),
        MySpaces.hSpace10,
        _buildPriceAndStatus(),
      ],
    );
  }

  Widget _buildPriceAndStatus() {
    String formattedPrice;
    try {
      formattedPrice = customCurrencyFormat(double.parse(price), 0);
    } catch (_) {
      formattedPrice = 'N/A';
    }

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(formattedPrice, style: MyTextStyles.bodySmallMediumBlack),
        CustomElevatedButton(
          text: '',
          outlined: status == BookingStatus.cancelled ? true : false,
          backgroundColor: _statusColor(status),
          onPressed: onStatusPressed ?? () {},
          height: 25,
          child: Text(
            status.name, // Enum name
            style: MyTextStyles.bodySmallMediumBlack.apply(
              color: _statusTextColor(status),
            ),
          ),
        ),
      ],
    );
  }

  Color _statusColor(BookingStatus status) {
    switch (status) {
      case BookingStatus.booked:
        return MyColors.orange; // Light Orange
      case BookingStatus.active:
        return MyColors.success; // Deep Orange
      case BookingStatus.cancelled:
        return MyColors.orange; // Dark Gray
      case BookingStatus.completed:
        return MyColors.grey; // Muted Orange
    }
  }

  Color _statusTextColor(BookingStatus status) {
    return status == BookingStatus.cancelled ? MyColors.orange : MyColors.white;
  }
}

BookingStatus getBookingStatus(String status) {
  switch (status.toLowerCase()) {
    case 'active':
      return BookingStatus.active;
    case 'cancelled':
      return BookingStatus.cancelled;
    case 'booked':
      return BookingStatus.booked;
    case 'completed':
      return BookingStatus.completed;
    default:
      throw FormatException(
          'status type is not valid, use active, cancelled, booked or completed');
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

  // Widget _shimmerCircle(double size) {
  //   return Shimmer.fromColors(
  //     baseColor: Colors.grey.shade300,
  //     highlightColor: Colors.grey.shade100,
  //     child: Container(
  //       width: size,
  //       height: size,
  //       decoration: const BoxDecoration(
  //         shape: BoxShape.circle,
  //         color: Colors.grey,
  //       ),
  //     ),
  //   );
  // }
}
