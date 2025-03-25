import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class KalkusgrScreen extends StatefulWidget {
  const KalkusgrScreen({super.key});

  @override
  State<KalkusgrScreen> createState() => _KalkusgrScreenState();
}

class _KalkusgrScreenState extends State<KalkusgrScreen> {
  final _formSignUpKey = GlobalKey<FormState>();
  final TextEditingController _ageController = TextEditingController();
  final TextEditingController _heightController = TextEditingController();
  final TextEditingController _weightController = TextEditingController();
  final TextEditingController _sugarController = TextEditingController();

  String? _selectedGender;
  String? _selectedActivity;

  @override
  void dispose() {
    _ageController.dispose();
    _heightController.dispose();
    _weightController.dispose();
    _sugarController.dispose();
    super.dispose();
  }

  double calculateBMR(double weight, double height, int age, String gender) {
    if (gender == 'Pria') {
      return (10 * weight) + (6.25 * height) - (5 * age) + 5;
    } else {
      return (10 * weight) + (6.25 * height) - (5 * age) - 161;
    }
  }

  double getActivityFactor(String activity) {
    switch (activity) {
      case 'Sering di rumah':
        return 1.2;
      case 'Tidak terlalu sering diluar':
        return 1.55;
      case 'Sering di luar':
        return 1.75;
      default:
        return 1.2;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: SingleChildScrollView(
            child: Form(
              key: _formSignUpKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(height: 20),
                  const Text(
                    'Target kontrol gula darah',
                    style: TextStyle(
                      fontSize: 22.0,
                      fontWeight: FontWeight.w700,
                      color: Colors.black,
                    ),
                  ),
                  const Text(
                    'Tentukan target anda!',
                    style: TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.w500,
                      color: Colors.black54,
                    ),
                  ),
                  const SizedBox(height: 80),

                  TextFormField(
                    controller: _ageController,
                    keyboardType: TextInputType.number,
                    inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                    validator:
                        (value) =>
                            value!.isEmpty ? 'Tolong masukkan umur' : null,
                    decoration: InputDecoration(
                      labelText: 'Umur',
                      hintText: 'Masukkan umur',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 10,
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),

                  DropdownButtonFormField<String>(
                    value: _selectedGender,
                    validator:
                        (value) => value == null ? 'Pilih jenis kelamin' : null,
                    decoration: InputDecoration(
                      labelText: 'Jenis Kelamin',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 10,
                      ),
                    ),
                    items: const [
                      DropdownMenuItem(value: 'Pria', child: Text('Pria')),
                      DropdownMenuItem(value: 'Wanita', child: Text('Wanita')),
                    ],
                    onChanged: (value) {
                      setState(() {
                        _selectedGender = value;
                      });
                    },
                    menuMaxHeight: 150,
                    borderRadius: BorderRadius.circular(15),
                  ),

                  const SizedBox(height: 20),

                  TextFormField(
                    controller: _heightController,
                    keyboardType: TextInputType.number,
                    inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                    validator:
                        (value) =>
                            value!.isEmpty
                                ? 'Tolong masukkan tinggi badan'
                                : null,
                    decoration: InputDecoration(
                      labelText: 'Tinggi badan (cm)',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 10,
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),

                  TextFormField(
                    controller: _weightController,
                    keyboardType: TextInputType.number,
                    inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                    validator:
                        (value) =>
                            value!.isEmpty
                                ? 'Tolong masukkan berat badan'
                                : null,
                    decoration: InputDecoration(
                      labelText: 'Berat badan (kg)',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 10,
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),

                  DropdownButtonFormField<String>(
                    value: _selectedActivity,
                    validator:
                        (value) =>
                            value == null ? 'Pilih tingkat aktivitas' : null,
                    decoration: InputDecoration(
                      labelText: 'Kegiatan Harian',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 10,
                      ),
                    ),
                    items: const [
                      DropdownMenuItem(
                        value: 'Sering di rumah',
                        child: Text('Sering di rumah'),
                      ),
                      DropdownMenuItem(
                        value: 'Tidak terlalu sering diluar',
                        child: Text('Tidak terlalu sering diluar'),
                      ),
                      DropdownMenuItem(
                        value: 'Sering di luar',
                        child: Text('Sering di luar'),
                      ),
                    ],
                    onChanged: (value) {
                      setState(() {
                        _selectedActivity = value;
                      });
                    },
                    menuMaxHeight: 200,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  const SizedBox(height: 40),

                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      minimumSize: const Size(
                        double.infinity,
                        45,
                      ), // Lebar penuh dan tinggi 50
                    ),
                    onPressed: () {
                      if (_formSignUpKey.currentState!.validate()) {
                        double weight = double.parse(_weightController.text);
                        double height = double.parse(_heightController.text);
                        int age = int.parse(_ageController.text);
                        double bmr = calculateBMR(
                          weight,
                          height,
                          age,
                          _selectedGender!,
                        );
                        double tdee =
                            bmr * getActivityFactor(_selectedActivity!);
                        double maxSugar10 = (0.10 * tdee) / 4;
                        double maxSugar5 = (0.05 * tdee) / 4;

                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(
                              'TDEE: ${tdee.toStringAsFixed(2)} kcal\n'
                              'Maks Gula (10%): ${maxSugar10.toStringAsFixed(2)} g\n'
                              'Maks Gula (5%): ${maxSugar5.toStringAsFixed(2)} g',
                            ),
                          ),
                        );
                      }
                    },
                    child: const Text('Mulai'),
                  ),

                  const SizedBox(height: 20),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
