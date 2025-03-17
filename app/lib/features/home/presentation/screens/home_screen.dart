import 'package:app/features/home/models/destination.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({required this.navigationShell, super.key});

  final StatefulNavigationShell navigationShell;
  @override
  Widget build(BuildContext context) => Scaffold(
    body: navigationShell,
    bottomNavigationBar: NavigationBar(
      selectedIndex: navigationShell.currentIndex,
      onDestinationSelected: navigationShell.goBranch,
      destinations:
          destinations
              .map(
                (destination) => NavigationDestination(
                  icon: destination.icon,
                  label: destination.label,
                  selectedIcon: destination.selectedIcon,
                ),
              )
              .toList(),
    ),
  );
}
