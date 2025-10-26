import 'package:smartphone/features/people/domain/entities/user_entity.dart';

class UserModel extends UserEntity {
  final String gender;
  final Name name;
  final Location location;
  final Login login;
  final Dob dob;
  final Registered registered;
  final String cell;
  final Id idCard;
  final Picture pictureData;
  final String nat;

  UserModel({
    required this.gender,
    required this.name,
    required this.location,
    required this.login,
    required this.dob,
    required this.registered,
    required this.cell,
    required this.idCard,
    required this.pictureData,
    required this.nat,

    // قيم الـ Entity
    required super.firstName,
    required super.lastName,
    required super.email,
    required super.phone,
    required super.picture,
    required super.age,
    required super.country,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    final nameData = Name.fromJson(json['name']);
    final dobData = Dob.fromJson(json['dob']);
    final locationData = Location.fromJson(json['location']);
    final pictureData = Picture.fromJson(json['picture']);

    return UserModel(
      gender: json['gender'],
      name: nameData,
      location: locationData,
      login: Login.fromJson(json['login']),
      dob: dobData,
      registered: Registered.fromJson(json['registered']),
      cell: json['cell'],
      idCard: Id.fromJson(json['id']),
      pictureData: pictureData,
      nat: json['nat'],

      // القيم الأساسية الخاصة بالـ Entity
      firstName: nameData.first,
      lastName: nameData.last,
      email: json['email'],
      phone: json['phone'],
      picture: pictureData.large,
      age: dobData.age.toString(),
      country: locationData.country,
    );
  }
}

class Name {
  final String title;
  final String first;
  final String last;

  Name({required this.title, required this.first, required this.last});

  factory Name.fromJson(Map<String, dynamic> json) {
    return Name(title: json['title'], first: json['first'], last: json['last']);
  }
}

class Location {
  final Street street;
  final String city;
  final String state;
  final String country;
  final int postcode;
  final Coordinates coordinates;
  final Timezone timezone;

  Location({
    required this.street,
    required this.city,
    required this.state,
    required this.country,
    required this.postcode,
    required this.coordinates,
    required this.timezone,
  });

  factory Location.fromJson(Map<String, dynamic> json) {
    return Location(
      street: Street.fromJson(json['street']),
      city: json['city'],
      state: json['state'],
      country: json['country'],
      postcode: json['postcode'],
      coordinates: Coordinates.fromJson(json['coordinates']),
      timezone: Timezone.fromJson(json['timezone']),
    );
  }
}

class Street {
  final int number;
  final String name;

  Street({required this.number, required this.name});

  factory Street.fromJson(Map<String, dynamic> json) {
    return Street(number: json['number'], name: json['name']);
  }
}

class Coordinates {
  final String latitude;
  final String longitude;

  Coordinates({required this.latitude, required this.longitude});

  factory Coordinates.fromJson(Map<String, dynamic> json) {
    return Coordinates(
      latitude: json['latitude'],
      longitude: json['longitude'],
    );
  }
}

class Timezone {
  final String offset;
  final String description;

  Timezone({required this.offset, required this.description});

  factory Timezone.fromJson(Map<String, dynamic> json) {
    return Timezone(offset: json['offset'], description: json['description']);
  }
}

class Login {
  final String uuid;
  final String username;
  final String password;
  final String salt;
  final String md5;
  final String sha1;
  final String sha256;

  Login({
    required this.uuid,
    required this.username,
    required this.password,
    required this.salt,
    required this.md5,
    required this.sha1,
    required this.sha256,
  });

  factory Login.fromJson(Map<String, dynamic> json) {
    return Login(
      uuid: json['uuid'],
      username: json['username'],
      password: json['password'],
      salt: json['salt'],
      md5: json['md5'],
      sha1: json['sha1'],
      sha256: json['sha256'],
    );
  }
}

class Dob {
  final DateTime date;
  final int age;

  Dob({required this.date, required this.age});

  factory Dob.fromJson(Map<String, dynamic> json) {
    return Dob(date: DateTime.parse(json['date']), age: json['age']);
  }
}

class Registered {
  final DateTime date;
  final int age;

  Registered({required this.date, required this.age});

  factory Registered.fromJson(Map<String, dynamic> json) {
    return Registered(date: DateTime.parse(json['date']), age: json['age']);
  }
}

class Id {
  final String name;
  final String value;

  Id({required this.name, required this.value});

  factory Id.fromJson(Map<String, dynamic> json) {
    return Id(name: json['name'], value: json['value']);
  }
}

class Picture {
  final String large;
  final String medium;
  final String thumbnail;

  Picture({required this.large, required this.medium, required this.thumbnail});

  factory Picture.fromJson(Map<String, dynamic> json) {
    return Picture(
      large: json['large'],
      medium: json['medium'],
      thumbnail: json['thumbnail'],
    );
  }
}
