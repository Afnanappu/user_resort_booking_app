double calculateRefundAmount({
  required DateTime checkInTime,
  required DateTime cancellationTime,
  required DateTime bookingTime, // Add booking time
  required double totalAmount,
}) {
  final differenceFromBooking =
      cancellationTime.difference(bookingTime).inHours;
  final differenceFromCheckIn =
      checkInTime.difference(cancellationTime).inHours;

  double refundPercentage = 1.0;

  // Grace Period: Full refund within 2 hours of booking
  if (differenceFromBooking <= 2) {
    refundPercentage = 1.0; // 100%
  }
  // Check standard cancellation rules
  else if (differenceFromCheckIn > 72) {
    refundPercentage = 1.0; // 100%
  } else if (differenceFromCheckIn > 24) {
    refundPercentage = 0.7; // 70%
  } else {
    refundPercentage = 0.0; // No refund
  }
  
  return totalAmount * refundPercentage;
}
