class Recipe {
  const Recipe({
    required this.title,
    required this.imageUrl,
    this.isBookmarked = false,
  });
  final String title;
  final String imageUrl;
  final bool isBookmarked;
}

const recipes = [
  Recipe(
    title: 'Pecel Sayur',
    imageUrl: 'https://picsum.photos/200?random=1',
    isBookmarked: false,
  ),
  Recipe(
    title: 'Sayur Asam Jawa',
    imageUrl: 'https://picsum.photos/200?random=2',
    isBookmarked: false,
  ),
  Recipe(
    title: 'Bubur Ayam',
    imageUrl: 'https://picsum.photos/200?random=3',
    isBookmarked: true,
  ),
];
