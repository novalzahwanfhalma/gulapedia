import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:app/main.dart';

void main() {
  testWidgets('App smoke test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const GulapediaApp());

    // Cek apakah teks tertentu ada di halaman utama kamu, misalnya:
    expect(find.text('Masuk ke akun anda'), findsOneWidget); // Ganti dengan teks/judul utama kamu
  });
}
