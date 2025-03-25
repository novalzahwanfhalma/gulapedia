import 'package:flutter/material.dart';
import 'theme/theme.dart'; // Tambahkan import theme
import 'screens/sign_in_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Login App',
      theme: AppTheme.lightTheme, // Gunakan tema yang sudah dibuat di theme.dart
      home: const SignInScreen(),
    );
  }
}
