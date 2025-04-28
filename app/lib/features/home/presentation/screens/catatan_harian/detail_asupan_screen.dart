import 'package:flutter/material.dart';
import 'package:app/core/theme/colors.dart';
import 'package:go_router/go_router.dart';
import 'package:app/features/home/presentation/screens/catatan_harian/nutrisi_screen.dart';

class DetailAsupanScreen extends StatelessWidget {
  const DetailAsupanScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final double currentValue = 10.6;
    final double targetValue = 24.5;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Makan Siang'),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
        foregroundColor: Colors.black,
      ),
      body: Column(
        children: [
          const SizedBox(height: 16),
          Stack(
            alignment: Alignment.center,
            children: [
              SizedBox(
                width: 100,
                height: 100,
                child: CircularProgressIndicator(
                  value: currentValue / targetValue,
                  strokeWidth: 10,
                  backgroundColor: Colors.grey.shade200,
                  valueColor: AlwaysStoppedAnimation(AppColors.primary),
                ),
              ),
              Image.asset('assets/images/noto_pot-of-food.png', height: 70),
            ],
          ),
          const SizedBox(height: 8),
          Text(
            '${currentValue.toStringAsFixed(1)} / ${targetValue.toStringAsFixed(1)} g',
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 24),
          const Divider(),
          _MakananItem(nama: 'Soto Ayam', grade: 'A', berat: 1.5),
          _MakananItem(nama: 'Nasi Lemak', grade: 'B', berat: 3),
          _MakananItem(nama: 'Teh', grade: 'D', berat: 8),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.all(16),
            child: ElevatedButton.icon(
              onPressed: () {
                context.push('/catatan-harian/nutrisi');
              },
              icon: const Icon(Icons.add, color: Colors.white),
              label: const Text('Tambah Makanan'),
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primary,
                minimumSize: const Size.fromHeight(48),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _MakananItem extends StatelessWidget {
  final String nama;
  final String grade;
  final double berat;

  const _MakananItem({
    required this.nama,
    required this.grade,
    required this.berat,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(nama),
      subtitle: Text('Grade : $grade'),
      trailing: Text('${berat.toStringAsFixed(1)} g'),
    );
  }
}
