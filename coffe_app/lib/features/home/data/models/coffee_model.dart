class CoffeModel {
  final String title;
  final String description;

  final String image;

  CoffeModel({
    required this.title,
    required this.description,

    required this.image,
  });

  factory CoffeModel.fromJson(Map<String, dynamic> json) {
    return CoffeModel(
      title: json['title'] as String,
      description: json['description'] as String,

      image: json['image'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {'title': title, 'description': description, 'image': image};
  }
}
