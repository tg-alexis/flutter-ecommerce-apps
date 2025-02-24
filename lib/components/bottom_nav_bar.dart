import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class BottomNavBar extends StatelessWidget {
  final void Function(int)? onTabChanged;
  const BottomNavBar({super.key, required this.onTabChanged});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 25),
      child: GNav(
        color: Colors.grey[400],
        activeColor: Colors.grey.shade700,
        tabActiveBorder: Border.all(color: Colors.white),
        tabBackgroundColor: Colors.grey.shade100,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        tabBorderRadius: 12,
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
        onTabChange: (value) => onTabChanged!(value),
        tabs: [
          GButton(icon: Icons.home, text: 'Home'),
          GButton(icon: Icons.shopping_cart, text: 'Cart'),
          GButton(icon: Icons.person, text: 'Profile'),
        ],
      ),
    );
  }
}
