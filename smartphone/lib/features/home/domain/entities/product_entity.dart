class ProductEntity {
  final String title;
  final double price;
  final List<String> images;
  final String description;
  final double rating;
  final String brand;

  const ProductEntity({
    required this.title,
    required this.price,
    required this.images,
    required this.description,
    required this.rating,
    required this.brand,
  });
}
