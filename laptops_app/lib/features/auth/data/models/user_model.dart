class UserModel {
  final String name;
  final String email;
  final String phone;
  final String nationalId;
  final String gender;
  final String? profileImage;
  final String? token;
  String? password;

  UserModel({
    this.password,
    required this.name,
    required this.email,
    required this.phone,
    required this.nationalId,
    required this.gender,
    this.profileImage,
    this.token,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      name: json['name'],
      email: json['email'],
      phone: json['phone'],
      nationalId: json['nationalId'],
      gender: json['gender'],
      profileImage: json['profileImage'],
      token: json['token'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "email": email,
      "password": password,
      "name": name,
      "phone": phone,
      "nationalId": nationalId,
      "gender": gender,
      "profileImage": profileImage,
    };
  }
}
