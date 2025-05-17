import 'package:katyayani/feature/product_listing/data/models/product_item_model.dart';

abstract class WishListLocalDataSource {
  void add(ProductItemModel food);

  void remove(ProductItemModel food);

  List<ProductItemModel> getAll();
}

class WishListLocalDataSourceImpl extends WishListLocalDataSource {
  final List<ProductItemModel> _foods = <ProductItemModel>[];

  @override
  void add(ProductItemModel food) {
    _foods.add(food);
  }

  @override
  void remove(ProductItemModel food) {
    _foods.remove(food);
  }

  @override
  List<ProductItemModel> getAll() {
    return _foods;
  }
}
