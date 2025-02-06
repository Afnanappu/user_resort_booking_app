import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:user_resort_booking_app/core/components/custom_alert_dialog.dart';
import 'package:user_resort_booking_app/core/utils/user_auth_state.dart';
import 'package:user_resort_booking_app/feature/profile/view/components/list_tile_for_profile.dart';
import 'package:user_resort_booking_app/feature/profile/view/widgets/app_bar_for_profile.dart';
import 'package:user_resort_booking_app/routes/route_names.dart';

class ScreenProfile extends StatelessWidget {
  const ScreenProfile({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          AppBarForProfile(),

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
                  icon: Icons.report_gmailerrorred_outlined,
                  title: 'Report',
                  onTap: () {
                    context.push('/${AppRoutes.reportIssue}');
                  },
                ),
                ListTileForProfile(
                  icon: Icons.support_agent_outlined,
                  title: 'Support',
                  onTap: () {
                    //TODO: support
                  },
                ),
                ListTileForProfile(
                  icon: Icons.info_outline,
                  title: 'About',
                  onTap: () {
                    context.push('/${AppRoutes.about}');
                  },
                ),
                ListTileForProfile(
                  icon: Icons.logout_outlined,
                  title: 'Logout',
                  onTap: () {
                    customAlertDialog(
                      context: context,
                      title: 'Logout',
                      content: 'Do you want to logout from our app?',
                      firstText: 'No',
                      firstOnPressed: () {
                        context.pop();
                      },
                      secondText: 'Yes',
                      secondOnPressed: () async {
                        await logoutFromApp(context);
                      },
                    );
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

var llk = """
**Privacy Policy**

Effective Date: [Insert Date]

**1. Introduction**
Welcome to StayScape ("we," "our," or "us"). Your privacy is important to us, and this Privacy Policy explains how we collect, use, disclose, and protect your personal information when you use our resort booking application ("App").

**2. Information We Collect**
We collect the following types of information:
- **Personal Information**: Name, email address, phone number, payment details, and any other information you provide during the booking process.
- **Usage Data**: Information about how you use our App, including interactions, preferences, and device details.
- **Location Data**: With your consent, we may collect location information to provide location-based services.

**3. How We Use Your Information**
We use your information for the following purposes:
- To process and manage resort bookings.
- To improve user experience and provide personalized services.
- To send booking confirmations, updates, and customer support responses.
- To ensure security, prevent fraud, and comply with legal obligations.

**4. How We Protect Your Information**
We implement authentication measures to protect your information from unauthorized access, alteration, or loss. However, no method of transmission over the internet is 100% secure, and we cannot guarantee absolute security.

**5. Your Rights and Choices**
You have the right to:
- Access and update your personal information, including your profile, phone number, and name.
- Opt-out of promotional communications.

**6. Third-Party Links**
Our App does not use cookies or tracking technologies. However, it may contain links to third-party websites or services. We are not responsible for their privacy practices, and we encourage you to review their privacy policies.

**7. Compliance with Regulations**
We follow standard privacy practices to protect user data. If additional regulatory compliance is required, we will update our policies accordingly.

**8. Changes to This Privacy Policy**
We may update this Privacy Policy from time to time. We will notify you of significant changes through the App or other communication methods.

**9. Contact Us**
If you have any questions about this Privacy Policy, please contact us at:
Email: [Your Contact Email]

By using our App, you agree to the terms of this Privacy Policy.


""";