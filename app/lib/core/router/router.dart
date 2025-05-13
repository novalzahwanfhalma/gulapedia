import 'package:app/features/home/presentation/screens/home_layout.dart';
import 'package:app/features/home/presentation/screens/load/loading_screen.dart';
import 'package:app/features/home/presentation/screens/resep/resep_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';

import 'package:app/features/home/presentation/screens/catatan_harian/catatan_harian_screen.dart';
import 'package:app/features/home/presentation/screens/profil/profil_screen.dart';
import 'package:app/features/home/presentation/screens/resep/detail_resep_screen.dart';
import 'package:app/features/home/presentation/screens/profil/pengaturan_akun_screen.dart';
import 'package:app/features/home/presentation/screens/profil/edit_akun_screen.dart';
import 'package:app/features/home/presentation/screens/profil/edit_sandi_screen.dart';
import 'package:app/features/home/presentation/screens/auth/sign_in_screen.dart';
import 'package:app/features/home/presentation/screens/auth/sign_up_screen.dart';
import 'package:app/features/home/presentation/screens/auth/kalku_sgr_screen.dart';
import 'package:app/features/home/presentation/screens/catatan_harian/nutrisi_screen.dart';
import 'package:app/features/home/presentation/screens/catatan_harian/detail_asupan_screen.dart';
import 'package:app/features/home/presentation/screens/catatan_harian/detail_menu_screen.dart';

final _routeNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'root');

final router = GoRouter(
  navigatorKey: _routeNavigatorKey,
  initialLocation: '/loading',
  routes: [
    // Auth routes (tanpa shell)
    GoRoute(
      path: '/loading',
      builder: (context, state) => LoadingScreen(),
    ),
    GoRoute(
      path: '/sign-in',
      builder: (context, state) => const SignInScreen(),
    ),
    GoRoute(
      path: '/sign-up',
      builder: (context, state) => const SignUpScreen(),
    ),
    GoRoute(
      path: '/kalku-sgr',
      builder: (context, state) => const KalkusgrScreen(),
    ),

    // Halaman utama dibungkus StatefulShellRoute
    StatefulShellRoute.indexedStack(
      builder: (context, state, navigationShell) {
        return HomeLayout(navigationShell: navigationShell);
      },
      branches: [
        // 🟦 0 - Catatan Harian
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: '/catatan-harian',
              builder: (context, state) => const CatatanHarianScreen(),
              routes: [
                GoRoute(
                  path: 'nutrisi',
                  builder: (context, state) => const NutrisiScreen(),
                ),
                GoRoute(
                  path: 'detail-asupan',
                  builder: (context, state) => const DetailAsupanScreen(),
                ),
                GoRoute(
                  path: 'detail-menu',
                  builder: (context, state) => const DetailMenuScreen(),
                ),
              ],
            ),
          ],
        ),
        // 🟦 1 - Resep
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: '/resep',
              builder: (context, state) => const ResepScreen(),
              routes: [
                GoRoute(
                  path: '/detail-resep',
                  builder: (context, state) {
                    final extra = state.extra as Map<String, String>;
                    return DetailResepScreen(
                      nama: extra['nama'] ?? 'Judul tidak tersedia',
                      imageAsset: extra['image'] ?? 'assets/images/default.jpg',
                    );
                  },
                ),
              ],
            ),
          ],
        ),
        // 🟦 2 - Profil (beserta pengaturan & edit akun sebagai sub-route jika perlu)
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: '/profile',
              builder: (context, state) => const ProfilScreen(),
              routes: [
                GoRoute(
                  path: 'pengaturan-akun',
                  builder: (context, state) => const PengaturanAkunScreen(),
                ),
                GoRoute(
                  path: 'edit-akun',
                  builder: (context, state) => const EditAkunScreen(),
                ),
                GoRoute(
                  path: 'edit-sandi',
                  builder: (context, state) => const EditSandiScreen(),
                ),
              ],
            ),
          ],
        ),
      ],
    ),
  ],
);
