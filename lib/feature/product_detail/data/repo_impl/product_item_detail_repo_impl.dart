import 'package:dartz/dartz.dart';
import 'package:katyayani/core/networking/network_failure.dart';
import 'package:katyayani/feature/product_detail/data/data_source/product_item_detail_remote_data_source.dart';
import 'package:katyayani/feature/product_detail/domain/repo/product_item_detail_repo.dart';
import 'package:katyayani/feature/product_listing/data/models/product_item_model.dart';
import 'package:katyayani/feature/product_listing/domain/entity/product_item_entity.dart';

class ProductItemDetailRepoImpl implements ProductItemDetailRepo {
  ProductItemDetailRepoImpl({required this.productItemDetailRemoteDataSource});

  final ProductItemDetailRemoteDataSource productItemDetailRemoteDataSource;

  @override
  Future<Either<NetworkFailure, ProductItemEntity>> getProductItem(
      int id) async {
    final Either<NetworkFailure, ProductItemModel> result =
        await productItemDetailRemoteDataSource.getProductItem(id);

    return result.fold(
      (NetworkFailure failure) =>
          Left<NetworkFailure, ProductItemEntity>(failure),
      (ProductItemModel models) {
        return Right<NetworkFailure, ProductItemEntity>(models);
      },
    );
  }
}
