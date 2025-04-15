import 'package:app/features/home/presentation/screens/home_layout.dart';
import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';

import 'package:app/features/home/presentation/screens/catatan_harian/catatan_harian_screen.dart';
import 'package:app/features/home/presentation/screens/profil/profil_screen.dart';
import 'package:app/features/home/presentation/screens/resep/resep_screen.dart';

final _routeNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'root');

final router = GoRouter(
  navigatorKey: _routeNavigatorKey,
  initialLocation: '/catatan-harian',
  routes: [

    // Home (Bottom Navigation Routes)
    StatefulShellRoute.indexedStack(
      builder:
          (context, state, navigationShell) =>
              HomeLayout(navigationShell: navigationShell),
      branches: [
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: '/catatan-harian', // 
              builder: (context, state) => const CatatanHarianScreen(),
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: '/resep', // 🔹 Ubah path ke relatif
              builder: (context, state) => const ResepScreen(),
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: '/profile', // 🔹 Ubah path ke relatif & perbaiki typo
              builder: (context, state) => const ProfilScreen(),
            ),
          ],
        ),
      ],
    ),
  ],
);
