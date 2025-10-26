class UserEntity {
  final String firstName;
  final String lastName;
  final String email;
  final String phone;
  final String picture;
  final String age;
  final String country;

  const UserEntity({
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.phone,
    required this.picture,
    required this.age,
    required this.country,
  });

  factory UserEntity.fromJson(Map<String, dynamic> json) {
    return UserEntity(
      firstName: json['name']['first'],
      lastName: json['name']['last'],
      email: json['email'],
      phone: json['phone'],
      picture: json['picture']['large'],
      age: json['dob']['age'].toString(),
      country: json['location']['country'],
    );
  }
}
