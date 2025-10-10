import 'package:dio/dio.dart';
import 'package:shop_app/features/home/data/models/product_model.dart';

class ProductRemoteDataSource {
  Dio dio = Dio();

  Future<List<ProductModel>> getProducts() async {
    final response = await dio.get(
      'https://fakestoreapi.com/products/category/electronics',
    );
    return (response.data as List)
        .map((e) => ProductModel.fromJson(e))
        .toList();
  }
}
