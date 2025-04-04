import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Destination {
  const Destination({
    required this.label,
    required this.icon,
    required this.selectedIcon,
  });

  final String label;
  final Image icon;
  final Image selectedIcon;
}

final destinations = [
  Destination(
    label: 'Catatan Harian',
    icon: Image.asset('assets/icons/book_border.png', width: 40),
    selectedIcon: Image.asset('assets/icons/book_solid.png', width: 40),
  ),
  Destination(
    label: 'Resep',
    icon: Image.asset('assets/icons/chef_hat_border.png', width: 40),
    selectedIcon: Image.asset('assets/icons/chef_hat_solid.png', width: 40),
  ),
  Destination(
    label: 'Profil',
    icon: Image.asset('assets/icons/user_border.png', width: 40),
    selectedIcon: Image.asset('assets/icons/user_solid.png', width: 40),
  ),
];
