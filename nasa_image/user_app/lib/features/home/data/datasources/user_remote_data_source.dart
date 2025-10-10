import 'package:dio/dio.dart';
import 'package:user_app/features/home/data/models/user_model.dart';

class UserRemoteDataSource {
  Dio dio = Dio();
  Future<List<UserModel>> getUsers() async {
    final response = await dio.get('https://randomuser.me/api/?results=10');
    return (response.data['results'] as List)
        .map((e) => UserModel.fromJson(e))
        .toList();
  }
}
