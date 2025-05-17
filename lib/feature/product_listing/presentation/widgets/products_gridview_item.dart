import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:katyayani/core/constants/app_assets.dart';
import 'package:katyayani/core/constants/app_colors.dart';
import 'package:katyayani/core/constants/app_text_styles.dart';
import 'package:katyayani/core/navigation/app_router.gr.dart';
import 'package:katyayani/feature/common/presentation/widgets/rating_row.dart';
import 'package:katyayani/feature/product_listing/domain/entity/product_item_entity.dart';
import 'package:katyayani/feature/wishlist/presentation/bloc/wishlist_bloc.dart';

class ProductsGridviewItem extends StatelessWidget {
  const ProductsGridviewItem({required this.product, super.key});

  final ProductItemEntity product;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        context.pushRoute(ProductItemDetailRoute(index: product.id));
      },
      child: Card(
        color: AppColors.white,
        elevation: 3,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              AspectRatio(
                aspectRatio: 1, //redundant  could have given warnig by lints
                child: Image.network(
                  product.image,
                  fit: BoxFit.cover,
                  loadingBuilder: (
                    BuildContext context,
                    Widget child,
                    ImageChunkEvent? loadingProgress,
                  ) {
                    if (loadingProgress == null) {
                      return child;
                    } else {
                      return Center(
                        child: CircularProgressIndicator(
                          color: AppColors.hot,
                          value: loadingProgress.expectedTotalBytes != null
                              ? loadingProgress.cumulativeBytesLoaded /
                                  (loadingProgress.expectedTotalBytes ?? 1)
                              : null,
                        ),
                      );
                    }
                  },
                  errorBuilder: (
                    BuildContext context,
                    Object error,
                    StackTrace? stackTrace,
                  ) {
                    return const Center(
                      child: Icon(
                        Icons.error,
                        color: Colors.red,
                        size: 50,
                      ),
                    );
                  },
                ),
              ),
              Text(
                product.title,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: AppTextStyles.gridItemTitle,
              ),
              const SizedBox(
                height: 1,
              ),
              Text(
                product.model,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: AppTextStyles.gridItemSubTitle,
              ),
              const SizedBox(
                height: 6,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  const RatingRow(),
                  BlocBuilder<WishlistBloc, WishlistState>(
                    builder: (BuildContext context, WishlistState state) {
                      //bloc selector
                      final bool isWished = state is WishlistLoaded &&
                          state.items
                              .any((ProductItemEntity item) => item.id == product.id);

                      return InkWell(
                        onTap: () {
                          if (isWished) {
                            context
                                .read<WishlistBloc>()
                                .add(RemoveFromWishlist(product));
                          } else {
                            context
                                .read<WishlistBloc>()
                                .add(AddToWishlist(product));
                          }
                        },
                        child: Image.asset(
                          isWished ? AppAssets.filledHeart : AppAssets.heart,
                          color: isWished ? AppColors.hot : AppColors.title,
                          width: 20,
                          height: 20,
                        ),
                      );
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
