import 'package:flutter/material.dart';
import 'package:user_resort_booking_app/core/constants/my_colors.dart';

class MyTextStyles {
  static final bodyLargeNormalWhite = TextStyle(
    color: MyColors.white,
    fontSize: 16,
    fontWeight: FontWeight.w400,
  );
  static final headlineSmallSemiBoldBlack = TextStyle(
    color: MyColors.black,
    fontSize: 26,
    fontWeight: FontWeight.w600,
  );
  static final titleLargeSemiBoldBlack = TextStyle(
    color: MyColors.black,
    fontSize: 20,
    fontWeight: FontWeight.w600,
  );
  static final bodySmallMediumGreyLight = TextStyle(
    fontWeight: FontWeight.w500,
    fontSize: 14,
    color: MyColors.greyLight,
  );
  static final textFieldNormalGreyLight = TextStyle(
      color: MyColors.grey, fontWeight: FontWeight.w300, fontSize: 13);
}
