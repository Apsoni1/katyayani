import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:katyayani/core/constants/app_colors.dart';
import 'package:katyayani/core/constants/app_text_styles.dart';
import 'package:katyayani/feature/product_listing/domain/entity/product_item_entity.dart';
import 'package:katyayani/feature/product_listing/presentation/bloc/products_list_bloc.dart';
import 'package:katyayani/feature/product_listing/presentation/widgets/custom_search_field.dart';
import 'package:katyayani/feature/product_listing/presentation/widgets/filter_button.dart';
import 'package:katyayani/feature/product_listing/presentation/widgets/products_grid_view_body.dart';

class ProductListBody extends StatefulWidget {
  const ProductListBody({required this.products, super.key});

  final List<ProductItemEntity> products;

  @override
  State<ProductListBody> createState() => _ProductListBodyState();
}

class _ProductListBodyState extends State<ProductListBody>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    final List<String> categories = context
        .read<ProductsListBloc>()
        .allCategories; //can get context error callback
    _tabController = TabController(length: categories.length, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final List<String> categories =
        context.read<ProductsListBloc>().allCategories;
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Column(
        spacing: 22,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            spacing: 16,
            children: <Widget>[
              CustomSearchField(
                onChanged: (String value) {
                  context
                      .read<ProductsListBloc>()
                      .add(SearchProductsEvent(value));
                },
              ),
              FilterButton(onTap: () {}),
            ],
          ),
          Expanded(
            child: Column(
              spacing: 20,
              children: <Widget>[
                TabBar(
                  labelPadding: const EdgeInsets.symmetric(horizontal: 5),
                  isScrollable: true,
                  controller: _tabController,
                  indicatorColor: Colors.transparent,
                  dividerHeight: 0,
                  tabs: categories.map((String category) {
                    //use list.generate
                    final int index =
                        categories.indexOf(category); //this will be reduced
                    return TextButton(
                      style: TextButton.styleFrom(
                        padding: const EdgeInsets.symmetric(horizontal: 24),
                        backgroundColor: _tabController.index == index
                            ? AppColors.hot
                            : AppColors.description.withValues(alpha: 0.1),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                      ),
                      onPressed: () {
                        _tabController.index = index;
                        context
                            .read<ProductsListBloc>()
                            .add(FilterByCategoryEvent(category));
                      },
                      child: Text(
                        category,
                        style: _tabController.index == index
                            ? AppTextStyles.selectedTab
                            : AppTextStyles.unSelectedTab,
                      ),
                    );
                  }).toList(),
                ),
                Expanded(
                  child: TabBarView(
                    controller: _tabController,
                    children: categories
                        .map((_) =>
                            ProductsGridViewBody(products: widget.products))
                        .toList(),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
