import 'package:dartz/dartz.dart';
import 'package:katyayani/core/networking/network_failure.dart';
import 'package:katyayani/feature/product_listing/domain/entity/product_item_entity.dart';

abstract class ProductListRepo {
  Future<Either<NetworkFailure, List<ProductItemEntity>>> getAllProducts();
}
