import 'package:flutter/material.dart';

class MenuCarousel extends StatelessWidget {
  final List<Map<String, String>> foodItems = [
    {"image": "https://picsum.photos/200", "text": "Item 1"},
    {"image": "https://picsum.photos/200", "text": "(tanpa kecap)"},
    {"image": "https://picsum.photos/200", "text": "Pecel sayur"},
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 150,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: foodItems.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(15), // Rounded corners
              child: Stack(
                children: [
                  Image.network(
                    foodItems[index]["image"]!,
                    width: 200,
                    height: 150,
                    fit: BoxFit.cover,
                  ),
                  Positioned(
                    bottom: 10,
                    left: 10,
                    right: 10,
                    child: Center(
                      child: Text(
                        foodItems[index]["text"]!,
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          backgroundColor: Colors.black.withOpacity(
                            0.4,
                          ), // Text background
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
