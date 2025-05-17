import 'package:dartz/dartz.dart';
import 'package:katyayani/core/networking/network_failure.dart';
import 'package:katyayani/feature/product_listing/domain/entity/product_item_entity.dart';
import 'package:katyayani/feature/product_listing/domain/repo/product_list_repo.dart';

class GetAllProductsList {
  GetAllProductsList({required this.productListRepo});
  final ProductListRepo productListRepo;
  Future<Either<NetworkFailure, List<ProductItemEntity>>> getAllProductsList() {
    return productListRepo.getAllProducts();
  }
}
