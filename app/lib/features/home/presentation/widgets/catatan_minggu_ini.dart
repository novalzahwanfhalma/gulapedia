import 'package:app/core/theme/colors.dart';
import 'package:flutter/material.dart';

class CatatanMingguIni extends StatelessWidget {
  CatatanMingguIni({super.key});

  final List<String> labels = ["S", "S", "R", "K", "J", "S", "M"];
  final int selectedIndex = 5; // Index of the selected item
  final double progressValue = 10.6;
  final double totalValue = 24.5;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(16.0),
      color: Colors.white,
      elevation: 4.0,
      child: Padding(
        padding: EdgeInsets.all(18.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: List.generate(labels.length, (index) {
                bool isSelected = index == selectedIndex;
                return Column(
                  children: [
                    Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color:
                            isSelected
                                ? AppColors.primary
                                : AppColors.secondary,
                      ),
                      child: Center(
                        child: Icon(
                          Icons.check,
                          color: isSelected ? Colors.white : AppColors.primary,
                        ),
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      labels[index],
                      style: TextStyle(
                        fontWeight:
                            isSelected ? FontWeight.bold : FontWeight.normal,
                        color: const Color.fromRGBO(0, 0, 0, 0.867),
                      ),
                    ),
                  ],
                );
              }),
            ),
            const SizedBox(height: 16),

            // Progress Bar
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text(
                  "Gula",
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
                ),
                const SizedBox(height: 4),
                ClipRRect(
                  borderRadius: BorderRadius.circular(4),
                  child: LinearProgressIndicator(
                    value: progressValue / totalValue,
                    minHeight: 6,
                    backgroundColor: AppColors.secondary,
                    valueColor: AlwaysStoppedAnimation(AppColors.primary),
                  ),
                ),
                const SizedBox(height: 4),

                // Text: current value / total
                RichText(
                  text: TextSpan(
                    style: const TextStyle(fontSize: 14, color: Colors.black87),
                    children: [
                      TextSpan(
                        text: "${progressValue.toStringAsFixed(1)} ",
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                      const TextSpan(text: "/ "),
                      TextSpan(
                        text: "${totalValue.toStringAsFixed(1)} g",
                        style: const TextStyle(
                          color: AppColors.primary,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
