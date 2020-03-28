import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vsem_edu/common/app_colors.dart';
import 'package:vsem_edu/common/widgets/buttons.dart';
import 'package:vsem_edu/ui/address/address_view_model.dart';

class AddAddressView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.white,
      child: Consumer<AddressViewModel>(
        builder: (context, model, _) => Container(
            height: double.infinity,
            child: Container(
              child: getAddressForm(context, model),
            )),
      ),
    );
  }

  Widget getAddressForm(BuildContext context, AddressViewModel model) {
    return Align(
      alignment: Alignment.topCenter,
      child: ListView(
        padding: EdgeInsets.all(16.0),
        shrinkWrap: true,
        children: <Widget>[
          addressTextField(context, model.cityTextEditingController,
              hintText: "Город"),
          Container(height: 8,),
          addressTextField(context, model.regionTextEditingController,
              hintText: "Область"),
          Container(height: 8,),
          addressTextField(context, model.districtTextEditingController,
              hintText: "Район"),
          Container(height: 8,),
          addressTextField(context, model.streetTextEditingController,
              hintText: "Улица"),
          Container(height: 8,),
          addressTextField(context, model.houseTextEditingController,
              hintText: "Дом"),
          Container(height: 8,),
          addressTextField(context, model.apartmentTextEditingController,
              hintText: "Квартира"),
          Container(height: 8,),
          addressTextField(context, model.phoneTextEditingController,
              hintText: "Телефон"),
          Container(height: 8,),
        ],
      ),
    );
  }

  Widget addressTextField(
    BuildContext context,
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
    return TextFormField(
      controller: textEditingController,
      style: textStyle,
      keyboardType: TextInputType.text,
      focusNode: focusNode,
      textInputAction: TextInputAction.next,
      //onChanged: model.phoneError = null,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.all(12),
        labelText: hintText,
        labelStyle: hintStyle,
        border: new OutlineInputBorder(
          borderRadius: new BorderRadius.circular(2.0),
          borderSide: new BorderSide(
          ),
        ),
        enabledBorder: new OutlineInputBorder(
          borderRadius: new BorderRadius.circular(2.0),
          borderSide: new BorderSide(
          ),
        ),
      ),
    );
  }
}
