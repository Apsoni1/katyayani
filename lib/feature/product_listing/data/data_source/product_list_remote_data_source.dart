import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:katyayani/core/networking/network_constants.dart';
import 'package:katyayani/core/networking/network_failure.dart';
import 'package:katyayani/core/networking/network_service.dart';
import 'package:katyayani/feature/product_listing/data/models/product_item_model.dart';

abstract class ProductListRemoteDataSource {
  Future<Either<NetworkFailure, List<ProductItemModel>>> getAllProducts();
}

class ProductListRemoteDataSourceImpl implements ProductListRemoteDataSource {
  ProductListRemoteDataSourceImpl({required this.networkService});

  final NetworkService networkService;

  @override
  Future<Either<NetworkFailure, List<ProductItemModel>>> getAllProducts() async {
    final Either<NetworkFailure, Response<dynamic>> response =
        await networkService.getPath(NetworkConstants.products);
    return response.fold(
        (NetworkFailure failure) =>
            Left<NetworkFailure, List<ProductItemModel>>(failure),
        (Response<dynamic> response) {
      final List<dynamic> data = response.data[NetworkConstants.products];
      final List<ProductItemModel> list =
          data.map((dynamic json) => ProductItemModel.fromJson(json)).toList();
      return Right<NetworkFailure, List<ProductItemModel>>(list);
    });
  }
}
