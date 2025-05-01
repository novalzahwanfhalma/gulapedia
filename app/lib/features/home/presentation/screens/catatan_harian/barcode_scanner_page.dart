import 'package:flutter/material.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Scan Nutrisi',
      theme: ThemeData(
        primarySwatch: Colors.green,
        useMaterial3: true,
      ),
      home: const BarcodeScannerPage(),
    );
  }
}

class BarcodeScannerPage extends StatefulWidget {
  const BarcodeScannerPage({super.key});

  @override
  State<BarcodeScannerPage> createState() => _BarcodeScannerPageState();
}

class _BarcodeScannerPageState extends State<BarcodeScannerPage> {
  String? productName;
  Map<String, dynamic>? nutriments;
  bool isLoading = false;

  void fetchProductInfo(String barcode) async {
    setState(() {
      isLoading = true;
    });

    final url = 'https://world.openfoodfacts.org/api/v0/product/$barcode.json';
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      final product = data['product'];
      setState(() {
        productName = product['product_name'] ?? 'Nama tidak ditemukan';
        nutriments = product['nutriments'];
        isLoading = false;
      });
    } else {
      setState(() {
        productName = 'Produk tidak ditemukan';
        nutriments = null;
        isLoading = false;
      });
    }
  }

  void onDetect(BarcodeCapture capture) {
    final barcode = capture.barcodes.first.rawValue;
    if (barcode != null && !isLoading) {
      fetchProductInfo(barcode);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Scan Makanan')),
      body: Stack(
        children: [
          MobileScanner(onDetect: onDetect),
          const QrisScanFrame(),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              padding: const EdgeInsets.all(16),
              width: double.infinity,
              color: Colors.white,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (isLoading)
                    const Center(child: CircularProgressIndicator()),
                  if (productName != null) ...[
                    Text("Produk: $productName", style: const TextStyle(fontSize: 18)),
                    if (nutriments != null) ...[
                      Text("Kalori: ${nutriments!['energy-kcal_100g'] ?? '-'} kcal"),
                      Text("Gula: ${nutriments!['sugars_100g'] ?? '-'} g"),
                      Text("Lemak: ${nutriments!['fat_100g'] ?? '-'} g"),
                      Text("Protein: ${nutriments!['proteins_100g'] ?? '-'} g"),
                    ]
                  ],
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class QrisScanFrame extends StatelessWidget {
  const QrisScanFrame({super.key});

  @override
  Widget build(BuildContext context) {
    return IgnorePointer(
      child: Center(
        child: SizedBox(
          width: 250,
          height: 250,
          child: CustomPaint(
            painter: QrCornerPainter(),
          ),
        ),
      ),
    );
  }
}

class QrCornerPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.greenAccent
      ..strokeWidth = 4
      ..style = PaintingStyle.stroke;

    const cornerLength = 30.0;

    // Top-left
    canvas.drawLine(Offset(0, 0), Offset(cornerLength, 0), paint);
    canvas.drawLine(Offset(0, 0), Offset(0, cornerLength), paint);

    // Top-right
    canvas.drawLine(Offset(size.width, 0), Offset(size.width - cornerLength, 0), paint);
    canvas.drawLine(Offset(size.width, 0), Offset(size.width, cornerLength), paint);

    // Bottom-left
    canvas.drawLine(Offset(0, size.height), Offset(cornerLength, size.height), paint);
    canvas.drawLine(Offset(0, size.height), Offset(0, size.height - cornerLength), paint);

    // Bottom-right
    canvas.drawLine(Offset(size.width, size.height), Offset(size.width - cornerLength, size.height), paint);
    canvas.drawLine(Offset(size.width, size.height), Offset(size.width, size.height - cornerLength), paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
