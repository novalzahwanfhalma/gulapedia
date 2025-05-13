import 'package:flutter/material.dart';
import 'package:app/core/theme/colors.dart';
import 'package:go_router/go_router.dart';

class DetailResepScreen extends StatelessWidget {
  final String nama;
  final String imageAsset;

  const DetailResepScreen({
    super.key,
    required this.nama,
    required this.imageAsset,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(nama),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.asset(
              imageAsset, // ← digunakan di sini
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(height: 16),
          Text(
            nama, // ← digunakan di sini
            style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 16),
          const Text(
            'Bahan - Bahan',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          const Text('- 2 Mangkok Nasi'),
          const Text('- 2 sdt Kaldu Ayam Bubuk'),
          const Text('- 1/4 kg Ayam, goreng dan sisit kasar'),
          const Text('- 1 liter Air'),
          const Text('- Secukupnya Garam dan Merica Bubuk'),
          const Text('- Secukupnya Minyak Wijen (gapake juga gapapa)'),
          const SizedBox(height: 16),
          const Text(
            'Cara Membuat',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          const _LangkahMemasak(
            nomor: '1',
            deskripsi:
                'Blender halus nasi dengan air. Setelah halus masukkan panci dan rebus sambil diaduk. Jika kurang air bisa ditambahkan sampai dirasa cukup dan sesuai dg tekstur bubur yg diinginkan.',
          ),
          const _LangkahMemasak(
            nomor: '2',
            deskripsi:
                'Masukkan ayam sisit kasar ke dalam panci. Aduk rata. Bumbui dengan kaldu ayam bubuk, garam dan merica. Cicipi rasa.',
          ),
          const _LangkahMemasak(
            nomor: '3',
            deskripsi:
                'Setelah mendidih dan masak, sebelum dimatikan kompornya tuang minyak wijen. Aduk sebentar sampai rata. Matikan dan tutup pancinya.',
          ),
          const _LangkahMemasak(
            nomor: '4',
            deskripsi:
                'Tuang bubur ayam ke dalam mangkok dan sajikan dengan pelengkapnya.',
          ),
        ],
      ),
    );
  }
}

class _LangkahMemasak extends StatelessWidget {
  final String nomor;
  final String deskripsi;

  const _LangkahMemasak({required this.nomor, required this.deskripsi});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircleAvatar(
            radius: 12,
            backgroundColor: Colors.black,
            child: Text(
              nomor,
              style: const TextStyle(color: Colors.white, fontSize: 12),
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Text(deskripsi, style: const TextStyle(fontSize: 14)),
          ),
        ],
      ),
    );
  }
}
