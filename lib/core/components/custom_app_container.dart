import 'package:flutter/material.dart';
import 'package:user_resort_booking_app/core/constants/my_colors.dart';
import 'package:user_resort_booking_app/core/constants/my_constants.dart';
class CustomAppContainer extends StatelessWidget {
  const CustomAppContainer({
    super.key,
    this.height,
    this.width,
    required this.child,
    this.thickness = .5,
    this.boxShadow,
    this.bgColor,
    this.padding,
    this.margin,
    this.hasBorder = true,
  });
  final double? height;
  final double? width;
  final bool hasBorder;
  final double thickness;
  final Widget child;
  final Color? bgColor;

  ///Empty space to inscribe inside the [decoration]. The [child], if any, is placed inside this padding.
  final EdgeInsetsGeometry? padding;

  ///Empty space to surround the [decoration] and [child].
  final EdgeInsetsGeometry? margin;
  final List<BoxShadow>? boxShadow;
  
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding,
      margin: margin,
      height: height,
      width: width,
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(borderRad10),
        border: hasBorder
            ? Border.all(
                color: MyColors.greyLight,
                width: thickness,
              )
            : null,
        boxShadow: boxShadow,
      ),
      child: child,
    );
  }
}
