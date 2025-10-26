import 'package:dio/dio.dart';

abstract class AuthRepo {
  Future<Response> login(String email, String password);
  Future<Response> register(Map<String, dynamic> data);
}

class AuthRepoImpl implements AuthRepo {
  Dio dio = Dio();
  @override
  Future<Response> login(String email, String password) async {
    var result = await dio.post(
      'https://elwekala.onrender.com/user/login',
      data: {"email": email, "password": password},
    );
    return result;
  }

  @override
  Future<Response> register(Map<String, dynamic> data) async {
    var result = await dio.post(
      'https://elwekala.onrender.com/user/register',
      data: data,
    );
    return result;
  }
}
