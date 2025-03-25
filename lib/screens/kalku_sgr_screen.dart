import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class KalkusgrScreen extends StatefulWidget {
  const KalkusgrScreen({super.key});

  @override
  State<KalkusgrScreen> createState() => _KalkusgrScreenState();
}

class _KalkusgrScreenState extends State<KalkusgrScreen> {
  final _formSignUpKey = GlobalKey<FormState>();
  final TextEditingController _dateController = TextEditingController();
  final TextEditingController _heightController = TextEditingController();
  final TextEditingController _weightController = TextEditingController();
  final TextEditingController _sugarController = TextEditingController();

  String? _selectedGender;
  String? _selectedActivity;
  DateTime? _selectedDate;

  @override
  void dispose() {
    _dateController.dispose();
    _heightController.dispose();
    _weightController.dispose();
    _sugarController.dispose();
    super.dispose();
  }

  void _pickDate() async {
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
      builder: (context, child) {
        return Theme(
          data: ThemeData.light().copyWith(
            primaryColor: Colors.grey,
            hintColor: Colors.grey,
            colorScheme: ColorScheme.light(primary: Colors.grey),
          ),
          child: child!,
        );
      },
    );

    if (pickedDate != null) {
      setState(() {
        _selectedDate = pickedDate;
        _dateController.text =
            "${pickedDate.day}/${pickedDate.month}/${pickedDate.year}";
      });
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

                  /// **📌 Date Picker untuk Tanggal Lahir**
                  TextFormField(
                    controller: _dateController,
                    readOnly: true,
                    validator:
                        (value) =>
                            value!.isEmpty
                                ? 'Tolong masukkan tanggal lahir'
                                : null,
                    decoration: InputDecoration(
                      labelText: 'Tanggal lahir',
                      hintText: 'Pilih tanggal lahir',
                      suffixIcon: Icon(Icons.calendar_today),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide: BorderSide(
                          color: Colors.grey, // Warna border saat hover
                          width: 2,
                        ),
                      ),
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 10,
                      ),
                    ),
                    onTap: _pickDate,
                  ),
                  const SizedBox(height: 20),

                  /// **📌 Dropdown untuk Jenis Kelamin**
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
                    dropdownColor: Colors.white,
                    menuMaxHeight: 100,
                    items: [
                      DropdownMenuItem(
                        value: 'Pria',
                        child: Row(
                          children: const [
                            Icon(
                              Icons.male,
                              color: Color.fromARGB(255, 52, 174, 56),
                            ),
                            Text('Pria'),
                          ],
                        ),
                      ),
                      DropdownMenuItem(
                        value: 'Wanita',
                        child: Row(
                          children: const [
                            Icon(
                              Icons.female,
                              color: Color.fromARGB(255, 207, 72, 198),
                            ),
                            Text('Wanita'),
                          ],
                        ),
                      ),
                    ],
                    onChanged: (value) {
                      setState(() {
                        _selectedGender = value;
                      });
                    },
                    borderRadius: BorderRadius.circular(
                      15,
                    ), // Tambahkan border radius pada dropdown
                  ),
                  const SizedBox(height: 20),

                  /// **📌 Input hanya angka untuk Tinggi Badan**
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
                      hintText: 'Masukkan tinggi badan',
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

                  /// **📌 Input hanya angka untuk Berat Badan**
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
                      hintText: 'Masukkan berat badan',
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

                  /// **📌 Dropdown untuk Kegiatan Harian**
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
                    dropdownColor: Colors.white, // Warna dropdown
                    menuMaxHeight: 150, // Maksimal tinggi dropdown
                    borderRadius: BorderRadius.circular(
                      15,
                    ), // Membuat dropdown tidak kotak

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
                  const SizedBox(height: 20),

                  /// **📌 Input hanya angka kadar gula darah**
                  TextFormField(
                    controller: _sugarController,
                    keyboardType: TextInputType.number,
                    inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                    validator:
                        (value) =>
                            value!.isEmpty
                                ? 'Tolong masukkan kadar gula darah'
                                : null,
                    decoration: InputDecoration(
                      labelText: 'Kadar gula darah (g)',
                      hintText: 'Masukkan kadar gula darah',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 10,
                      ),
                    ),
                  ),
                  const SizedBox(height: 40),

                  /// **📌 Tombol Submit**
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        if (_formSignUpKey.currentState!.validate()) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(
                                'Tanggal Lahir: ${_dateController.text}\n'
                                'Jenis Kelamin: $_selectedGender\n'
                                'Tinggi Badan: ${_heightController.text} cm\n'
                                'Berat Badan: ${_weightController.text} kg\n'
                                'Kegiatan Harian: $_selectedActivity\n'
                                'Kadar gula darah: ${_sugarController.text} g\n',
                              ),
                            ),
                          );
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color.from(
                          alpha: 1,
                          red: 0.102,
                          green: 0.6,
                          blue: 0.557,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                        padding: const EdgeInsets.symmetric(
                          horizontal: 20,
                          vertical: 10,
                        ),
                      ),
                      child: const Text(
                        'Mulai',
                        style: TextStyle(fontSize: 16, color: Colors.white),
                      ),
                    ),
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
