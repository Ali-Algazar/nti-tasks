import 'package:bloc/bloc.dart';
import 'package:laptops_app/features/cart/data/model/cart_item_model.dart';
import 'package:laptops_app/features/cart/data/repositories/cart_repo.dart';
import 'package:meta/meta.dart';

part 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit() : super(CartInitial());
  CartRepo cartRepo = CartRepoImpl();

  Future<String> addToCart(String productId) async {
    emit(CartLoading());
    try {
      var result = await cartRepo.addToCart(productId);
      if (result == 'All products data retrieved successfully') {
        emit(CartLoaded(products: await cartRepo.getCartProducts()));
      }
      return result;
    } on Exception catch (e) {
      emit(CartError(message: e.toString()));
      return e.toString();
    }
  }

  Future<void> updateCart(String productId, int quantity) async {
    emit(CartLoading());
    try {
      var result = await cartRepo.updateCart(productId, quantity);
      if (result == null) {
        emit(CartLoaded(products: await cartRepo.getCartProducts()));
      }
    } on Exception catch (e) {
      emit(CartError(message: e.toString()));
    }
  }

  Future<void> removeFromCart(String productId) async {
    emit(CartLoading());
    try {
      await cartRepo.removeFromCart(productId);

      emit(CartLoaded(products: await cartRepo.getCartProducts()));
    } on Exception catch (e) {
      emit(CartError(message: e.toString()));
    }
  }

  Future<void> getCartProducts() async {
    emit(CartLoading());
    try {
      var result = await cartRepo.getCartProducts();
      emit(CartLoaded(products: result));
    } on Exception catch (e) {
      emit(CartError(message: e.toString()));
    }
  }
}
