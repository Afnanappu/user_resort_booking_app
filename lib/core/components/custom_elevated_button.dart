import 'package:flutter/material.dart';
import 'package:user_resort_booking_app/core/constants/my_colors.dart';
import 'package:user_resort_booking_app/core/constants/my_constants.dart';
import 'package:user_resort_booking_app/core/constants/text_styles.dart';

class CustomElevatedButton extends StatelessWidget {
  const CustomElevatedButton({
    super.key,
    required this.text,
    this.width,
    this.onPressed,
    this.backgroundColor,
    this.child,
    this.outlined = false,
    this.height,
    this.style,
    // this.horizontal,
  });
  final String text;
  final double? width;
  final double? height;
  final void Function()? onPressed;
  final Color? backgroundColor;
  final Widget? child;
  final bool outlined;
  final TextStyle? style;
  // final double? horizontal;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: ElevatedButton.icon(
        onPressed: onPressed,
        label: child == null
            ? Text(
                text,
                style: style ??
                    (outlined
                        ? MyTextStyles.titleMediumSemiBoldWhite
                            .copyWith(color: MyColors.orange)
                        : MyTextStyles.titleMediumSemiBoldWhite),
              )
            : child!,
        style: ElevatedButton.styleFrom(
          // padding:
          //     horizontal != null ? null : EdgeInsets.symmetric(horizontal: 50),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRad10),
            side: outlined
                ? BorderSide(
                    color: MyColors.orange,
                  )
                : BorderSide.none,
          ),
          backgroundColor:
              outlined ? MyColors.scaffoldDefaultColor : backgroundColor,
        ),
      ),
    );
  }
}
