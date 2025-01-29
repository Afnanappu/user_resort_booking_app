import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:user_resort_booking_app/core/utils/custom_date_formats.dart';
import 'package:user_resort_booking_app/core/utils/screen_size.dart';

class PaymentHistoryCard extends StatelessWidget {
  final String userName;
  final String? profile;
  final double amount;
  final String transactionDate;
  final String status;

  PaymentHistoryCard({
    super.key,
    required this.userName,
    required this.profile,
    required this.amount,
    required this.transactionDate,
    required this.status,
  });

  final profileSize = MyScreenSize.width * 0.14;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 5, horizontal: 12),
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withValues(alpha: 0.1),
            blurRadius: 8,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        children: [
          // Avatar with the first letter of the user's name
          Container(
            width: profileSize,
            height: profileSize,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Color(0xFFFB6E34),
                  Color(0xFFFBAE34),
                ],
              ),
              borderRadius: BorderRadius.circular(25),
              image: profile == null
                  ? null
                  : DecorationImage(
                      image: MemoryImage(
                        base64Decode(profile!),
                      ),
                    ),
            ),
            child: Center(
              child: Text(
                userName[0].toUpperCase(),
                semanticsLabel: 'Transaction by $userName on $transactionDate',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          SizedBox(width: 16),
          // Column with the user's name, amount, and transaction date
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // User's name and transaction amount
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      userName,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Colors.black,
                      ),
                    ),
                    Text(
                      '${getTransactionPrefix(status)} ${customCurrencyFormat(amount)}',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: getStatusColor(status),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 8),
                // Transaction date
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      transactionDate,
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey[600],
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                      decoration: BoxDecoration(
                        color: getStatusBackgroundColor(status),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Text(
                        status.toUpperCase(),
                        style: TextStyle(
                          color: getStatusColor(status),
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  String getTransactionPrefix(String status) {
    if (status.toLowerCase() == 'credited') return '+';
    if (status.toLowerCase() == 'debited') return '-';
    return '';
  }

  Color getStatusColor(String status) {
    if (status.toLowerCase() == 'credited') return Colors.green;
    if (status.toLowerCase() == 'debited') return Colors.red;
    if (status.toLowerCase() == 'failed') return Colors.grey;
    return Colors.blue;
  }

  Color getStatusBackgroundColor(String status) {
    return getStatusColor(status).withValues(alpha: 0.1);
  }
}

class PaymentHistoryCardShimmer extends StatelessWidget {
  const PaymentHistoryCardShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 5, horizontal: 12),
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withValues(alpha: 0.1),
            blurRadius: 8,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        children: [
          // Shimmering Avatar
          Shimmer.fromColors(
            baseColor: Colors.grey[300]!,
            highlightColor: Colors.grey[100]!,
            child: Container(
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(25),
              ),
            ),
          ),
          SizedBox(width: 16),
          // Shimmering Text Columns
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Name and Amount shimmer
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Shimmer.fromColors(
                      baseColor: Colors.grey[300]!,
                      highlightColor: Colors.grey[100]!,
                      child: Container(
                        width: 120,
                        height: 16,
                        color: Colors.grey[300],
                      ),
                    ),
                    Shimmer.fromColors(
                      baseColor: Colors.grey[300]!,
                      highlightColor: Colors.grey[100]!,
                      child: Container(
                        width: 80,
                        height: 16,
                        color: Colors.grey[300],
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 8),
                // Transaction Date and Status shimmer
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Shimmer.fromColors(
                      baseColor: Colors.grey[300]!,
                      highlightColor: Colors.grey[100]!,
                      child: Container(
                        width: 100,
                        height: 14,
                        color: Colors.grey[300],
                      ),
                    ),
                    Shimmer.fromColors(
                      baseColor: Colors.grey[300]!,
                      highlightColor: Colors.grey[100]!,
                      child: Container(
                        width: 60,
                        height: 20,
                        decoration: BoxDecoration(
                          color: Colors.grey[300],
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
