import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:user_resort_booking_app/core/components/custom_snack_bar.dart';
import 'package:user_resort_booking_app/feature/profile/view/components/list_tile_for_profile.dart';
import 'package:user_resort_booking_app/feature/profile/view/components/user_profile_card.dart';
import 'package:user_resort_booking_app/routes/route_names.dart';

class ScreenProfile extends StatelessWidget {
  const ScreenProfile({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Container(
            width: double.infinity,
            height: 250,
            clipBehavior: Clip.antiAlias,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
                colors: [
                  const Color.fromARGB(255, 239, 130, 86),
                  const Color.fromARGB(255, 254, 193, 169),
                ],
              ),
            ),
            child: Stack(
              children: [
                Positioned(
                  child: Container(
                    width: 600,
                    height: 426.03,
                    transform: Matrix4.identity()
                      ..translate(0.0, 100.0)
                      ..rotateZ(.4),
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.bottomCenter,
                        end: Alignment.topCenter,
                        colors: [
                          const Color.fromARGB(255, 254, 193, 169),
                          const Color.fromARGB(255, 239, 130, 86),
                        ],
                      ),
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.center,
                  child: UserProfileCard(),
                ),
              ],
            ),
          ),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ListTileForProfile(
                  icon: Icons.favorite_outline,
                  title: 'Favorites',
                  onTap: () {
                    context.push("/${AppRoutes.favorite}");
                  },
                ),
                ListTileForProfile(
                  icon: Icons.payment_rounded,
                  title: 'Payment History',
                  onTap: () {
                    context.push("/${AppRoutes.paymentHistory}");
                  },
                ),
                ListTileForProfile(
                  icon: Icons.assessment_outlined,
                  title: 'Report',
                  onTap: () {},
                ),
                ListTileForProfile(
                  icon: Icons.settings_outlined,
                  title: 'Settings',
                  onTap: () {
                    context.push('/${AppRoutes.settings}');
                  },
                ),
                ListTileForProfile(
                  icon: Icons.support_agent_outlined,
                  title: 'Support',
                  onTap: () {},
                ),
                ListTileForProfile(
                  icon: Icons.info_outline,
                  title: 'About',
                  onTap: () {
                    context.push('/${AppRoutes.about}');
                  },
                ),
              ],
            ),
          )

          // ElevatedButton(
          //   onPressed: () async {
          //     await FirebaseAuth.instance.signOut();
          //     if (await GoogleSignIn().isSignedIn()) {
          //       GoogleSignIn().signOut();
          //     }
          //     if (context.mounted) {
          //       context.go("/${AppRoutes.login}");
          //     }
          //   },
          //   child: Text('Profile Screen'),
          // ),
          // ElevatedButton(
          //   onPressed: () {
          //     context.push("/${AppRoutes.paymentHistory}");
          //   },
          //   child: Text('Payment history screen'),
          // ),
          // ElevatedButton(
          //   onPressed: () {
          //     context.push("/${AppRoutes.favorite}");
          //   },
          //   child: Text('Favorite screen'),
          // ),
        ],
      ),
    );
  }
}
