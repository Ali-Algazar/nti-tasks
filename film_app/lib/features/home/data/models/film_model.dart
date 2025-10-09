class Film {
  final String id;
  final String title;
  final String originalTitle;
  final String originalTitleRomanised;
  final String image;
  final String movieBanner;
  final String description;
  final String director;
  final String producer;
  final String releaseDate;
  final int? runningTime;
  final int? rtScore;
  final List<String> people;
  final List<String> species;
  final List<String> locations;
  final List<String> vehicles;
  final String url;

  Film({
    required this.id,
    required this.title,
    required this.originalTitle,
    required this.originalTitleRomanised,
    required this.image,
    required this.movieBanner,
    required this.description,
    required this.director,
    required this.producer,
    required this.releaseDate,
    this.runningTime,
    this.rtScore,
    required this.people,
    required this.species,
    required this.locations,
    required this.vehicles,
    required this.url,
  });

  factory Film.fromJson(Map<String, dynamic> json) {
    int? tryParseInt(dynamic value) {
      if (value == null) return null;
      if (value is int) return value;
      if (value is String) {
        final cleaned = value.trim();
        if (cleaned.isEmpty) return null;
        return int.tryParse(cleaned);
      }
      return null;
    }

    List<String> parseStringList(dynamic v) {
      if (v == null) return <String>[];
      if (v is List)
        return v
            .map((e) => e?.toString() ?? '')
            .where((s) => s.isNotEmpty)
            .toList();
      if (v is String && v.isNotEmpty) return [v];
      return <String>[];
    }

    return Film(
      id: json['id']?.toString() ?? '',
      title: json['title']?.toString() ?? '',
      originalTitle: json['original_title']?.toString() ?? '',
      originalTitleRomanised:
          json['original_title_romanised']?.toString() ?? '',
      image: json['image']?.toString() ?? '',
      movieBanner: json['movie_banner']?.toString() ?? '',
      description: json['description']?.toString() ?? '',
      director: json['director']?.toString() ?? '',
      producer: json['producer']?.toString() ?? '',
      releaseDate: json['release_date']?.toString() ?? '',
      runningTime: tryParseInt(json['running_time']),
      rtScore: tryParseInt(json['rt_score']),
      people: parseStringList(json['people']),
      species: parseStringList(json['species']),
      locations: parseStringList(json['locations']),
      vehicles: parseStringList(json['vehicles']),
      url: json['url']?.toString() ?? '',
    );
  }
}
