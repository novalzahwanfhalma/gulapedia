import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:app/features/dashboard/bloc/navigation_bloc.dart';
import 'package:app/features/dashboard/bloc/navigation_state.dart';
import 'package:app/features/dashboard/bloc/navigation_event.dart';
import 'package:app/features/dashboard/presentation/catatan-harian/screens/catatan-harian_screen.dart';
import 'package:app/features/dashboard/presentation/profil/screens/profil_screen.dart';
import 'package:app/features/dashboard/presentation/resep/screens/resep_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<NavigationBloc, NavigationState>(
        builder: (context, state) {
          switch (state.tabIndex) {
            case 0:
              return CatatanHarianScreen();
            case 1:
              return ResepScreen();
            case 2:
              return ProfilScreen();
            default:
              return CatatanHarianScreen();
          }
        },
      ),
      bottomNavigationBar: BlocBuilder<NavigationBloc, NavigationState>(
        builder: (context, state) {
          return BottomNavigationBar(
            currentIndex: state.tabIndex,
            onTap: (index) {
              // Dispatch a TabChangeEvent to update the selected tab
              context.read<NavigationBloc>().add(TabChangeEvent(index));
            },
            items: [
              BottomNavigationBarItem(
                icon:
                    state.tabIndex == 0
                        ? Image.asset(
                          height: 28,
                          'assets/images/fluent_book-24-filled.png',
                        )
                        : Image.asset(
                          height: 28,
                          'assets/images/fluent_book-24-regular.png',
                        ),
                label: 'Catatan Harian',
              ),
              BottomNavigationBarItem(
                icon:
                    state.tabIndex == 1
                        ? Image.asset(
                          height: 28,
                          'assets/images/solar_chef-hat-filled.png',
                        )
                        : Image.asset(
                          height: 28,
                          'assets/images/solar_chef-hat-regular.png',
                        ),
                label: 'Resep',
              ),
              BottomNavigationBarItem(
                icon:
                    state.tabIndex == 2
                        ? Image.asset(
                          height: 28,
                          'assets/images/user-filled.png',
                        )
                        : Image.asset(
                          height: 28,
                          'assets/images/user-regular.png',
                        ),
                label: 'Profil',
              ),
            ],
          );
        },
      ),
    );
  }
}
