import 'package:flutter/material.dart';
import 'package:app/core/theme/colors.dart';
import 'package:app/features/home/presentation/screens/profil/edit_akun_screen.dart';


class PengaturanAkunScreen extends StatefulWidget {
  const PengaturanAkunScreen({super.key});

  @override
  State<PengaturanAkunScreen> createState() => _PengaturanAkunScreenState();
}

class _PengaturanAkunScreenState extends State<PengaturanAkunScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Pengaturan Akun')),
      
    );
  }
}
