import 'package:flutter/material.dart';
import 'package:flutter/services.dart'; // Untuk inputFormatters
import 'package:app/core/theme/colors.dart';

class EditSandiScreen extends StatefulWidget {
  const EditSandiScreen({super.key});

  @override
  State<EditSandiScreen> createState() => _EditSandiScreenState();
}

class _EditSandiScreenState extends State<EditSandiScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _heightController = TextEditingController();
  final TextEditingController _weightController = TextEditingController();
  String? _selectedActivity;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Perbarui Kata Sandi')),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24.0),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                const SizedBox(height: 20),
                  TextFormField(
                    obscureText: true,
                    validator:
                        (value) =>
                            value!.isEmpty
                                ? 'Tolong masukkan kata sandi baru'
                                : null,
                    decoration: InputDecoration(
                      labelText: 'Kata Sandi',
                      hintText: 'Masukkan kata sandi baru',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 10,
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),

                /// Tombol Simpan
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        // TODO: Simpan data
                        print("Nama: ${_nameController.text}");
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
