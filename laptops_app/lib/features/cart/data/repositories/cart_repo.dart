import 'package:laptops_app/features/cart/data/datasources/ramote_data.dart';
import 'package:laptops_app/features/cart/data/model/cart_item_model.dart';

abstract class CartRepo {
  Future<String> addToCart(String productId);
  Future<void> removeFromCart(String productId);
  Future<List<CartProduct>> getCartProducts();
  Future<String?> updateCart(String productId, int quantity);
}

class CartRepoImpl implements CartRepo {
  CartRamoteData cartRamoteData = CartRamoteData();
  @override
  Future<String> addToCart(String productId) async {
    var result = await cartRamoteData.addCard(productId);
    return result;
  }

  @override
  Future<void> removeFromCart(String productId) async {
    await cartRamoteData.removeCard(productId);
  }

  @override
  Future<List<CartProduct>> getCartProducts() async {
    var result = await cartRamoteData.getProducts();
    var list = result.data['products'];
    List<CartProduct> products = [];
    for (var element in list) {
      products.add(CartProduct.fromJson(element));
    }
    return products;
  }

  @override
  Future<String?> updateCart(String productId, int quantity) async {
    var result = await cartRamoteData.updateProducts(productId, quantity);
    return result.data['message'];
  }
}
