/*
 * @copyright : Henceforth Pvt. Ltd. <info@henceforthsolutions.com>
 * @author     : Gaurav Negi
 * All Rights Reserved.
 * Proprietary and confidential :  All information contained herein is, and remains
 * the property of Henceforth Pvt. Ltd. and its partners.
 * Unauthorized copying of this file, via any medium is strictly prohibited.
 *
 */

import 'package:engagely/app/core/widget/app_bar_widget.dart';
import 'package:engagely/app/core/widget/ripple.dart';
import 'package:engagely/app/export.dart';
import 'package:engagely/app/modules/live/widget/wishlist_item_view.dart';
import 'package:engagely/app/modules/wishlist/controllers/add_wishlist_controller.dart';
import 'package:engagely/app/modules/wishlist/controllers/all_products_controller.dart';
import 'package:engagely/app/modules/wishlist/controllers/product_category_controller.dart';
import 'package:engagely/app/modules/wishlist/controllers/wishlist_home_controller.dart';
import 'package:engagely/app/modules/wishlist/widgets/category_item_view.dart';
import 'package:engagely/app/modules/wishlist/widgets/product_item_view.dart';

class AddWishListView extends BaseView<AddWishListController> {
  AddWishListView({super.key});

  @override
  PreferredSizeWidget? appBar(BuildContext context) {
    return AppBarWidget(
      bgColor: Colors.white,
      isCustom: false,
      appBarTitleText: strAddWishList,
      backIconColor: Colors.black,
    );
  }

  @override
  Widget body(BuildContext context) {
    return Column(
      children: [
        _bodyWidget(),
        _nextButton(),
      ],
    );
  }

  _bodyWidget() => Expanded(
          child: SingleChildScrollView(
        child: Column(crossAxisAlignment: CrossAxisAlignment.start
        ,children: [
          _productInformation(),
          _whyYouWantText(),
              _wantProductDescrption(),
              _descrptionEditText(),
              _sweetMessageText(),
              _sweetMessageDescrption(),
              _sweetMesageDescrptionEditText(),
        ]).marginSymmetric(horizontal: margin_15,vertical: margin_15),
      ));

  _productInformation() => Container(
    padding: EdgeInsets.all(margin_8),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(margin_10),
            border: Border.all(color: Colors.grey.shade300)),
        child: Row(crossAxisAlignment: CrossAxisAlignment.center,
            children: [
          _productImage(),
          SizedBox(width: margin_15,),
          Expanded(
            child: Column(crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
              _productName(),
                _productPrice(),
            ],),
          )
        ]),
      );

  Widget _productImage()=>AssetImageWidget(
    iconsMakeUp,
    imageHeight: height_60,
    imageWidth: height_60,
    radiusAll: margin_5,
    imageFitType: BoxFit.cover,
  );

  _productName()=>TextView(
      text: "Marshmallow Primer",
      textAlign: TextAlign.start,
      textStyle: textStyleBodyLarge().copyWith(
          color: Colors.black,
          fontSize: font_16,
          fontWeight: FontWeight.w500));

  _productPrice()=>TextView(
      text: "\$10",
      textAlign: TextAlign.start,
      textStyle: textStyleBodyLarge().copyWith(
          color: AppColors.appColor,
          fontSize: font_16,
          fontWeight: FontWeight.w500));


  _whyYouWantText()=>TextView(
      text: strWhyYouWant,
      textAlign: TextAlign.start,
      textStyle: textStyleBodyLarge().copyWith(
          color: Colors.black,
          fontSize: font_16,
          fontWeight: FontWeight.w600)).marginOnly(top: margin_15);

  _wantProductDescrption()=>TextView(
      text: strPleaseExplain,
      textAlign: TextAlign.start,
      maxLines: 2,
      textStyle: textStyleBodyLarge().copyWith(
          color: Colors.grey,
          fontSize: font_14,
          fontWeight: FontWeight.w400)).marginOnly(top: margin_5);


  Widget _descrptionEditText() => TextFieldWidget(
    hint: strExplainHere,
    maxLines: 5,
    minLine: 4,
    inputType: TextInputType.multiline,
    inputAction: TextInputAction.newline,
  ).marginOnly(top: margin_15);


  _sweetMessageText()=>TextView(
      text: strSweetMessage,
      textAlign: TextAlign.start,
      textStyle: textStyleBodyLarge().copyWith(
          color: Colors.black,
          fontSize: font_16,
          fontWeight: FontWeight.w600)).marginOnly(top: margin_40);

  _sweetMessageDescrption()=>TextView(
      text: strSweetMessageDes,
      textAlign: TextAlign.start,
      maxLines: 2,
      textStyle: textStyleBodyLarge().copyWith(
          color: Colors.grey,
          fontSize: font_14,
          fontWeight: FontWeight.w400)).marginOnly(top: margin_5);


  Widget _sweetMesageDescrptionEditText() => TextFieldWidget(
    hint: strExplainHere,
    maxLines: 5,
    minLine: 4,
    inputType: TextInputType.multiline,
    inputAction: TextInputAction.newline,
  ).marginOnly(top: margin_15);


  Widget _nextButton() =>  Container(decoration: BoxDecoration(
    color: Colors.white,
    boxShadow: [
      BoxShadow(
          color: Colors.grey.shade300,
          offset: const Offset(0.0, -1.0),
          blurRadius: 3.0//(x,y)
      ),
    ],
  ),
    padding: EdgeInsets.only(top: margin_10),
    child: MaterialButtonWidget(
      buttonBgColor: AppColors.appColor,
      onPressed: () {
        Get.offAllNamed(AppRoutes.addWishListRewardView);
      },
      buttonText: strNext,textColor: Colors.white,
    ).paddingSymmetric(horizontal: margin_18,).marginOnly(bottom: margin_10),
  );
}
