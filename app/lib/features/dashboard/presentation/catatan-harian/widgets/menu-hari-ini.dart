import 'package:app/core/theme/colors.dart';
import 'package:app/core/widgets/floating_container.dart';
import 'package:flutter/material.dart';

class MenuHariIni extends StatelessWidget {
  const MenuHariIni({super.key});

  @override
  Widget build(BuildContext context) {
    return FloatingContainer(
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
                    color: Colors.grey[700],
                  ),
                ),
                Text(
                  description,
                  style: TextStyle(fontSize: 14, color: Colors.grey[600]),
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
