import 'package:flutter/material.dart';
import 'package:flutter/services.dart'; // Untuk inputFormatters
import 'package:app/core/theme/colors.dart';

class EditAkunScreen extends StatefulWidget {
  const EditAkunScreen({super.key});

  @override
  State<EditAkunScreen> createState() => _EditAkunScreenState();
}

class _EditAkunScreenState extends State<EditAkunScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _heightController = TextEditingController();
  final TextEditingController _weightController = TextEditingController();
  String? _selectedActivity;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Akun'),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24.0),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                /// Tinggi Badan
                TextFormField(
                  controller: _heightController,
                  keyboardType: TextInputType.number,
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                  validator: (value) =>
                      value!.isEmpty ? 'Tolong masukkan tinggi badan' : null,
                  decoration: InputDecoration(
                    labelText: 'Tinggi badan (cm)',
                    hintText: 'Masukkan tinggi badan',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 15,
                    ),
                  ),
                ),
                const SizedBox(height: 20),

                /// Berat Badan
                TextFormField(
                  controller: _weightController,
                  keyboardType: TextInputType.number,
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                  validator: (value) =>
                      value!.isEmpty ? 'Tolong masukkan berat badan' : null,
                  decoration: InputDecoration(
                    labelText: 'Berat badan (kg)',
                    hintText: 'Masukkan berat badan',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 15,
                    ),
                  ),
                ),
                const SizedBox(height: 20),

                /// Dropdown Kegiatan Harian
                DropdownButtonFormField<String>(
                  value: _selectedActivity,
                  validator: (value) =>
                      value == null ? 'Pilih tingkat aktivitas' : null,
                  decoration: InputDecoration(
                    labelText: 'Kegiatan Harian',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 15,
                    ),
                  ),
                  dropdownColor: Colors.white,
                  menuMaxHeight: 200,
                  borderRadius: BorderRadius.circular(15),
                  items: const [
                    DropdownMenuItem(
                      value: 'Sering diluar',
                      child: Text('Sering diluar'),
                    ),
                    DropdownMenuItem(
                      value: 'Tidak terlalu sering diluar',
                      child: Text('Tidak terlalu sering diluar'),
                    ),
                    DropdownMenuItem(
                      value: 'Sering di rumah',
                      child: Text('Sering di rumah'),
                    ),
                  ],
                  onChanged: (value) {
                    setState(() {
                      _selectedActivity = value;
                    });
                  },
                ),
                const SizedBox(height: 30),

                /// Tombol Simpan
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        // TODO: Simpan data
                        print("Tinggi: ${_heightController.text}");
                        print("Berat: ${_weightController.text}");
                        print("Aktivitas: $_selectedActivity");
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                    child: const Text('Simpan'),
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
