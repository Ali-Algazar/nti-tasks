import 'package:dio/dio.dart';
import 'package:laptops_app/core/services/shared_preferences_service.dart';

class CartRamoteData {
  Dio dio = Dio();

  Future<Response> getProducts() async {
    return await dio.get(
      'https://elwekala.onrender.com/cart/allproducts',
      data: {"nationalId": SharedPreferencesService.getData(key: 'nationalId')},
    );
  }

  Future<String> addCard(String id) async {
    var result = await dio.post(
      'https://elwekala.onrender.com/cart/add',
      data: {
        "nationalId": SharedPreferencesService.getData(key: 'nationalId'),
        "productId": id,
        "quantity": "1",
      },
    );
    return result.data['message'];
  }

  Future<void> removeCard(String id) async {
    await dio.delete(
      'https://elwekala.onrender.com/cart/delete',
      data: {
        "nationalId": SharedPreferencesService.getData(key: 'nationalId'),
        "productId": id,
        "quantity": "1",
      },
    );
    // return result.data['message'];
  }

  Future<Response> updateProducts(String productId, int quantity) async {
    return await dio.put(
      'https://elwekala.onrender.com/cart',
      data: {
        "nationalId": SharedPreferencesService.getData(key: 'nationalId'),
        "productId": productId,
        "quantity": quantity,
      },
    );
  }
}
