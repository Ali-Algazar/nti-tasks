import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:laptops_app/features/favorite/data/datasources/favorite_remote_data_source.dart';
import 'package:laptops_app/features/home/data/models/product_model.dart';
import 'package:meta/meta.dart';

part 'favorite_product_state.dart';

class FavoriteProductCubit extends Cubit<FavoriteProductState> {
  FavoriteProductCubit() : super(FavoriteProductInitial());
  FavoriteRemoteDataSource favoriteRemoteDataSource =
      FavoriteRemoteDataSource();

  Future<void> addFavoriteProduct(String id) async {
    emit(FavoriteProductLoading());
    try {
      var result = await favoriteRemoteDataSource.addFavoriteProduct(id);
      emit(FavoriteProductLoaded(result));
    } catch (e) {
      emit(FavoriteProductError(e.toString()));
    }
  }

  Future<void> getFavoriteProduct() async {
    emit(FavoriteProductLoading());

    try {
      var result = await favoriteRemoteDataSource.getFavoriteProduct();
      emit(FavoriteProductLoaded(result));
      print(result);
    } catch (e) {
      emit(FavoriteProductError(e.toString()));
      log(e.toString());
    }
  }
}
