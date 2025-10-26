import 'package:dio/dio.dart';
import 'package:laptops_app/core/services/shared_preferences_service.dart';
import 'package:laptops_app/features/home/data/models/product_model.dart';

class FavoriteRemoteDataSource {
  Dio dio = Dio();
  Future<List<ProductModel>> getFavoriteProduct() async {
    var result = await dio.get(
      'https://elwekala.onrender.com/favorite',
      data: {"nationalId": SharedPreferencesService.getData(key: 'nationalId')},
    );
    var list = result.data['favoriteProducts'];
    print(result.data);
    print(list);
    List<ProductModel> products = [];
    for (var element in list) {
      products.add(ProductModel.fromJson(element));
    }
    return products;
  }

  Future<List<ProductModel>> addFavoriteProduct(String id) async {
    await dio.post(
      'https://elwekala.onrender.com/favorite',
      data: {
        "nationalId": SharedPreferencesService.getData(key: 'nationalId'),
        "productId": id,
      },
    );
    var result = await getFavoriteProduct();
    return result;
  }
}
