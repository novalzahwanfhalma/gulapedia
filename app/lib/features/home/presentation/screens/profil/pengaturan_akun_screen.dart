import 'package:flutter/material.dart';
import 'package:app/core/theme/colors.dart';
import 'package:app/features/home/presentation/screens/profil/edit_akun_screen.dart';
import 'package:app/features/home/presentation/screens/profil/edit_sandi_screen.dart';
import 'package:go_router/go_router.dart';

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
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const SizedBox(height: 24),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 28.0),
              child: Column(
                children: [
                  _buildMenuItem(
                    icon: Icons.settings,
                    label: 'Edit Akun',
                    onTap: () {
                      context.push('/profile/edit-akun');
                    },
                  ),
                  _buildMenuItem(
                    icon: Icons.key,
                    label: 'Ubah Kata sandi',
                    onTap: () {
                      context.push('/profile/edit-sandi');
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMenuItem({
    required IconData icon,
    required String label,
    required VoidCallback onTap,
    Color? iconColor,
    Color? textColor,
  }) {
    return ListTile(
      leading: Icon(icon, color: iconColor ?? Colors.black),
      title: Text(
        label,
        style: TextStyle(color: textColor ?? Colors.black, fontSize: 16),
      ),
      trailing: Icon(
        Icons.arrow_forward,
        size: 16,
        color: iconColor ?? Colors.black,
      ),
      onTap: onTap,
      contentPadding: const EdgeInsets.symmetric(horizontal: 0),
    );
  }
}
