import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/nutrition.dart';

class ApiService {
  static const String usdaApiUrl = 'https://api.nal.usda.gov/fdc/v1/foods/search';
  static const String openFoodFactsApiUrl = 'https://world.openfoodfacts.org/api/v0/product/';
  static const String usdaApiKey = 'kgev3kkcENA6ugFzQRb4UQUoyH7wyA9fSdse0GTU'; // Ganti dengan API Key USDA

  static Future<List<Nutrition>> fetchNutritionData(String query) async {
    List<Nutrition> results = [];

    // Fetch dari USDA API
    final responseUsda = await http.get(Uri.parse('$usdaApiUrl?query=$query&api_key=$usdaApiKey'));
    if (responseUsda.statusCode == 200) {
      final data = jsonDecode(responseUsda.body);
      for (var item in data['foods']) {
        var nutrients = item['foodNutrients'] ?? [];

        results.add(Nutrition(
          name: item['description'] ?? 'Unknown',
          calories: _getNutrientValue(nutrients, 1008), // Energy (kcal)
          sugar: _getNutrientValue(nutrients, 2000),    // Sugars
          carbs: _getNutrientValue(nutrients, 1005),    // Carbohydrates
        ));
      }
    }

    // Fetch dari Open Food Facts API
    final responseOpenFood = await http.get(Uri.parse('$openFoodFactsApiUrl$query.json'));
    if (responseOpenFood.statusCode == 200) {
      final data = jsonDecode(responseOpenFood.body);
      var product = data.containsKey('product') ? data['product'] : null;

      if (product != null) {
        results.add(Nutrition(
          name: product['product_name'] ?? 'Unknown',
          calories: _convertToDouble(product['nutriments']?['energy-kcal_100g']),
          sugar: _convertToDouble(product['nutriments']?['sugars_100g']),
          carbs: _convertToDouble(product['nutriments']?['carbohydrates_100g']),
        ));
      }
    }

    return results;
  }

  // Fungsi untuk memastikan tipe double
  static double _convertToDouble(dynamic value) {
    if (value == null) return 0.0;
    if (value is int) return value.toDouble();
    if (value is double) return value;
    return double.tryParse(value.toString()) ?? 0.0;
  }

  // Fungsi untuk mencari nilai nutrisi berdasarkan nutrientId
  static double _getNutrientValue(List<dynamic> nutrients, int nutrientId) {
    var nutrient = nutrients.firstWhere(
      (n) => n['nutrientId'] == nutrientId,
      orElse: () => null,
    );
    return _convertToDouble(nutrient?['value']);
  }
}
