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
    return Container(
      color: AppColors.background,
      child: Selector<MainModel, bool>(
        selector: (context, model) => model.isLoading,
        builder: (context, isLoading, _) => !isLoading
            ? Container(
          height: double.infinity,
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      _buildCarouselSelector(),
                      _buildCategories(context)
                    ],
                  ),
              ),
            )
            : Container(
                height: double.infinity,
                child: Center(child: CircularProgressIndicator()),
              ),
      ),
    );
  }

  Widget _buildCategories(BuildContext context) {
    return Container(
      color: AppColors.lightGreyBg,
      height: 350,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(left: 16.0, top: 8),
                child: Text("Категории", style: Theme.of(context)
                    .textTheme
                    .subtitle,),
              ),
            ],
          ),
          Container(
            height: 300,
            child: Selector<MainModel, UnmodifiableListView<CuisineListItem>>(
                selector: (context, model) => model.cuisines,
                builder: (context, itemsList, _) => PageView.builder(
                      itemBuilder: (context, position) {
                return _buildCategoriesWidget(context, itemsList, position + 1);
                      },
                      itemCount: itemsList.length ~/ 8 + 1, // Can be null
                    )),
          ),
        ],
      ),
    );
  }

  Widget _buildCategoriesWidget(
      BuildContext context, UnmodifiableListView<CuisineListItem> items, page) {

    var constItemsInPage = 8;
    var itemsInPage = 0;


    if(items.length < constItemsInPage * page) {
      itemsInPage = items.length - constItemsInPage * (page - 1);
    } else itemsInPage = constItemsInPage;

    return Container(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.count(
            childAspectRatio: MediaQuery.of(context).size.height / 850,
            crossAxisCount: 4,
            shrinkWrap: true,
            children: List.generate(itemsInPage, (index) {
              var item = items[index + ((page - 1) * constItemsInPage)];
              return Padding(
                padding: const EdgeInsets.all(1.0),
                child: Card(
                  color: AppColors.cardBg,
                  elevation: 8,
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: SvgPicture.network(
                          item.featuredImage,
                          height: 56,
                          width: 56,
                        ),
                      ),
                      Container(
                        height: 2,
                      ),
                      Divider(
                        height: 1,
                        color: AppColors.blackText,
                      ),
                      Container(
                        height: 2,
                      ),
                      Expanded(
                        child: Align(
                          alignment: Alignment.center,
                          child: Text(
                            item.name,
                            textAlign: TextAlign.center,
                            style: Theme.of(context)
                                .textTheme
                                .subtitle
                                .copyWith(color: AppColors.blackText, fontWeight: FontWeight.w400),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            })),
      ),
    );
  }

  Widget _buildCarouselSelector() {
    return Selector<MainModel, UnmodifiableListView<dynamic>>(
        selector: (context, model) => model.carousel,
        builder: (context, itemsList, _) => CarouselWidget(itemsList).build());
  }
}
