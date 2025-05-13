import 'package:flutter/material.dart';
import 'package:app/core/theme/colors.dart';
import 'package:go_router/go_router.dart';
import 'package:app/features/home/presentation/screens/resep/resep_screen.dart';
import 'package:app/features/home/presentation/screens/resep/detail_resep_screen.dart';

class ResepCard extends StatelessWidget {
  final String nama;
  final String imageAsset;

  const ResepCard({super.key, required this.nama, required this.imageAsset});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade300,
            blurRadius: 6,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(12),
              bottomLeft: Radius.circular(12),
            ),
            child: Image.asset(
              imageAsset,
              width: 110,
              height: 110,
              fit: BoxFit.cover,
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    nama,
                    style: const TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(height: 4),
                  const Text(
                    'Grade: A',
                    style: TextStyle(color: Colors.grey, fontSize: 14),
                  ),
                  const SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          context.push(
                            '/resep/detail-resep',
                            extra: {'nama': nama, 'image': imageAsset},
                          );
                        },
                        child: const Text(
                          'Lihat resep',
                          style: TextStyle(fontSize: 12),
                        ),
                      ),
                      const Icon(Icons.bookmark_border),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
