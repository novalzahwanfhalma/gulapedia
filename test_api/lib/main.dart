import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'providers/nutrition_provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => NutritionProvider(),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Nutrition Search',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: NutritionSearchPage(),
    );
  }
}

class NutritionSearchPage extends StatefulWidget {
  @override
  _NutritionSearchPageState createState() => _NutritionSearchPageState();
}

class _NutritionSearchPageState extends State<NutritionSearchPage> {
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<NutritionProvider>(context);

    return Scaffold(
      appBar: AppBar(title: Text('Cari Nutrisi Makanan')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _controller,
              decoration: InputDecoration(
                labelText: 'Masukkan nama makanan',
                border: OutlineInputBorder(),
                suffixIcon: IconButton(
                  icon: Icon(Icons.search),
                  onPressed: () {
                    provider.searchNutrition(_controller.text);
                  },
                ),
              ),
            ),
            SizedBox(height: 20),
            provider.isLoading
                ? CircularProgressIndicator()
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
