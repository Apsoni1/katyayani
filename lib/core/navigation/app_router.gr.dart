// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i10;
import 'package:flutter/material.dart' as _i11;
import 'package:katyayani/feature/comments/presentation/screens/comments_screen.dart'
    as _i1;
import 'package:katyayani/feature/common/presentation/screen/home_screen.dart'
    as _i3;
import 'package:katyayani/feature/product_detail/presentation/screens/product_item_detail_screen.dart'
    as _i4;
import 'package:katyayani/feature/product_listing/presentation/screens/products_list_screen.dart'
    as _i5;
import 'package:katyayani/feature/settings/presentation/screens/settings_screen.dart'
    as _i7;
import 'package:katyayani/feature/splash/presentation/screens/splash_screen.dart'
    as _i8;
import 'package:katyayani/feature/user_profile/presentation/screens/edit_profile_screen.dart'
    as _i2;
import 'package:katyayani/feature/user_profile/presentation/screens/profile_display_info_screen.dart'
    as _i6;
import 'package:katyayani/feature/wishlist/presentation/screens/wishlist_screen.dart'
    as _i9;

abstract class $AppRouter extends _i10.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i10.PageFactory> pagesMap = {
    CommentsRoute.name: (routeData) {
      return _i10.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i1.CommentsScreen(),
      );
    },
    EditProfileRoute.name: (routeData) {
      return _i10.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i2.EditProfileScreen(),
      );
    },
    HomeRoute.name: (routeData) {
      return _i10.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i3.HomeScreen(),
      );
    },
    ProductItemDetailRoute.name: (routeData) {
      final pathParams = routeData.inheritedPathParams;
      final args = routeData.argsAs<ProductItemDetailRouteArgs>(
          orElse: () =>
              ProductItemDetailRouteArgs(index: pathParams.getInt('id')));
      return _i10.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i4.ProductItemDetailScreen(
          index: args.index,
          key: args.key,
        ),
      );
    },
    ProductsListRoute.name: (routeData) {
      return _i10.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i5.ProductsListScreen(),
      );
    },
    ProfileDisplayInfoRoute.name: (routeData) {
      return _i10.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i6.ProfileDisplayInfoScreen(),
      );
    },
    SettingsRoute.name: (routeData) {
      return _i10.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i7.SettingsScreen(),
      );
    },
    SplashRoute.name: (routeData) {
      return _i10.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i8.SplashScreen(),
      );
    },
    WishlistRoute.name: (routeData) {
      return _i10.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i9.WishlistScreen(),
      );
    },
  };
}

/// generated route for
/// [_i1.CommentsScreen]
class CommentsRoute extends _i10.PageRouteInfo<void> {
  const CommentsRoute({List<_i10.PageRouteInfo>? children})
      : super(
          CommentsRoute.name,
          initialChildren: children,
        );

  static const String name = 'CommentsRoute';

  static const _i10.PageInfo<void> page = _i10.PageInfo<void>(name);
}

/// generated route for
/// [_i2.EditProfileScreen]
class EditProfileRoute extends _i10.PageRouteInfo<void> {
  const EditProfileRoute({List<_i10.PageRouteInfo>? children})
      : super(
          EditProfileRoute.name,
          initialChildren: children,
        );

  static const String name = 'EditProfileRoute';

  static const _i10.PageInfo<void> page = _i10.PageInfo<void>(name);
}

/// generated route for
/// [_i3.HomeScreen]
class HomeRoute extends _i10.PageRouteInfo<void> {
  const HomeRoute({List<_i10.PageRouteInfo>? children})
      : super(
          HomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeRoute';

  static const _i10.PageInfo<void> page = _i10.PageInfo<void>(name);
}

/// generated route for
/// [_i4.ProductItemDetailScreen]
class ProductItemDetailRoute
    extends _i10.PageRouteInfo<ProductItemDetailRouteArgs> {
  ProductItemDetailRoute({
    required int index,
    _i11.Key? key,
    List<_i10.PageRouteInfo>? children,
  }) : super(
          ProductItemDetailRoute.name,
          args: ProductItemDetailRouteArgs(
            index: index,
            key: key,
          ),
          rawPathParams: {'id': index},
          initialChildren: children,
        );

  static const String name = 'ProductItemDetailRoute';

  static const _i10.PageInfo<ProductItemDetailRouteArgs> page =
      _i10.PageInfo<ProductItemDetailRouteArgs>(name);
}

class ProductItemDetailRouteArgs {
  const ProductItemDetailRouteArgs({
    required this.index,
    this.key,
  });

  final int index;

  final _i11.Key? key;

  @override
  String toString() {
    return 'ProductItemDetailRouteArgs{index: $index, key: $key}';
  }
}

/// generated route for
/// [_i5.ProductsListScreen]
class ProductsListRoute extends _i10.PageRouteInfo<void> {
  const ProductsListRoute({List<_i10.PageRouteInfo>? children})
      : super(
          ProductsListRoute.name,
          initialChildren: children,
        );

  static const String name = 'ProductsListRoute';

  static const _i10.PageInfo<void> page = _i10.PageInfo<void>(name);
}

/// generated route for
/// [_i6.ProfileDisplayInfoScreen]
class ProfileDisplayInfoRoute extends _i10.PageRouteInfo<void> {
  const ProfileDisplayInfoRoute({List<_i10.PageRouteInfo>? children})
      : super(
          ProfileDisplayInfoRoute.name,
          initialChildren: children,
        );

  static const String name = 'ProfileDisplayInfoRoute';

  static const _i10.PageInfo<void> page = _i10.PageInfo<void>(name);
}

/// generated route for
/// [_i7.SettingsScreen]
class SettingsRoute extends _i10.PageRouteInfo<void> {
  const SettingsRoute({List<_i10.PageRouteInfo>? children})
      : super(
          SettingsRoute.name,
          initialChildren: children,
        );

  static const String name = 'SettingsRoute';

  static const _i10.PageInfo<void> page = _i10.PageInfo<void>(name);
}

/// generated route for
/// [_i8.SplashScreen]
class SplashRoute extends _i10.PageRouteInfo<void> {
  const SplashRoute({List<_i10.PageRouteInfo>? children})
      : super(
          SplashRoute.name,
          initialChildren: children,
        );

  static const String name = 'SplashRoute';

  static const _i10.PageInfo<void> page = _i10.PageInfo<void>(name);
}

/// generated route for
/// [_i9.WishlistScreen]
class WishlistRoute extends _i10.PageRouteInfo<void> {
  const WishlistRoute({List<_i10.PageRouteInfo>? children})
      : super(
          WishlistRoute.name,
          initialChildren: children,
        );

  static const String name = 'WishlistRoute';

  static const _i10.PageInfo<void> page = _i10.PageInfo<void>(name);
}
