import 'package:flutter/material.dart';
import 'package:app/core/theme/colors.dart';
import 'package:go_router/go_router.dart';
import 'package:app/features/home/presentation/screens/resep/resep_card.dart';

class ResepScreen extends StatelessWidget {
  const ResepScreen({super.key});

  static const List<Map<String, String>> foodItems = [
    {"image": "assets/images/ikan-bakar-bale.png", "text": "Ikan bakar"},
    {"image": "assets/images/ayam-kecap.png", "text": "Ayam kecap"},
    {"image": "assets/images/pecal-sayur.jpg", "text": "Pecel sayur"},
    {"image": "assets/images/lele.jpg", "text": "Lele"},
    {"image": "assets/images/bebek-carok.jpg", "text": "Bebek carok"},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Resep Makanan'), centerTitle: true),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: foodItems.length,
        itemBuilder: (context, index) {
          final item = foodItems[index];
          return ResepCard(nama: item['text']!, imageAsset: item['image']!);
        },
      ),
    );
  }
}
