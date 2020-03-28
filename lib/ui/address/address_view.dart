import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vsem_edu/common/app_colors.dart';
import 'package:vsem_edu/common/widgets/buttons.dart';
import 'package:vsem_edu/network/models/address.dart';
import 'package:vsem_edu/ui/address/address_view_model.dart';

class AddressView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Consumer<AddressViewModel>(
        builder: (context, model, _) =>
            Container(
                child: getList(model)
            ),
      ),
    );
  }

  Widget getList(AddressViewModel model) {
    return Container(
        color: AppColors.backgroundLight,
        height: double.infinity,
        child: Align(
          alignment: Alignment.topCenter,
          child: ListView(
              shrinkWrap: true,
              children: List.generate(model.data.length, (index) {
                return addressTile(model.data[index]);
              })),
        ));
  }

  Widget addressTile(Address address) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        color: AppColors.white,
        elevation: 4,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                address.address,
                style: TextStyle(color: AppColors.blackText, fontSize: 16),
              ),
              Container(height: 8,),
              Text(
                address.createdDate,
                style: TextStyle(color: AppColors.secondaryBlackText),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget getAddressForm(BuildContext context, AddressViewModel model) {
    return Column(
      children: <Widget>[
        addressTextField(context, model.cityTextEditingController,
            hintText: "Город"),
        addressTextField(context, model.regionTextEditingController,
            hintText: "Область"),
        addressTextField(context, model.districtTextEditingController,
            hintText: "Район"),
        addressTextField(context, model.streetTextEditingController,
            hintText: "Улица"),
        Row(
          children: <Widget>[
            addressTextField(context, model.houseTextEditingController,
                hintText: "Дом"),
            addressTextField(context, model.apartmentTextEditingController,
                hintText: "Квартира"),
          ],
        ),
        addressTextField(context, model.phoneTextEditingController,
            hintText: "Телефон"),
        Container(
          height: 32,
        ),
        simpleFilledButton(text: "Сохранить", onPressed: () {})
      ],
    );
  }

  Widget addressTextField(BuildContext context,
      TextEditingController textEditingController, {
        String hintText,
        TextStyle textStyle,
        TextStyle hintStyle,
        Function(String) onSubmitted,
        FocusNode focusNode,
        FocusNode nextFocusNode,
      }) {
    if (focusNode == null) focusNode = FocusNode();
    if (textStyle == null) textStyle = TextStyle(color: AppColors.blackText);
    if (hintStyle == null)
      hintStyle = TextStyle(color: AppColors.secondaryBlackText);
    return FractionallySizedBox(
      widthFactor: 0.8,
      child: Container(
        color: Colors.white,
        child: TextField(
          controller: textEditingController,
          style: textStyle,
          keyboardType: TextInputType.text,
          focusNode: focusNode,
          textInputAction: TextInputAction.next,
          onSubmitted: onSubmitted,
          //onChanged: model.phoneError = null,
          decoration: InputDecoration(
            contentPadding: EdgeInsets.all(12),
            hintText: hintText,
            hintStyle: hintStyle,
            //errorText: model.phoneError,
          ),
        ),
      ),
    );
  }
}
