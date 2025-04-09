import 'package:app/features/home/presentation/screens/home_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';

import 'package:app/features/home/presentation/screens/catatan_harian/catatan_harian_screen.dart';
import 'package:app/features/home/presentation/screens/profil/profil_screen.dart';
import 'package:app/features/home/presentation/screens/resep/resep_screen.dart';
import 'package:app/features/home/presentation/screens/profil/pengaturan_akun_screen.dart';
import 'package:app/features/home/presentation/screens/profil/edit_akun_screen.dart';

final _routeNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'root');

final router = GoRouter(
  navigatorKey: _routeNavigatorKey,
  initialLocation: '/catatan-harian',
  routes: [
    StatefulShellRoute.indexedStack(
      builder:
          (context, state, navigationShell) =>
              HomeScreen(navigationShell: navigationShell),
      branches: [
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: '/catatan-harian', // 🔹 Ubah path ke relatif
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
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: '/pengaturan-akun',
              name:
                  'pengaturan-akun', // 🔹 Ubah path ke relatif & perbaiki typo
              builder: (context, state) => const PengaturanAkunScreen(),
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: '/edit-akun',
              name: 'edit-akun', // 🔹 Ubah path ke relatif & perbaiki typo
              builder: (context, state) => const EditAkunScreen(),
            ),
          ],
        ),
      ],
    ),
  ],
);
