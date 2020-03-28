import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';
import 'package:vsem_edu/common/app_colors.dart';
import 'package:vsem_edu/common/widgets/progress_bar.dart';
import 'package:vsem_edu/ui/home/carousel_widget.dart';
import 'package:vsem_edu/ui/merchantList/merchant_list_model.dart';

class MerchantListView extends StatelessWidget {
  const MerchantListView();

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.background,
      child: Consumer<MerchantListModel>(
        builder: (context, model, _) => !model.isLoading
            ? Container(
                height: double.infinity,
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      getCarouselWidget(model),
                      _getDropDownButton(context),
                      merchantsList(),
                    ],
                  ),
                ),
              )
            : Container(
                height: double.infinity,
                child: Center(child: ProgressBar()),
              ),
      ),
    );
  }

  Widget merchantsList() {
    return Consumer<MerchantListModel>(builder: (context, model, _) {
      return Column(
          children: List.generate(model.cafes.length, (index) {
        var item = model.cafes[index];
        return GestureDetector(
          onTap: () { model.onListItemClick(context, index); },
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Card(
              color: Colors.white,
              elevation: 8,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  CachedNetworkImage(
                    height: 100,
                    width: 100,
                    imageUrl: item.backgroundUrl,
                    fit: BoxFit.cover,
                  ),
                  Container(
                    width: 16,
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            item.restaurantName,
                            style: TextStyle(
                                fontSize: 14, color: AppColors.blackText),
                          ),
                          Container(
                            height: 8,
                          ),
                          Text(
                            "Длиннооооооооооооооооооооооооооооооооооооооооооооооооооооооооооооооооооооооооооооооо описание ресторана",
                            style: TextStyle(
                                fontSize: 14, color: AppColors.blackText),
                            overflow: TextOverflow.ellipsis,
                            maxLines: 3,
                          )
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SmoothStarRating(
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
                  ),
                ],
              ),
            ),
          ),
        );
      }));
    });
  }

  Widget getCarouselWidget(MerchantListModel model) {
    return model.carousel.length > 0
        ? CarouselWidget(model.carousel).build()
        : Container(
            height: 200,
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: ProgressBar(),
            ),
          );
  }

  Widget _getDropDownButton(BuildContext context) {
    return Consumer<MerchantListModel>(builder: (context, _model, _) {
      return FlatButton(
        child: Row(
          children: <Widget>[
            Container(
                padding: EdgeInsets.all(4),
                color: Color(0xFF7417c6),
                child: Icon(Icons.business_center)),
            Container(
                padding: EdgeInsets.all(4),
                color: Color(0xFFc1007c),
                child: Icon(Icons.keyboard_arrow_down))
          ],
        ),
        onPressed: () {
          showDialog(
              context: context,
              builder: (BuildContext context) => _getDialog(context, _model));
        },
      );
    });
  }

  Widget _getDialog(BuildContext context, MerchantListModel _model) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      elevation: 16,
      backgroundColor: Colors.black,
      child: _dialogContent(context, _model),
    );
  }

  Widget _dialogContent(BuildContext context, MerchantListModel _model) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        GridView.count(
          childAspectRatio: 4 / 6,
          crossAxisCount: 4,
          shrinkWrap: true,
          children: List.generate(
            _model.cuisines.length,
            (index) {
              var item = _model.cuisines[index];
              return GestureDetector(
                onTap: () {
                  _model.sortCafes(item.id);
                  Navigator.pop(context);
                },
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      SvgPicture.network(
                        item.featuredImage,
                        color: Colors.white,
                        height: 40,
                        width: 40,
                      ),
                      Container(
                        height: 16,
                      ),
                      Text(
                        item.name,
                        textAlign: TextAlign.center,
                      )
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
