import 'package:flutter/material.dart';
import 'package:user_resort_booking_app/core/constants/my_constants.dart';
import 'package:user_resort_booking_app/core/constants/text_styles.dart';
import 'my_colors.dart';

final ThemeData customTheme = ThemeData(
    // bottomNavigationBarTheme: BottomNavigationBarThemeData(
    //   elevation: 15,
    //   landscapeLayout: BottomNavigationBarLandscapeLayout.spread,
    //   showSelectedLabels: true,
    //   showUnselectedLabels: true,
    //   backgroundColor: MyColors.grey,
    //   selectedItemColor: MyColors.orange,
    //   selectedIconTheme: IconThemeData(color: MyColors.orange),
    // ),

    // Button Theme
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        iconColor: MyColors.white,
        backgroundColor: MyColors.orange, // Button background color
        foregroundColor: MyColors.white, // Button text color
        textStyle: MyTextStyles.bodyLargeNormalWhite, // Button text style
      ),
    ),
    indicatorColor: MyColors.orange,
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        foregroundColor: MyColors.orange, // Text color
        textStyle: MyTextStyles.bodyLargeNormalWhite,
      ),
    ),
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: MyColors.orange,
      foregroundColor: MyColors.white,
    ),
    dialogTheme: DialogTheme(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(borderRad10),
      ),
    ));
