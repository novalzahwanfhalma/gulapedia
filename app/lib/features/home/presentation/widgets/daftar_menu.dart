import 'package:flutter/material.dart';
import 'package:app/core/theme/colors.dart';

class DaftarMenu extends StatelessWidget {
  const DaftarMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(16.0),
      color: Colors.white,
      elevation: 4.0,
      child: Column(
        children: [
          MealProgressCard(
            title: 'Sarapan',
            currentValue: 2.5,
            targetValue: 6,
            description: 'pisang, ayam goreng',
            image: 'assets/images/noto_bread.png',
            onAdd: () {},
          ),
          Divider(),
          MealProgressCard(
            title: 'Makan Siang',
            currentValue: 5,
            targetValue: 7,
            description: 'pisang, ayam goreng',
            image: 'assets/images/noto_green-salad.png',
            onAdd: () {},
          ),
          Divider(),
          MealProgressCard(
            title: 'Makan Malam',
            currentValue: 0,
            targetValue: 6,
            description: '',
            image: 'assets/images/noto_pot-of-food.png',
            onAdd: () {},
          ),
          Divider(),
          MealProgressCard(
            title: 'Cemilan',
            currentValue: 3.1,
            targetValue: 5.5,
            description: 'kentang goreng, bakso bakar',
            image: 'assets/images/noto_kiwi-fruit.png',
            onAdd: () {},
          ),
        ],
      ),
    );
  }
}

class MealProgressCard extends StatelessWidget {
  final String title;
  final double currentValue;
  final double targetValue;
  final String description;
  final String image;
  final VoidCallback onAdd;

  const MealProgressCard({
    super.key,
    required this.title,
    required this.currentValue,
    required this.targetValue,
    required this.description,
    required this.image,
    required this.onAdd,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Stack(
            alignment: Alignment.center,
            children: [
              SizedBox(
                width: 50,
                height: 50,
                child: CircularProgressIndicator(
                  value: currentValue / targetValue,
                  backgroundColor: AppColors.secondary,
                  valueColor: AlwaysStoppedAnimation(AppColors.primary),
                  strokeWidth: 5,
                ),
              ),
              Image.asset(image, height: 24),
            ],
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                Text(
                  "${currentValue.toStringAsFixed(1)} / ${targetValue.toStringAsFixed(1)} gram",
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: const Color.fromRGBO(97, 97, 97, 1),
                  ),
                ),
                Text(
                  description,
                  style: TextStyle(
                    fontSize: 14,
                    color: const Color.fromRGBO(117, 117, 117, 1),
                  ),
                ),
              ],
            ),
          ),
          IconButton(
            onPressed: onAdd,
            icon: Icon(Icons.add_circle, color: AppColors.primary, size: 28),
          ),
        ],
      ),
    );
  }
}
