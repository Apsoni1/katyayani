import 'package:dartz/dartz.dart';
import 'package:katyayani/core/networking/network_failure.dart';
import 'package:katyayani/feature/product_listing/data/data_source/product_list_remote_data_source.dart';
import 'package:katyayani/feature/product_listing/data/models/product_item_model.dart';
import 'package:katyayani/feature/product_listing/domain/entity/product_item_entity.dart';
import 'package:katyayani/feature/product_listing/domain/repo/product_list_repo.dart';

class ProductListRepoImpl implements ProductListRepo {
  ProductListRepoImpl({required this.productListRemoteDataSource});
  final ProductListRemoteDataSource productListRemoteDataSource;

  @override
  Future<Either<NetworkFailure, List<ProductItemEntity>>> getAllProducts() async {
    final Either<NetworkFailure, List<ProductItemModel>> result =
        await productListRemoteDataSource.getAllProducts();

    return result.fold(
      (NetworkFailure failure) =>
          Left<NetworkFailure, List<ProductItemModel>>(failure),
      (List<ProductItemModel> models) {
        final List<ProductItemEntity> entities =
            models.map((ProductItemModel m) => m.toEntity()).toList();
        return Right<NetworkFailure, List<ProductItemEntity>>(entities);
      },
    );
  }
}
