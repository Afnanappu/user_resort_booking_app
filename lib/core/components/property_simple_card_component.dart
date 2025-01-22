import 'dart:convert' show base64Decode;
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:user_resort_booking_app/core/components/custom_app_container.dart';
import 'package:user_resort_booking_app/core/data/models/location_model.dart';

class PropertySimpleCardComponent extends StatelessWidget {
  final String image;
  final String propertyName;
  final LocationModel location;
  final double rating;
  final List<String> reviews;
  final double price;
  final void Function()? onTap;
  final bool havePlaceholder;

  const PropertySimpleCardComponent({
    super.key,
    required this.image,
    required this.propertyName,
    required this.location,
    required this.rating,
    required this.reviews,
    required this.price,
    this.onTap,
    this.havePlaceholder = false,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Container(
          padding: const EdgeInsets.all(16.0),
          decoration: ShapeDecoration(
            shape: RoundedRectangleBorder(
              side: BorderSide(width: 0.2, color: Color(0xFF8A8989)),
              borderRadius: BorderRadius.circular(8.0),
            ),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Left Image Section
              Container(
                width: 105,
                height: 105,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.0),
                  border: Border.all(color: Color(0xFF8A8989), width: 0.2),
                  image: DecorationImage(
                    image: havePlaceholder
                        ? NetworkImage(image)
                        : MemoryImage(
                            base64Decode(image),
                          ),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(width: 16.0), // Space between image and text
              // Right Text Section
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      propertyName,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 8.0),
                    Row(
                      children: [
                        Icon(Icons.location_on,
                            size: 12, color: Color(0xFF8A8989)),
                        const SizedBox(width: 4.0),
                        Expanded(
                          child: Text(
                            location.address,
                            style: TextStyle(
                              color: Color(0xFF8A8989),
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                            ),
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8.0),
                    Row(
                      children: [
                        Icon(Icons.star, size: 12, color: Colors.amber),
                        const SizedBox(width: 4.0),
                        Text(
                          '$rating (${reviews.length} Reviews)',
                          style: TextStyle(
                            color: Color(0xFF8A8989),
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8.0),
                    Text.rich(
                      TextSpan(
                        children: [
                          TextSpan(
                            text: 'from ₹$price',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 13,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          TextSpan(
                            text: ' /night',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ),
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

//Shimmer

class PropertySimpleCardShimmer extends StatelessWidget {
  const PropertySimpleCardShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: CustomAppContainer(
        padding: const EdgeInsets.all(16.0),
        // decoration: ShapeDecoration(
        //   shape: RoundedRectangleBorder(
        //     side: BorderSide(width: 0.2, color: const Color(0xFF8A8989)),
        //     borderRadius: BorderRadius.circular(8.0),
        //   ),
        // ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Left Image Placeholder
            _shimmerBox(width: 105, height: 105, borderRadius: 8.0),
            const SizedBox(width: 16.0), // Space between image and text
            // Right Text Section Placeholders
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _shimmerBox(
                      width: double.infinity, height: 16), // Property Name
                  const SizedBox(height: 8.0),
                  Row(
                    children: [
                      _shimmerCircle(size: 12), // Location Icon
                      const SizedBox(width: 4.0),
                      Expanded(
                        child: _shimmerBox(
                            width: double.infinity,
                            height: 12), // Location Text
                      ),
                    ],
                  ),
                  const SizedBox(height: 8.0),
                  Row(
                    children: [
                      _shimmerCircle(size: 12), // Star Icon
                      const SizedBox(width: 4.0),
                      _shimmerBox(width: 120, height: 12), // Rating & Reviews
                    ],
                  ),
                  const SizedBox(height: 8.0),
                  _shimmerBox(width: 150, height: 16), // Price Text
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _shimmerBox({
    required double width,
    required double height,
    double borderRadius = 0,
  }) {
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

  Widget _shimmerCircle({required double size}) {
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
