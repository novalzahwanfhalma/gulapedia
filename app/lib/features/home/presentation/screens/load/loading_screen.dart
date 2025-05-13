import 'dart:async';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  double _opacity = 1.0;
  Color _backgroundColor = const Color(0xFF1A998E); // Warna awal

  @override
  void initState() {
    super.initState();

    // Setelah 1.5 detik, mulai animasi memudar dan ganti warna
    Timer(const Duration(milliseconds: 1500), () {
      setState(() {
        _opacity = 0.0;
        _backgroundColor = Colors.white; // Warna target
      });

      // Setelah 500ms (durasi animasi), navigasi ke sign-in
      Future.delayed(const Duration(milliseconds: 500), () {
        if (mounted) {
          context.go('/sign-in');
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 500),
      color: _backgroundColor,
      child: Scaffold(
        backgroundColor: Colors.transparent, // Agar tidak menimpa animasi warna
        body: Center(
          child: AnimatedOpacity(
            duration: const Duration(milliseconds: 500),
            opacity: _opacity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset('assets/images/gulapedia.png', width: 150, height: 150),
                const Text(
                  'GULAPEDIA',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1.2,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
