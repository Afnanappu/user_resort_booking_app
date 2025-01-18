// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';

class BookingModel {
  String? bookingId;
  final String userId;
  final String userName;
  final String propertyId;
  final DateTime startDate;
  final DateTime endDate;
  final String status;
  String? paymentMethod;
  final double totalPrice;
  final List<String> bookedRoomsId;
  final DateTime createdAt;
  final DateTime updatedAt;
  BookingModel({
    this.bookingId,
    required this.userId,
    required this.userName,
    required this.propertyId,
    required this.startDate,
    required this.endDate,
    this.status = 'pending',
    this.paymentMethod,
    required this.totalPrice,
    required this.bookedRoomsId,
    required this.createdAt,
    required this.updatedAt,
  });

  BookingModel copyWith({
    String? bookingId,
    String? userId,
    String? userName,
    String? propertyId,
    DateTime? startDate,
    DateTime? endDate,
    String? status,
    String? paymentMethod,
    double? totalPrice,
    List<String>? bookedRoomsId,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return BookingModel(
      bookingId: bookingId ?? this.bookingId,
      userId: userId ?? this.userId,
      userName: userName ?? this.userName,
      propertyId: propertyId ?? this.propertyId,
      startDate: startDate ?? this.startDate,
      endDate: endDate ?? this.endDate,
      status: status ?? this.status,
      paymentMethod: paymentMethod ?? this.paymentMethod,
      totalPrice: totalPrice ?? this.totalPrice,
      bookedRoomsId: bookedRoomsId ?? this.bookedRoomsId,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'bookingId': bookingId,
      'userId': userId,
      'userName': userName,
      'propertyId': propertyId,
      'startDate': Timestamp.fromDate(startDate),
      'endDate': Timestamp.fromDate(endDate),
      'status': status,
      'paymentMethod': paymentMethod,
      'totalPrice': totalPrice,
      'bookedRoomsId': bookedRoomsId,
      'createdAt': Timestamp.fromDate(createdAt),
      'updatedAt': Timestamp.fromDate(updatedAt),
    };
  }

  factory BookingModel.fromMap(Map<String, dynamic> map) {
    return BookingModel(
      bookingId: map['bookingId'] != null ? map['bookingId'] as String : null,
      userId: map['userId'] as String,
      userName: map['userName'] as String,
      propertyId: map['propertyId'] as String,
      startDate: (map['startDate'] as Timestamp).toDate(),
      endDate: (map['endDate'] as Timestamp).toDate(),
      status: map['status'] as String,
      paymentMethod:
          map['paymentMethod'] != null ? map['paymentMethod'] as String : null,
      totalPrice: map['totalPrice'] as double,
      bookedRoomsId: List<String>.from((map['bookedRoomsId'] as List<dynamic>)),
      createdAt: (map['createdAt'] as Timestamp).toDate(),
      updatedAt: (map['updatedAt'] as Timestamp).toDate(),
    );
  }

  String toJson() => json.encode(toMap());

  factory BookingModel.fromJson(String source) =>
      BookingModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'BookingModel(bookingId: $bookingId, userId: $userId, userName: $userName, propertyId: $propertyId, startDate: $startDate, endDate: $endDate, status: $status, paymentMethod: $paymentMethod, totalPrice: $totalPrice, bookedRoomsId: $bookedRoomsId, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(covariant BookingModel other) {
    if (identical(this, other)) return true;

    return other.bookingId == bookingId &&
        other.userId == userId &&
        other.userName == userName &&
        other.propertyId == propertyId &&
        other.startDate == startDate &&
        other.endDate == endDate &&
        other.status == status &&
        other.paymentMethod == paymentMethod &&
        other.totalPrice == totalPrice &&
        listEquals(other.bookedRoomsId, bookedRoomsId) &&
        other.createdAt == createdAt &&
        other.updatedAt == updatedAt;
  }

  @override
  int get hashCode {
    return bookingId.hashCode ^
        userId.hashCode ^
        userName.hashCode ^
        propertyId.hashCode ^
        startDate.hashCode ^
        endDate.hashCode ^
        status.hashCode ^
        paymentMethod.hashCode ^
        totalPrice.hashCode ^
        bookedRoomsId.hashCode ^
        createdAt.hashCode ^
        updatedAt.hashCode;
  }
}



  // Map<String, dynamic> toMap() {
  //   return <String, dynamic>{
  //     'bookingId': bookingId,
  //     'userId': userId,
  //     'userName': userName,
  //     'propertyId': propertyId,
  //     'startDate': Timestamp.fromDate(startDate),
  //     'endDate': Timestamp.fromDate(endDate),
  //     'status': status,
  //     'paymentMethod': paymentMethod,
  //     'totalPrice': totalPrice,
  //     'bookedRoomsId': bookedRoomsId,
  //     'createdAt': Timestamp.fromDate(createdAt),
  //     'updatedAt': Timestamp.fromDate(updatedAt),
  //   };
  // }

  // factory BookingModel.fromMap(Map<String, dynamic> map) {
  //   return BookingModel(
  //     bookingId: map['bookingId'] as String,
  //     userId: map['userId'] as String,
  //     userName: map['userName'] as String,
  //     propertyId: map['propertyId'] as String,
  //     startDate: (map['startDate'] as Timestamp).toDate(),
  //     endDate: (map['endDate'] as Timestamp).toDate(),
  //     status: map['status'] as String,
  //     paymentMethod: map['paymentMethod'] as String,
  //     totalPrice: map['totalPrice'] as double,
  //     bookedRoomsId: List<String>.from((map['bookedRoomsId'] as List<String>)),
  //     createdAt: (map['createdAt'] as Timestamp).toDate(),
  //     updatedAt: (map['updatedAt'] as Timestamp).toDate(),
  //   );
  // }