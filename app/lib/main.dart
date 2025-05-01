import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:app/core/router/router.dart';
import 'package:app/core/theme/theme.dart';
import 'package:intl/date_symbol_data_local.dart'; // Tambahkan ini

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeDateFormatting('id_ID', null); // Inisialisasi locale Indonesia
  runApp(const GulapediaApp());
}

class GulapediaApp extends StatelessWidget {
  const GulapediaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      theme: AppTheme.mainTheme,
      routerConfig: router,
      debugShowCheckedModeBanner: false,
      scrollBehavior: MyCustomScrollBehavior(),
    );
  }
}

class MyCustomScrollBehavior extends MaterialScrollBehavior {
  @override
  Set<PointerDeviceKind> get dragDevices => {
        PointerDeviceKind.touch,
        PointerDeviceKind.mouse,
      };
}
