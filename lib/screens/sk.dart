import 'package:flutter/material.dart';

class SkScreen extends StatelessWidget {
  SkScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Syarat dan Ketentuan')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Text(
          'Ini adalah halaman Syarat dan Ketentuan.',
          style: TextStyle(fontSize: 16),
        ),
      ),
    );
  }
}
