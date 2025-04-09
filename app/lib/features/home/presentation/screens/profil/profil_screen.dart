import 'package:flutter/material.dart';
import 'package:app/core/theme/colors.dart';

class ProfilScreen extends StatefulWidget {
  const ProfilScreen({super.key});

  @override
  State<ProfilScreen> createState() => _ProfilScreenState();
}

class _ProfilScreenState extends State<ProfilScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          const SizedBox(height: 32),
          Center(
            child: Column(
              children: [
                const CircleAvatar(
                  radius: 45,
                  backgroundImage: AssetImage('assets/images/noto_bread.png'),
                ),
                const SizedBox(height: 12),
                Text(
                  'Farhan Usa',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                const SizedBox(height: 6),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 6,
                  ),
                  decoration: BoxDecoration(
                    color: AppColors.primary.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: const Text(
                    'farhanusa1945@gmail.com',
                    style: TextStyle(fontSize: 14, color: AppColors.primary),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 32),
          const Divider(height: 1),
          const SizedBox(height: 25),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 28.0),
            child: Column(
              children: [
                _buildMenuItem(
                  icon: Icons.settings,
                  label: 'Pengaturan Akun',
                  onTap: () {},
                ),
                _buildMenuItem(
                  icon: Icons.bar_chart,
                  label: 'Laporan',
                  onTap: () {},
                ),
                _buildMenuItem(
                  icon: Icons.bookmark,
                  label: 'Resep Tersimpan',
                  onTap: () {},
                ),
                _buildMenuItem(
                  icon: Icons.access_alarm,
                  label: 'Pengingat',
                  onTap: () {},
                ),
                _buildMenuItem(
                  icon: Icons.logout,
                  label: 'Keluar',
                  iconColor: Colors.red,
                  textColor: Colors.red,
                  onTap: () {},
                ),
              ],
            ),
          ),
        ],
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
