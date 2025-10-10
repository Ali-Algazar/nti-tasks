class UserModel {
  final String fullName;
  final String email;
  final String phone;
  final String gender;
  final String city;
  final String country;
  final String largeImage;
  final DateTime dateOfBirth;
  final DateTime registeredDate;
  final double latitude;
  final double longitude;

  UserModel({
    required this.fullName,
    required this.email,
    required this.phone,
    required this.gender,
    required this.city,
    required this.country,
    required this.largeImage,
    required this.dateOfBirth,
    required this.registeredDate,
    required this.latitude,
    required this.longitude,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    final name = json['name'];
    final location = json['location'];
    final picture = json['picture'];
    final coordinates = location['coordinates'];

    return UserModel(
      fullName: "${name['first']} ${name['last']}",
      email: json['email'] ?? '',
      phone: json['phone'] ?? '',
      gender: json['gender'] ?? '',
      city: location['city'] ?? '',
      country: location['country'] ?? '',
      largeImage: picture['large'] ?? '',
      dateOfBirth:
          DateTime.tryParse(json['dob']['date'] ?? '') ?? DateTime.now(),
      registeredDate:
          DateTime.tryParse(json['registered']['date'] ?? '') ?? DateTime.now(),
      latitude: double.tryParse(coordinates['latitude'] ?? '0') ?? 0.0,
      longitude: double.tryParse(coordinates['longitude'] ?? '0') ?? 0.0,
    );
  }
}
