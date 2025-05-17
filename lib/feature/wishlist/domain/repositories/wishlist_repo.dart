import 'package:katyayani/feature/product_listing/domain/entity/product_item_entity.dart';

abstract class WishListRepo {
  void add(ProductItemEntity product);

  void remove(ProductItemEntity product);

  List<ProductItemEntity> getAll();
}
