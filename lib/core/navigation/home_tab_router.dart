import 'package:auto_route/auto_route.dart';
import 'package:katyayani/core/navigation/app_router.dart';
import 'package:katyayani/core/navigation/app_router.gr.dart';
import 'package:katyayani/core/navigation/route_paths.dart';

class HomeTabRouter extends AppRouter {
  @override
  List<AutoRoute> get routes => <AutoRoute>[
        AutoRoute(
          page: ProductsListRoute.page,
          path: RoutePaths.foods,
        ),
        AutoRoute(
          page: ProfileDisplayInfoRoute.page,
          path: RoutePaths.profileDisplay,
        ),
        AutoRoute(
          page: CommentsRoute.page,
          path: RoutePaths.comments,
        ),
        AutoRoute(
          page: WishlistRoute.page,
          path: RoutePaths.wishlist,
        ),
      ];
}
