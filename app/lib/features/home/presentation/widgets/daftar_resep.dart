import 'package:flutter/material.dart';
import 'package:app/features/home/models/recipe.dart';

class RecipeListBuilder extends StatelessWidget {
  final List<Recipe> recipes;
  final Function(int index) onViewRecipe;
  final Function(int index) onBookmarkToggle;

  const RecipeListBuilder({
    super.key,
    required this.recipes,
    required this.onViewRecipe,
    required this.onBookmarkToggle,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: recipes.length,
      itemBuilder: (context, index) {
        final recipe = recipes[index];
        return RecipeCard(
          imageUrl: recipe.imageUrl,
          title: recipe.title,
          isBookmarked: recipe.isBookmarked,
          onViewRecipe: () => onViewRecipe(index),
          onBookmark: () => onBookmarkToggle(index),
        );
      },
    );
  }
}

class RecipeCard extends StatelessWidget {
  const RecipeCard({
    super.key,
    required this.imageUrl,
    required this.title,
    required this.onViewRecipe,
    required this.onBookmark,
    this.isBookmarked = false,
  });

  final String imageUrl;
  final String title;
  final bool isBookmarked;
  final VoidCallback onViewRecipe;
  final VoidCallback onBookmark;

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.network(
                imageUrl,
                width: 80,
                height: 80,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      ElevatedButton(
                        onPressed: onViewRecipe,
                        child: const Text("Lihat resep"),
                      ),
                      const Spacer(),
                      IconButton(
                        icon: Icon(
                          isBookmarked ? Icons.bookmark : Icons.bookmark_border,
                        ),
                        onPressed: onBookmark,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
