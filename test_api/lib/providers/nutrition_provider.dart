import 'package:flutter/material.dart';
import '../models/nutrition.dart';
import '../services/api_service.dart';

class NutritionProvider with ChangeNotifier {
  List<Nutrition> _nutrients = [];
  bool _isLoading = false;

  List<Nutrition> get nutrients => _nutrients;
  bool get isLoading => _isLoading;

  Future<void> searchNutrition(String query) async {
    _isLoading = true;
    notifyListeners();

    _nutrients = await ApiService.fetchNutritionData(query);

    _isLoading = false;
    notifyListeners();
  }
}
