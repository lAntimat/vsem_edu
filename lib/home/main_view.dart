import 'dart:collection';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:vsem_edu/common/app_colors.dart';
import 'package:vsem_edu/home/carousel_widget.dart';
import 'package:vsem_edu/home/todo_list_model.dart';

import 'home_models.dart';

class MainView extends StatelessWidget {
  const MainView();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: <Widget>[
          _buildCarouselSelector(),
          _buildCategories()],
      ),
    );
  }

  Widget _buildCategories() {
    return Selector<MainModel, UnmodifiableListView<CuisineListItem>>(
        selector: (context, model) => model.cuisines,
        builder: (context, itemsList, _) => Expanded(
                child: PageView.builder(
              itemBuilder: (context, position) {
                return Center(
                    child:
                        _buildCategoriesWidget(context, itemsList, position));
              },
              itemCount: 5, // Can be null
            )));
  }

  Widget _buildCategoriesWidget(
      BuildContext context, UnmodifiableListView<CuisineListItem> items, page) {
    return GridView.count(
        childAspectRatio: MediaQuery.of(context).size.height / 900,
        crossAxisCount: 4,
        children: List.generate(8, (index) {
          var item = items[index];
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: 250,
              child: Card(
                color: AppColors.cardBg,
                elevation: 8,
                child: Column(
                  children: [
                    SvgPicture.network(
                      item.featuredImage,
                      height: 64,
                      width: 64,
                    ),
                    Divider(
                      height: 1,
                    ),
                    Container(
                      height: 8,
                    ),
                    Text(
                      'Item $index',
                      style: Theme.of(context)
                          .textTheme
                          .subtitle
                          .copyWith(color: AppColors.blackText),
                    ),
                  ],
                ),
              ),
            ),
          );
        }));
  }

  Widget _buildCarouselSelector() {
    return Selector<MainModel, UnmodifiableListView<dynamic>>(
        selector: (context, model) => model.carousel,
        builder: (context, itemsList, _) => CarouselWidget(itemsList).build());
  }
}
