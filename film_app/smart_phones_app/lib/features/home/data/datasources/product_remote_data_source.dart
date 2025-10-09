import 'package:dio/dio.dart';
import 'package:smart_phones_app/features/home/data/models/product_model.dart';

class ProductRemoteDataSource {
  Dio dio = Dio();
  Future<List<Product>> getAllProducts() async {
    final response = await dio.get(
      'https://dummyjson.com/products/category/smartphones',
    );

    List productsJson = response.data['products'];
    return productsJson
        .map((productJson) => Product.fromJson(productJson))
        .toList();
  }
}
