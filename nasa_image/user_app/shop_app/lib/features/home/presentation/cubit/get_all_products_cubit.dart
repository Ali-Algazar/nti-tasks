import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:shop_app/features/home/data/datasources/product_remote_data_source.dart';
import 'package:shop_app/features/home/data/models/product_model.dart';

part 'get_all_products_state.dart';

class GetAllProductsCubit extends Cubit<GetAllProductsState> {
  GetAllProductsCubit() : super(GetAllProductsInitial());
  ProductRemoteDataSource productRemoteDataSource = ProductRemoteDataSource();

  Future<void> getAllProducts() async {
    emit(GetAllProductsLoading());
    try {
      final products = await productRemoteDataSource.getProducts();
      emit(GetAllProductsSuccess(products));
    } catch (e) {
      emit(GetAllProductsError(e.toString()));
    }
  }
}
