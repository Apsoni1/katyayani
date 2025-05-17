import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:katyayani/core/constants/app_assets.dart';
import 'package:katyayani/core/constants/app_colors.dart';
import 'package:katyayani/core/navigation/app_router.gr.dart';
import 'package:katyayani/feature/common/presentation/widgets/custom_bottom_navigation.dart';

@RoutePage()
class HomeScreen extends StatelessWidget {
  //bloc provider should be here only
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AutoTabsScaffold(
      routes: const <PageRouteInfo<dynamic>>[
        ProductsListRoute(),
        ProfileDisplayInfoRoute(),
        CommentsRoute(),
        WishlistRoute(),
      ],
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        shape: const CircleBorder(),
        backgroundColor: AppColors.hot,
        child: Image.asset(
          AppAssets.add,
          width: 14,
          height: 14,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBuilder: (BuildContext context, _) {
        final TabsRouter tabsRouter = AutoTabsRouter.of(context);
        return Builder(
          builder: (BuildContext context) => CustomBottomNavigation(
            activeIndex: tabsRouter.activeIndex,
            onTap: tabsRouter.setActiveIndex,
          ),
        );
      },
    );
  }
}
