import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:smart_phones_app/features/home/data/datasources/product_remote_data_source.dart';
import 'package:smart_phones_app/features/home/data/models/product_model.dart';

part 'get_all_products_state.dart';

class GetAllProductsCubit extends Cubit<GetAllProductsState> {
  GetAllProductsCubit() : super(GetAllProductsInitial());
  ProductRemoteDataSource productRemoteDataSource = ProductRemoteDataSource();
  Future<void> getAllProducts() async {
    emit(GetAllProductsLoading());
    try {
      var products = await productRemoteDataSource.getAllProducts();
      emit(GetAllProductsSuccess(products));
    } catch (e) {
      emit(GetAllProductsFailure(e.toString()));
    }
  }
}
