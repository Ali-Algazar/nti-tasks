import 'package:bloc/bloc.dart';
import 'package:laptops_app/features/home/data/models/product_model.dart';
import 'package:laptops_app/features/home/data/repositories/get_product_repo.dart';
import 'package:laptops_app/features/home/data/repositories/get_product_repo_imple.dart';
import 'package:meta/meta.dart';

part 'get_products_state.dart';

class GetProductsCubit extends Cubit<GetProductsState> {
  GetProductsCubit() : super(GetProductsInitial());
  GetProductRepo getProductRepo = GetProductRepoImple();

  Future<void> getProduct() async {
    emit(GetProductsLoading());
    var result = await getProductRepo.getProduct();
    result.fold(
      (l) => emit(GetProductsError(l.message)),
      (r) => emit(GetProductsLoaded(r)),
    );
  }
}
