import 'package:dartz/dartz.dart';
import 'package:katyayani/core/networking/network_failure.dart';
import 'package:katyayani/feature/product_detail/domain/repo/product_item_detail_repo.dart';
import 'package:katyayani/feature/product_listing/domain/entity/product_item_entity.dart';

class GetProductItemDetail {
  GetProductItemDetail({required this.productItemDetailRepo});
  final ProductItemDetailRepo productItemDetailRepo;
  Future<Either<NetworkFailure, ProductItemEntity>> getProductItem(int id) {
    return productItemDetailRepo.getProductItem(id);
  }
}
