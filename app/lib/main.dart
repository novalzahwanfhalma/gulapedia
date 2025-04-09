import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:app/core/router/router.dart';
import 'package:app/core/theme/theme.dart';

class MyCustomScrollBehavior extends MaterialScrollBehavior {
  // Override behavior methods and getters like dragDevices
  @override
  Set<PointerDeviceKind> get dragDevices => {
    PointerDeviceKind.touch,
    PointerDeviceKind.mouse,
    // etc.
  };
}

void main() => runApp(const GulapediaApp());

class GulapediaApp extends StatelessWidget {
  const GulapediaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      theme: AppTheme.mainTheme,
      routerConfig: router,
      debugShowCheckedModeBanner: false,
      scrollBehavior:
          MyCustomScrollBehavior(), // Fix scrolling layar di komputer
    );
  }
}
