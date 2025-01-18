import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:user_resort_booking_app/core/components/custom_divider.dart';
import 'package:user_resort_booking_app/core/constants/text_styles.dart';
import 'package:user_resort_booking_app/core/utils/screen_size.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({
    super.key,
    this.title = '',
    this.actions,
    this.needUnderline = true,
    this.needSystemOverlayStyle = true,
    this.hadLeading = true,
  });
  final String title;
  final List<Widget>? actions;
  final bool needUnderline;
  final bool needSystemOverlayStyle;
  final bool hadLeading;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AppBar(
          automaticallyImplyLeading: hadLeading,
          systemOverlayStyle: needSystemOverlayStyle
              ? SystemUiOverlayStyle(statusBarColor: Colors.black12)
              : null,
          centerTitle: true,
          title: Text(
            title,
            style: MyTextStyles.titleLargeSemiBoldBlack,
          ),
          actionsIconTheme: IconThemeData(size: 30),
          actions: actions,
        ),
        if (needUnderline) CustomDivider(horizontal: MyScreenSize.width * .08),
      ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight + 16);
}
