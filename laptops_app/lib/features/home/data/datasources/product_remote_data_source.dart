import 'package:dio/dio.dart';

class ProductRemoteDataSource {
  Dio dio = Dio();

  Future<Response> getProducts() async {
    return await dio.get('https://elwekala.onrender.com/product/Laptops');
  }
}
