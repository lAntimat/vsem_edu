import 'dart:collection';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';
import 'package:vsem_edu/common/app_colors.dart';
import 'package:vsem_edu/common/theme.dart';
import 'package:vsem_edu/common/widgets/progress_bar.dart';
import 'package:vsem_edu/ui/home/main_model.dart';

import 'carousel_widget.dart';
import 'home_models.dart';
import '../../network/models/merchant_models.dart';

class MainView extends StatelessWidget {
  const MainView();

  @override
  Widget build(BuildContext context) {
    return Container(
        color: AppColors.background,
        child: Container(
          height: double.infinity,
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                _buildCarouselSelector(),
                _buildCategories(context),
                _buildCafePages()
              ],
            ),
          ),
        ));
  }

  Widget _buildCategories(BuildContext context) {
    return Container(
      color: AppColors.lightGreyBg,
      height: 300,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(left: 16.0, top: 8),
                child: Text(
                  "Категории",
                  style: Theme.of(context).textTheme.subtitle,
                ),
              ),
            ],
          ),
          Container(
            height: 265,
            child: Selector<MainModel, UnmodifiableListView<CuisineListItem>>(
                selector: (context, model) => model.cuisines,
                builder: (context, itemsList, _) => PageView.builder(
                      itemBuilder: (context, position) {
                        return _buildCategoriesWidget(
                            context, itemsList, position + 1);
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

    if (items.length < constItemsInPage * page) {
      itemsInPage = items.length - constItemsInPage * (page - 1);
    } else
      itemsInPage = constItemsInPage;

    return Container(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.count(
            childAspectRatio: MediaQuery.of(context).size.height / 850,
            crossAxisCount: 4,
            shrinkWrap: true,
            primary: false,
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
                                .copyWith(
                                    color: AppColors.blackText,
                                    fontWeight: FontWeight.w400),
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
    return Consumer<MainModel>(
      builder: (context, model, _) => model.carousel.length > 0
          ? CarouselWidget(model.carousel).build()
          : Container(
              height: 200,
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: ProgressBar(),
              ),
            ),
    );
  }

  Widget _buildCafePages() {
    return Column(
      children: <Widget>[
        Padding(
          padding:
              const EdgeInsets.only(left: 16.0, right: 16.0, top: 8, bottom: 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                "Лента ресторанов и кафе",
                style: TextStyle(color: AppColors.blackText, fontSize: 18.0),
              ),
              Container(
                padding: EdgeInsets.all(4),
                color: AppColors.btnBg1,
                child: Text("Все рестораны"),
              )
            ],
          ),
        ),
        Container(
          height: 200,
          child: Consumer<MainModel>(
              builder: (context, model, _) => PageView.builder(
                    itemBuilder: (context, position) {
                      return _buildCafeList(context, model.cafes, position + 1);
                    },
                    itemCount: model.cafes.length ~/ 3 + 1, // Can be null
                  )),
        ),
      ],
    );
  }

  Widget _buildCafeList(BuildContext context,
      UnmodifiableListView<MerchantDetail> itemsList, int page) {
    var constItemsInPage = 3;
    var itemsInPage = 0;

    if (itemsList.length < constItemsInPage * page) {
      itemsInPage = itemsList.length - constItemsInPage * (page - 1);
    } else
      itemsInPage = constItemsInPage;

    var widgets = List.generate(
        itemsList.length,
        (index) =>
            _buildCafeItem(itemsList[index + ((page - 1) * constItemsInPage)]));

    for (int i = widgets.length; i < 3; i++) {
      widgets.add(Expanded(child: Container()));
    }

    return Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: widgets);
  }

  Widget _buildCafeItem(MerchantDetail item) {
    return Expanded(
      child: Card(
        elevation: 8,
        color: AppColors.white,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              AspectRatio(
                aspectRatio: 1,
                child: CachedNetworkImage(
                  height: 150,
                  imageUrl: item.logo,
                ),
              ),
              Container(
                height: 8,
              ),
              Text(
                item.restaurantName,
                style: AppTheme.theme.textTheme.subtitle,
              ),
              Container(
                height: 8,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  SmoothStarRating(
                      allowHalfRating: false,
                      starCount: 5,
                      rating: 3.8,
                      size: 12.0,
                      filledIconData: Icons.star,
                      halfFilledIconData: Icons.star_half,
                      defaultIconData: Icons.star_border,
                      color: AppColors.startFilledColor,
                      borderColor: AppColors.startColor,
                      spacing: 0.0),
                  Expanded(
                    child: Text(
                      "( ${item.rating.reviewCount} )",
                      style: TextStyle(
                        fontSize: 10,
                        color: AppColors.blackText,
                      ),
                      overflow: TextOverflow.clip,
                      textAlign: TextAlign.center,
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
