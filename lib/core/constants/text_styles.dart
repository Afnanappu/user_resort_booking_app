import 'package:flutter/material.dart';
import 'package:user_resort_booking_app/core/constants/my_colors.dart';

class MyTextStyles {
  static final bodyLargeNormalWhite = TextStyle(
    color: MyColors.white,
    fontSize: 16,
    fontWeight: FontWeight.w400,
  );

  static final bodyLargeMediumBlack = TextStyle(
    color: MyColors.black,
    fontSize: 16,
    fontWeight: FontWeight.w500,
  );
  static final bodyLargeBoldBlack = TextStyle(
    color: MyColors.black,
    fontSize: 16,
    fontWeight: FontWeight.bold,
  );
  static final bodyLargeNormalGrey = TextStyle(
    color: MyColors.grey,
    fontSize: 15,
    fontWeight: FontWeight.normal,
  );
  static final bodyExtraLargeBoldBlack = TextStyle(
    color: MyColors.black,
    fontSize: 17,
    fontWeight: FontWeight.bold,
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
  static final titleMediumSemiBoldBlack = TextStyle(
    color: MyColors.black,
    fontSize: 18,
    fontWeight: FontWeight.w600,
  );
  static final titleMediumSemiBoldWhite = TextStyle(
    color: MyColors.white,
    fontSize: 18,
    fontWeight: FontWeight.w600,
  );
  static final titleSmallSemiBoldBlack = TextStyle(
    color: MyColors.black,
    fontSize: 16,
    fontWeight: FontWeight.w600,
  );
  static final bodySmallMediumGreyLight = TextStyle(
    fontWeight: FontWeight.w500,
    fontSize: 14,
    color: MyColors.greyLight,
  );
  static final bodySmallMediumGrey = TextStyle(
    fontWeight: FontWeight.w500,
    fontSize: 14,
    color: MyColors.grey,
  );
  static final bodySmallMediumBlack = TextStyle(
    fontWeight: FontWeight.w600,
    fontSize: 14,
    color: MyColors.black,
  );
  static final bodySmallNormalBlack = TextStyle(
    fontWeight: FontWeight.w400,
    fontSize: 14,
    color: MyColors.black,
  );
  static final bodySmallMediumBlue = TextStyle(
    fontWeight: FontWeight.w600,
    fontSize: 14,
    color: MyColors.blue,
  );
  static final textFieldNormalGreyLight = TextStyle(
    color: MyColors.grey,
    fontWeight: FontWeight.w300,
    fontSize: 13,
  );
  static final textFieldMediumGreyLight = TextStyle(
    color: MyColors.grey,
    fontWeight: FontWeight.w400,
    fontSize: 13,
  );

  //=======================

  static const TextStyle nameStyle = TextStyle(
    fontSize: 22,
    fontWeight: FontWeight.bold,
    color: MyColors.black,
  );

  static const TextStyle locationStyle = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w400,
    color: MyColors.grey,
  );

  static const TextStyle typeStyle = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w500,
    color: MyColors.grey,
  );

  static const TextStyle ratingStyle = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w600,
    color: MyColors.black, // Or a color matching your theme
  );
}
