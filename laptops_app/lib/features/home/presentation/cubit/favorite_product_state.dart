part of 'favorite_product_cubit.dart';

@immutable
sealed class FavoriteProductState {}

final class FavoriteProductInitial extends FavoriteProductState {}

class FavoriteProductLoaded extends FavoriteProductState {
  final List<ProductModel> products;

  FavoriteProductLoaded(this.products);
}

final class FavoriteProductError extends FavoriteProductState {
  final String message;

  FavoriteProductError(this.message);
}

final class FavoriteProductLoading extends FavoriteProductState {}

final class FavoriteProductAdded extends FavoriteProductState {
  final List<ProductModel> products;

  FavoriteProductAdded(this.products);
}
