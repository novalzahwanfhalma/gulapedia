class Nutrition {
  final String name;
  final double calories;
  final double sugar;
  final double carbs;

  Nutrition({
    required this.name,
    required this.calories,
    required this.sugar,
    required this.carbs,
  });

  factory Nutrition.fromJson(Map<String, dynamic> json) {
    return Nutrition(
      name: json['name'] ?? 'Unknown',
      calories: (json['calories'] ?? 0).toDouble(),
      sugar: (json['sugar'] ?? 0).toDouble(),
      carbs: (json['carbs'] ?? 0).toDouble(),
    );
  }
}
