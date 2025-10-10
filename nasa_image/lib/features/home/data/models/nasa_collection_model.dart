class NasaItem {
  final String imageUrl;
  final String title;
  final DateTime dateCreated;

  NasaItem({
    required this.imageUrl,
    required this.title,
    required this.dateCreated,
  });

  factory NasaItem.fromJson(Map<String, dynamic> json) {
    return NasaItem(
      imageUrl: json['links'] != null && json['links'].isNotEmpty
          ? json['links'][0]['href'] ?? ''
          : '',
      title: json['data'] != null && json['data'].isNotEmpty
          ? json['data'][0]['title'] ?? ''
          : '',
      dateCreated:
          DateTime.tryParse(
            json['data'] != null && json['data'].isNotEmpty
                ? json['data'][0]['date_created'] ?? ''
                : '',
          ) ??
          DateTime.now(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'imageUrl': imageUrl,
      'title': title,
      'dateCreated': dateCreated.toIso8601String(),
    };
  }
}
