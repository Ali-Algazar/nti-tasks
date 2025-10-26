class CartProduct {
  final String id;
  final String name;
  final String category;
  final String status;
  final double price;
  final String description;
  final String image;
  final List<String> images;
  final String company;
  final int countInStock;
  final int sales;
  int quantity;
  double totalPrice;

  CartProduct({
    required this.id,
    required this.name,
    required this.category,
    required this.status,
    required this.price,
    required this.description,
    required this.image,
    required this.images,
    required this.company,
    required this.countInStock,
    required this.sales,
    required this.quantity,
    required this.totalPrice,
  });

  factory CartProduct.fromJson(Map<String, dynamic> json) {
    return CartProduct(
      id: json['_id'],
      name: json['name'],
      category: json['category'],
      status: json['status'],
      price: (json['price'] as num).toDouble(),
      description: json['description'],
      image: json['image'],
      images: List<String>.from(json['images']),
      company: json['company'],
      countInStock: json['countInStock'],
      sales: json['sales'],
      quantity: json['quantity'],
      totalPrice: (json['totalPrice'] as num).toDouble(),
    );
  }
}
