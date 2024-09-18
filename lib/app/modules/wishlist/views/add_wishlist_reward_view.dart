/*
 * @copyright : Henceforth Pvt. Ltd. <info@henceforthsolutions.com>
 * @author     : Gaurav Negi
 * All Rights Reserved.
 * Proprietary and confidential :  All information contained herein is, and remains
 * the property of Henceforth Pvt. Ltd. and its partners.
 * Unauthorized copying of this file, via any medium is strictly prohibited.
 *
 */

import 'package:engagely/app/export.dart';
import 'package:engagely/app/modules/wishlist/controllers/add_wishlist_reward_controller.dart';


class AddWishListRewardView extends BaseView<AddWishListRewardController> {
  AddWishListRewardView({super.key});

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
        _actionButton(),
      ],
    );
  }

 Widget _bodyWidget() => Expanded(
      child: SingleChildScrollView(
        child: Column(crossAxisAlignment: CrossAxisAlignment.start
            ,children: [
              _productInformation(),
              _rewardText(),
              _rewardDescrption(),
              _pricingEditTextField(),
            ]).marginSymmetric(horizontal: margin_15,vertical: margin_15),
      ));

  Widget _productInformation() => Container(
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

  Widget _productName()=>TextView(
      text: "Marshmallow Primer",
      textAlign: TextAlign.start,
      textStyle: textStyleBodyLarge().copyWith(
          color: Colors.black,
          fontSize: font_16,
          fontWeight: FontWeight.w500));

  Widget _productPrice()=>TextView(
      text: "\$10",
      textAlign: TextAlign.start,
      textStyle: textStyleBodyLarge().copyWith(
          color: AppColors.appColor,
          fontSize: font_16,
          fontWeight: FontWeight.w500));


  Widget _rewardText()=>TextView(
      text: strReward,
      textAlign: TextAlign.start,
      textStyle: textStyleBodyLarge().copyWith(
          color: Colors.black,
          fontSize: font_16,
          fontWeight: FontWeight.w600)).marginOnly(top: margin_15);

  Widget _rewardDescrption()=>TextView(
      text: strrewardDesc,
      textAlign: TextAlign.start,
      maxLines: 2,
      textStyle: textStyleBodyLarge().copyWith(
          color: Colors.grey,
          fontSize: font_14,
          fontWeight: FontWeight.w400)).marginOnly(top: margin_5);


  Widget _pricingEditTextField() => TextFieldWidget(
    hint: strEnterDiamond,
    prefixIcon: AssetImageWidget(iconsDianmod,
        imageWidth: margin_22, imageHeight: margin_22)
        .marginOnly(top: margin_2, left: margin_15, right: margin_10),
    inputType: TextInputType.name,
    inputAction: TextInputAction.next,
    formatter: [
      FilteringTextInputFormatter.allow(RegExp('[a-zA-Z]')),
    ],
  ).paddingOnly(top: margin_15);


  Widget _actionButton()=>Column(children: [
    _doneButton(),
    _dontGiveRewardButton(),
  ],).paddingSymmetric(horizontal: margin_18,).marginOnly(bottom: margin_10);

  Widget _doneButton() =>   MaterialButtonWidget(
      buttonBgColor: AppColors.appColor,
      onPressed: () {
        Get.offNamed(AppRoutes.mainViewRoute);
      },
      buttonText: strDone,textColor: Colors.white,
    );

  Widget _dontGiveRewardButton() =>   MaterialButtonWidget(
    buttonBgColor: AppColors.whiteColor,isOutlined: true,
    onPressed: () {
      Get.offNamed(AppRoutes.mainViewRoute);   },
    buttonText: strDontGiveReward,textColor: AppColors.appColor,
  ).marginOnly(top: margin_10);

}
