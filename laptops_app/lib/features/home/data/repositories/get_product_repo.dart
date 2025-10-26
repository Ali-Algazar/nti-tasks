import 'package:dartz/dartz.dart';
import 'package:laptops_app/core/errors/failures.dart';
import 'package:laptops_app/features/home/data/models/product_model.dart';

abstract class GetProductRepo {
  Future<Either<Failure, List<ProductModel>>> getProduct();
}
