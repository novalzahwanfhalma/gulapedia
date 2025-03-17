import 'package:flutter/material.dart';

enum ActivityLevel { low, moderate, high }

void main() {
  runApp(const SugarIntakeCalculator());
}

class SugarIntakeCalculator extends StatelessWidget {
  const SugarIntakeCalculator({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: CalculatorScreen(),
    );
  }
}

class CalculatorScreen extends StatefulWidget {
  const CalculatorScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _CalculatorScreenState createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  final TextEditingController ageController = TextEditingController();
  final TextEditingController heightController = TextEditingController();
  final TextEditingController weightController = TextEditingController();
  String gender = 'Male';
  ActivityLevel activityLevel = ActivityLevel.moderate;
  double sugarLimit = 0.0;
  double sugarIdeal = 0.0;

  void calculateSugarIntake() {
    int age = int.tryParse(ageController.text) ?? 0;
    double height = double.tryParse(heightController.text) ?? 0.0;
    double weight = double.tryParse(weightController.text) ?? 0.0;

    if (age == 0 || height == 0 || weight == 0) {
      setState(() {
        sugarLimit = 0.0;
        sugarIdeal = 0.0;
      });
      return;
    }

    double bmr;
    if (gender == 'Male') {
      bmr = (10 * weight) + (6.25 * height) - (5 * age) + 5;
    } else {
      bmr = (10 * weight) + (6.25 * height) - (5 * age) - 161;
    }

    double activityFactor;
    switch (activityLevel) {
      case ActivityLevel.low:
        activityFactor = 1.2;
        break;
      case ActivityLevel.moderate:
        activityFactor = 1.55;
        break;
      case ActivityLevel.high:
        activityFactor = 1.75;
        break;
    }

    double tdee = bmr * activityFactor;
    double maxSugar = (0.10 * tdee) / 4;
    double idealSugar = (0.05 * tdee) / 4;

    setState(() {
      sugarLimit = maxSugar;
      sugarIdeal = idealSugar;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Kalkulator Konsumsi Gula')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: ageController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(labelText: 'Umur (tahun)'),
            ),
            TextField(
              controller: heightController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(labelText: 'Tinggi (cm)'),
            ),
            TextField(
              controller: weightController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(labelText: 'Berat (kg)'),
            ),
            DropdownButton<String>(
              value: gender,
              items: ['Male', 'Female']
                  .map((String value) => DropdownMenuItem(
                        value: value,
                        child: Text(value),
                      ))
                  .toList(),
              onChanged: (newValue) {
                setState(() {
                  gender = newValue!;
                });
              },
            ),
            DropdownButton<ActivityLevel>(
              value: activityLevel,
              items: const [
                DropdownMenuItem(
                    value: ActivityLevel.low, child: Text('Sering di rumah')),
                DropdownMenuItem(
                    value: ActivityLevel.moderate,
                    child: Text('Tidak terlalu sering di luar')),
                DropdownMenuItem(
                    value: ActivityLevel.high, child: Text('Sering di luar')),
              ],
              onChanged: (newValue) {
                setState(() {
                  activityLevel = newValue!;
                });
              },
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: calculateSugarIntake,
              child: const Text('Hitung Konsumsi Gula'),
            ),
            const SizedBox(height: 20),
            Text(
                'Batas Konsumsi Gula Maksimal: ${sugarLimit.toStringAsFixed(2)} gram'),
            Text(
                'Batas Konsumsi Gula Ideal: ${sugarIdeal.toStringAsFixed(2)} gram'),
          ],
        ),
      ),
    );
  }
}
