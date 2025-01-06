import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:user_resort_booking_app/core/constants/my_colors.dart';

class ScreenNavigation extends StatelessWidget {
  const ScreenNavigation({super.key, required this.navigationShell});
  final StatefulNavigationShell navigationShell;

  final double navIconSize = 22;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: navigationShell,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: navigationShell.currentIndex,
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home_filled,
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              'assets/icons/person.png',
              height: navIconSize,
            ),
            label: 'Profile',
          ),
        ],
        elevation: 15,
        iconSize: navIconSize,
        landscapeLayout: BottomNavigationBarLandscapeLayout.spread,
        showSelectedLabels: true,
        showUnselectedLabels: true,
        onTap: _onTap,
        fixedColor: MyColors.orange,
      ),
    );
  }

  void _onTap(int index) {
    navigationShell.goBranch(
      index,
      initialLocation: index == navigationShell.currentIndex,
    );
  }
}
