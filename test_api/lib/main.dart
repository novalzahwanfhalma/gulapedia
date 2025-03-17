import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'providers/nutrition_provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => NutritionProvider(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Nutrition Search',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const NutritionSearchPage(),
    );
  }
}

class NutritionSearchPage extends StatefulWidget {
  const NutritionSearchPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _NutritionSearchPageState createState() => _NutritionSearchPageState();
}

class _NutritionSearchPageState extends State<NutritionSearchPage> {
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<NutritionProvider>(context);

    return Scaffold(
      appBar: AppBar(title: const Text('Cari Nutrisi Makanan')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _controller,
              decoration: InputDecoration(
                labelText: 'Masukkan nama makanan',
                border: const OutlineInputBorder(),
                suffixIcon: IconButton(
                  icon: const Icon(Icons.search),
                  onPressed: () {
                    provider.searchNutrition(_controller.text);
                  },
                ),
              ),
            ),
            const SizedBox(height: 20),
            provider.isLoading
                ? const CircularProgressIndicator()
                : Expanded(
                    child: ListView.builder(
                      itemCount: provider.nutrients.length,
                      itemBuilder: (context, index) {
                        final item = provider.nutrients[index];
                        return Card(
                          child: ListTile(
                            title: Text(item.name),
                            subtitle: Text(
                              'Kalori: ${item.calories} kcal\nGula: ${item.sugar} g\nKarbohidrat: ${item.carbs} g',
                            ),
                          ),
                        );
                      },
                    ),
                  ),
          ],
        ),
      ),
    );
  }
}
