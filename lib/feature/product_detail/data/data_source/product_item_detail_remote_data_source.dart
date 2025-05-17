import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:katyayani/core/networking/network_constants.dart';
import 'package:katyayani/core/networking/network_failure.dart';
import 'package:katyayani/core/networking/network_service.dart';
import 'package:katyayani/feature/product_listing/data/models/product_item_model.dart';

abstract class ProductItemDetailRemoteDataSource {
  Future<Either<NetworkFailure, ProductItemModel>> getProductItem(int id);
}

class ProductItemDetailRemoteDataSourceImpl
    implements ProductItemDetailRemoteDataSource {
  ProductItemDetailRemoteDataSourceImpl({required this.networkService});

  final NetworkService networkService;

  @override
  Future<Either<NetworkFailure, ProductItemModel>> getProductItem(int id) async {
    final Either<NetworkFailure, Response<dynamic>> response =
        await networkService.getPath("${NetworkConstants.products}/$id");
    return response.fold(
        (NetworkFailure failure) =>
            Left<NetworkFailure, ProductItemModel>(failure),
        (Response<dynamic> response) {
      final dynamic data = response.data[NetworkConstants.product];
      final ProductItemModel productItem = ProductItemModel.fromJson(data);
      return Right<NetworkFailure, ProductItemModel>(productItem);
    });
  }
}
