import 'package:flutter/material.dart';

class CarouselMenu extends StatefulWidget {
  const CarouselMenu({super.key});

  @override
  State<CarouselMenu> createState() => _CarouselMenuState();
}

class _CarouselMenuState extends State<CarouselMenu> {
  final CarouselController controller = CarouselController(initialItem: 1);

  final List<Map<String, String>> foodItems = [
    {"image": "https://picsum.photos/200", "text": "Item 1"},
    {"image": "https://picsum.photos/200", "text": "(tanpa kecap)"},
    {"image": "https://picsum.photos/200", "text": "Pecel sayur"},
    {"image": "https://picsum.photos/200", "text": "Lele"},
    {"image": "https://picsum.photos/200", "text": "Bebek carok"},
  ];

  @override
  Widget build(BuildContext context) {
    CarouselController(initialItem: 2);
    return SizedBox(
      height: 125,
      child: CarouselView(
        itemExtent: 200.0,
        children:
            foodItems.map((item) {
              return KartuMenu(
                imageUrl: item["image"]!,
                text: item["text"]!,
                onTap: () {},
              );
            }).toList(),
      ),
    );
  }
}

class KartuMenu extends StatelessWidget {
  final String imageUrl;
  final String text;
  final VoidCallback onTap;

  const KartuMenu({
    super.key,
    required this.imageUrl,
    required this.text,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: onTap, // Bisa diarahkan ke detail menu
        child: Stack(
          children: [
            // Background Image
            Positioned.fill(child: Image.network(imageUrl, fit: BoxFit.cover)),
            // Dark Overlay
            Positioned.fill(
              child: Container(color: const Color.fromRGBO(0, 0, 0, 0.3)),
            ),
            // Text Label
            Align(
              alignment: Alignment.center,
              child: Text(
                text,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
