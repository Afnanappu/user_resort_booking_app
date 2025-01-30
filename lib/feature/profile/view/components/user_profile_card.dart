import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:user_resort_booking_app/core/components/custom_snack_bar.dart';
import 'package:user_resort_booking_app/core/components/custom_text_form_field.dart';
import 'package:user_resort_booking_app/core/constants/my_colors.dart';
import 'package:user_resort_booking_app/core/data/models/user_model.dart';
import 'package:user_resort_booking_app/core/data/view_model/cubit/user_data_cubit.dart';
import 'package:user_resort_booking_app/core/utils/app_file_picker.dart';
import 'package:user_resort_booking_app/core/utils/screen_size.dart';

class UserProfileCard extends StatelessWidget {
  UserProfileCard({
    super.key,
  });

  final profileSize = MyScreenSize.width * 0.2;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserDataCubit, UserModel?>(
      builder: (context, user) {
        final String name = user!.name;
        final String email = user.email;
        final String? phone = user.phone;
        final String? profileImageUrl = user.profilePicture;
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
              Row(
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
                              image: MemoryImage(
                                base64Decode(profileImageUrl),
                              ),
                              fit: BoxFit.cover),
                    ),
                    child: profileImageUrl != null
                        ? null
                        : Center(
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
              ),
              // Edit Button
              Positioned(
                right: 0,
                top: 0,
                child: IconButton(
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (context) => EditableUserDialog(
                        name: user.name,
                        // email: user.email,
                        phone: user.phone,
                        profilePicture: user.profilePicture,
                        onSave: (name, phone, profilePicture) async {
                          await context.read<UserDataCubit>().updateUserData(
                                UserModel(
                                  uid: user.uid,
                                  name: name,
                                  email: email,
                                  phone: phone,
                                  profilePicture: profilePicture,
                                  updatedAt: DateTime.now(),
                                ),
                              );
                          if (context.mounted) {
                            context.read<UserDataCubit>().fetchUserData().then(
                              (value) {
                                if (context.mounted) {
                                  showCustomSnackBar(
                                    context: context,
                                    message: 'User data updated',
                                    bgColor: MyColors.success,
                                  );
                                }
                              },
                            );
                          }
                          if (context.mounted) {
                            Navigator.pop(context);
                          }
                        },
                      ),
                    );
                  },
                  icon: const Icon(
                    Icons.edit,
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

class EditableUserDialog extends StatelessWidget {
  final String name;
  // final String email;
  final String? phone;
  final String? profilePicture;
  final Function(String name, String? phone, String? profilePicture) onSave;

  const EditableUserDialog({
    super.key,
    required this.name,
    // required this.email,
    this.phone,
    this.profilePicture,
    required this.onSave,
  });

  @override
  Widget build(BuildContext context) {
    final nameController = TextEditingController(text: name);
    // final emailController = TextEditingController(text: email);
    final phoneController = TextEditingController(text: phone ?? '');
    String? updatedProfilePicture = profilePicture;

    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Profile Picture
            StatefulBuilder(builder: (context, setState) {
              return GestureDetector(
                onTap: () async {
                  final pickedFile = await pickFileFromDevice();
                  setState(
                    () {
                      if (pickedFile != null) {
                        updatedProfilePicture = pickedFile.base64file;
                      }
                    },
                  );
                },
                child: CircleAvatar(
                  radius: 40,
                  backgroundColor: MyColors.scaffoldDefaultColor,
                  backgroundImage: updatedProfilePicture != null
                      ? MemoryImage(
                          base64Decode(
                            updatedProfilePicture!,
                          ),
                        )
                      : const AssetImage('assets/icons/person.png')
                          as ImageProvider,
                  child: updatedProfilePicture == null
                      ? const Icon(
                          Icons.camera_alt,
                          size: 20,
                          color: Colors.white,
                        )
                      : null,
                ),
              );
            }),
            const SizedBox(height: 10),

            CustomTextFormField(
              hintText: 'Full Name',
              controller: nameController,
              prefix: Icon(Icons.person),
            ),

            // Email Field
            // CustomTextFormField(
            //   hintText: 'Email',
            //   controller: emailController,
            //   prefix: Icon(Icons.email),
            // ),

            // Phone Field
            CustomTextFormField(
              hintText: 'Phone (Optional)',
              controller: phoneController,
              prefix: Icon(Icons.phone),
            ),

            const SizedBox(height: 15),

            // Buttons
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: const Text("Cancel"),
                ),
                const SizedBox(width: 10),
                ElevatedButton(
                  onPressed: () {
                    onSave(
                      nameController.text.trim(),
                      // emailController.text.trim(),
                      phoneController.text.trim().isEmpty
                          ? null
                          : phoneController.text.trim(),
                      updatedProfilePicture,
                    );
                  },
                  style: ElevatedButton.styleFrom(
                      backgroundColor: MyColors.orange),
                  child: const Text("Save"),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  // Widget _buildTextField({
  //   required TextEditingController controller,
  //   required String label,
  //   required IconData icon,
  // }) {
  //   return Padding(
  //     padding: const EdgeInsets.symmetric(vertical: 5),
  //     child: TextField(
  //       controller: controller,
  //       decoration: InputDecoration(
  //         contentPadding: EdgeInsets.all(15),
  //         hintText: label,
  //         prefixIcon: Icon(icon, color: Colors.orange),
  //         // border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
  //         filled: true,
  //         fillColor: Colors.grey.shade100,
  //       ),
  //     ),
  //   );
  // }
}
