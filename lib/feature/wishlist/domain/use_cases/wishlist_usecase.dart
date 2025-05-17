import 'package:katyayani/feature/product_listing/domain/entity/product_item_entity.dart';
import 'package:katyayani/feature/wishlist/domain/repositories/wishlist_repo.dart';

class WishlistUseCase {
  WishlistUseCase({required this.wishlistRepo});
  final WishListRepo wishlistRepo;

  void addToWishlist(ProductItemEntity product) {
    wishlistRepo.add(product);
  }

  void removeFromWishlist(ProductItemEntity product) {
    wishlistRepo.remove(product);
  }

  List<ProductItemEntity> getWishlistItems() {
    return wishlistRepo.getAll();
  }
}
