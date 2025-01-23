import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:user_resort_booking_app/core/constants/my_colors.dart';
import 'package:user_resort_booking_app/core/data/models/user_model.dart';
import 'package:user_resort_booking_app/core/data/view_model/cubit/user_data_cubit.dart';
import 'package:user_resort_booking_app/routes/route_names.dart';

class AppBarForHome extends StatelessWidget implements PreferredSizeWidget {
  const AppBarForHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 117,
      clipBehavior: Clip.antiAlias,
      decoration: ShapeDecoration(
        gradient: LinearGradient(
          begin: Alignment(0.00, 1.00),
          end: Alignment(0, -1),
          colors: [
            Color(0xFFFB6E34),
            Color(0xFFFFA332),
          ],
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(30),
            bottomRight: Radius.circular(30),
          ),
        ),
      ),
      child: Stack(
        children: [
          Positioned(
            left: 75.21,
            top: -389,
            child: Transform(
              transform: Matrix4.identity()
                ..translate(0.0, 0.0)
                ..rotateZ(0.19),
              child: Container(
                width: 426.03,
                height: 426.03,
                clipBehavior: Clip.antiAlias,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment(1.00, 0.00),
                    end: Alignment(-1, 0),
                    colors: [
                      Color(0xFFFB6E34),
                      Color(0xFFFFA332),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            left: 23,
            top: 65,
            child: Row(
              children: [
                BlocBuilder<UserDataCubit, UserModel?>(
                  builder: (context, user) {
                    return Text(
                      'Hello, ${user == null ? 'Sir' : user.name}',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w700,
                      ),
                    );
                  },
                ),
                SizedBox(
                  width: 160,
                ),
                IconButton.filled(
                  onPressed: () {
                    //TODO: add function to notification
                    context.push('/${AppRoutes.notification}');
                  },
                  color: MyColors.orange,
                  style: IconButton.styleFrom(backgroundColor: MyColors.white),
                  icon: Icon(Icons.notifications_active_outlined),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(117);
}
