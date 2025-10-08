import 'package:dio/dio.dart';
import 'package:tshirt_app/features/home/data/models/shirt_model.dart';

class ShirtData {
  Dio _dio = Dio();
  Future<List<ShirtModel>> getShirts() async {
    final response = await _dio.get(
      'https://dummyjson.com/products/category/mens-shirts',
    );
    if (response.statusCode == 200) {
      List<dynamic> data = response.data['products'];
      return data.map((json) => ShirtModel.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load shirts');
    }
  }
}
