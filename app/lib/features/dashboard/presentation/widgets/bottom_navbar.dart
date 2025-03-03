import 'package:flutter/material.dart';

class BottomNavbar extends StatelessWidget {
  const BottomNavbar({super.key});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Catatan Harian',
        ),
        BottomNavigationBarItem(
          icon: Image.asset(
            'assets/images/fluent_book-24-regular.png',
            height: 24,
          ),
          label: 'Catatan Harian',
        ),
        BottomNavigationBarItem(
          icon: Image.asset(
            'assets/images/solar_chef-hat-regular.png',
            height: 24,
          ),
          label: 'Resep',
        ),
        BottomNavigationBarItem(
          icon: Image.asset('assets/images/user-regular.png', height: 24),
          label: 'Profil',
        ),
      ],
    );
  }
}
