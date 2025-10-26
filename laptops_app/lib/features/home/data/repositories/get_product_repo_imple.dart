import 'package:dartz/dartz.dart';
import 'package:laptops_app/core/errors/failures.dart';
import 'package:laptops_app/features/home/data/datasources/product_remote_data_source.dart';
import 'package:laptops_app/features/home/data/models/product_model.dart';
import 'package:laptops_app/features/home/data/repositories/get_product_repo.dart';

class GetProductRepoImple extends GetProductRepo {
  ProductRemoteDataSource productRemoteDataSource = ProductRemoteDataSource();

  @override
  Future<Either<Failure, List<ProductModel>>> getProduct() async {
    try {
      var result = await productRemoteDataSource.getProducts();

      var list = result.data['product'];

      List<ProductModel> products = [];

      for (var element in list) {
        products.add(ProductModel.fromJson(element));
      }

      return right(products);
    } catch (e) {
      return left(ServerFailure(e.toString()));
    }
  }
}
