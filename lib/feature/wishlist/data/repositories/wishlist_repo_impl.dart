import 'package:katyayani/feature/product_listing/data/models/product_item_model.dart';
import 'package:katyayani/feature/product_listing/domain/entity/product_item_entity.dart';
import 'package:katyayani/feature/wishlist/data/data_sources/wishlist_local_datasource.dart';
import 'package:katyayani/feature/wishlist/domain/repositories/wishlist_repo.dart';

class WishlistRepoImpl implements WishListRepo {
  WishlistRepoImpl({required this.wishListLocalDataSource});

  WishListLocalDataSource wishListLocalDataSource;

  @override
  void add(ProductItemEntity product) {
    wishListLocalDataSource.add(ProductItemModel.fromEntity(product));
  }

  @override
  List<ProductItemEntity> getAll() {
    return wishListLocalDataSource.getAll();
  }

  @override
  void remove(ProductItemEntity product) {
    wishListLocalDataSource.remove(ProductItemModel.fromEntity(product));
  }
}
