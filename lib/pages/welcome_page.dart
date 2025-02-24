import 'package:e_commerce_apps/components/bottom_nav_bar.dart';
import 'package:e_commerce_apps/pages/cart_page.dart';
import 'package:e_commerce_apps/pages/home_page.dart';
import 'package:e_commerce_apps/pages/profile_page.dart';
import 'package:flutter/material.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({super.key});

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  int _selectedIndex = 0;

  void _navigationBottomBar(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  final List<Widget> _pages = [
    const HomePage(),
    const CartPage(),
    const ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300]!,
      bottomNavigationBar: BottomNavBar(
        onTabChanged: (index) => _navigationBottomBar(index),
      ),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        //elevation: 0,
        leading: Builder(
          builder: (context) {
            return IconButton(
              icon: const Icon(Icons.menu, color: Colors.black),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
            );
          },
        ),
      ),
      drawer: Drawer(
        backgroundColor: Colors.grey[900],
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.zero,
          side: BorderSide.none,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          // crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              children: [
                UserAccountsDrawerHeader(
                  accountName: const Text('John Doe'),
                  accountEmail: const Text('john.doe@example.com'),
                  currentAccountPicture: const CircleAvatar(
                    backgroundImage: AssetImage('lib/images/profile.webp'),
                  ),
                  decoration: BoxDecoration(color: Colors.blueGrey),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 25.0),
                  child: ListTile(
                    title: const Text(
                      'Home',
                      style: TextStyle(color: Colors.white),
                    ),
                    leading: const Icon(Icons.home),
                    iconColor: Colors.white,
                    onTap: () {},
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 25.0),
                  child: ListTile(
                    title: const Text(
                      'Cart',
                      style: TextStyle(color: Colors.white),
                    ),
                    leading: const Icon(Icons.shopping_cart),
                    iconColor: Colors.white,
                    onTap: () {},
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 25.0),
                  child: ListTile(
                    title: const Text(
                      'Profile',
                      style: TextStyle(color: Colors.white),
                    ),
                    leading: const Icon(Icons.person),
                    iconColor: Colors.white,
                    onTap: () {},
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(25.0),
              child: ListTile(
                title: const Text(
                  'Logout',
                  style: TextStyle(color: Colors.white),
                ),
                leading: const Icon(Icons.logout),
                iconColor: Colors.white,
                onTap: () {},
              ),
            ),
          ],
        ),
      ),
      //body: _pages[_selectedIndex],
      body: IndexedStack(index: _selectedIndex, children: _pages),
    );
  }
}
