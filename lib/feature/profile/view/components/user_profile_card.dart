import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:user_resort_booking_app/core/data/models/user_model.dart';
import 'package:user_resort_booking_app/core/data/view_model/cubit/user_data_cubit.dart';
import 'package:user_resort_booking_app/core/utils/screen_size.dart';

class UserProfileCard extends StatelessWidget {
  // final String name;
  // final String email;
  // final String? phone; // Optional phone number
  // final String? profileImageUrl;
  // final VoidCallback onEdit;

  UserProfileCard({
    super.key,
  });

  final profileSize = MyScreenSize.width * 0.2;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 140,
      margin: const EdgeInsets.all(16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withValues(alpha: 0.2),
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Stack(
        children: [
          BlocBuilder<UserDataCubit, UserModel?>(
            builder: (context, user) {
                final String name = user!.name;
              final String email= user.email;
              final String? phone = user.phone; // Optional phone number
              final String? profileImageUrl = user.profilePicture;
              
              return Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
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
                      borderRadius: BorderRadius.circular(50),
                      image: profileImageUrl == null
                          ? null
                          : DecorationImage(
                              image: NetworkImage(profileImageUrl)),
                    ),
                    child: Center(
                      child: Text(
                        name[0].toUpperCase(),
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 26,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  // Profile Image
                  // CircleAvatar(
                  //   radius: 40,
                  //   backgroundImage:,
                  //   backgroundColor: Colors.grey.shade200,

                  //   child: Center(
                  //     child: Text(
                  //       name[0].toUpperCase(),
                  //       style: TextStyle(
                  //         color: Colors.white,
                  //         fontSize: 22,
                  //         fontWeight: FontWeight.bold,
                  //       ),
                  //     ),
                  //   ),
                  // ),
                  const SizedBox(width: 16),
                  // User Details
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          name,
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        if (phone != null) ...[
                          const SizedBox(height: 4),
                          Text(
                            phone,
                            style: const TextStyle(
                                fontSize: 14, color: Colors.grey),
                          ),
                        ],
                        const SizedBox(height: 4),
                        Text(
                          email,
                          style:
                              const TextStyle(fontSize: 14, color: Colors.grey),
                        ),
                      ],
                    ),
                  ),
                ],
              );
            },
          ),
          // Edit Button
          Positioned(
            right: 0,
            top: 0,
            child: IconButton(
              onPressed: () {
                //TODO: add edit user function here
              },
              icon: const Icon(
                Icons.edit,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
