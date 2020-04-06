import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vsem_edu/common/app_colors.dart';
import 'package:vsem_edu/network/models/menu_category_product_item.dart';
import 'package:vsem_edu/ui/menuCategoryDetail/merchant_category_products_model.dart';

class MerchantCategoryProductView extends StatelessWidget {
  const MerchantCategoryProductView();

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.background,
      child: Consumer<MerchantCategoryProductsModel>(
        builder: (context, model, _) {
          return !model.isLoading
              ? Container(
                  height: double.infinity,
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[productsWidget()],
                    ),
                  ),
                )
              : Container(
                  height: double.infinity,
                  child: Center(child: CircularProgressIndicator()),
                );
        },
      ),
    );
  }

  Widget productsWidget() {
    return Consumer<MerchantCategoryProductsModel>(
      builder: (context, model, _) => Column(
        children: List.generate(
          model.items.length,
          (index) {
            var item = model.items[index];
            return listTile(item, callback: () {
              showDialog(
                  context: context,
                  child: _getDialog(context, () {
                    model.onAddToCartClick(item);
                  }));
            });
          },
        ),
      ),
    );
  }

  Widget listTile(MenuCategoryProductItem item, {VoidCallback callback}) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: GestureDetector(
        onTap: callback,
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                CachedNetworkImage(
                  imageUrl: item.photo,
                  height: 56,
                  width: 56,
                ),
                Container(
                  width: 8,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        item.itemName,
                        style: TextStyle(
                            fontSize: 16,
                            color: AppColors.blackText,
                            fontWeight: FontWeight.w400),
                      ),
                      Container(
                        height: 4,
                      ),
                      Text(
                        item.itemDescription,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 3,
                        style: TextStyle(
                          fontSize: 14,
                          color: AppColors.secondaryBlackText,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      Container(
                        height: 4,
                      ),
                      Row(
                        children: <Widget>[
                          Text(
                            "Цена: ",
                            style: TextStyle(
                              fontSize: 16,
                              color: AppColors.secondaryBlackText,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          Text(
                            item.price[0],
                            style: TextStyle(
                              fontSize: 16,
                              color: AppColors.orange,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          Text(
                            " руб.",
                            style: TextStyle(
                              fontSize: 16,
                              color: AppColors.secondaryBlackText,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                )
              ],
            ),
            Container(
              height: 8,
            ),
            Divider(
              height: 1,
              color: AppColors.blackBg,
            )
          ],
        ),
      ),
    );
  }

  Widget _getDialog(BuildContext context, VoidCallback callback) {
    return AlertDialog(
      title: Text("Добавить в корзину?", style: TextStyle(color: AppColors.white, fontSize: 18),),
      actions: <Widget>[
        FlatButton(
          child: const Text('Нет'),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        FlatButton(
          child: const Text('Добавить'),
          onPressed: () {
            callback();
            Navigator.of(context).pop();
          },
        )
      ],
    );
  }
}
