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
import 'package:engagely/app/modules/wishlist/controllers/wishlist_detail_controller.dart';

import '../../../export.dart';

class WishListDetailView extends BaseView<WhisListDetailController> {
  WishListDetailView({super.key});

  @override
  PreferredSizeWidget? appBar(BuildContext context) {
    return AppBarWidget(
      bgColor: Colors.white,
      isCustom: false,
      appBarTitleText:
          Get.arguments != null && Get.arguments[isAddedForWishList] == true
              ? strProductDetail
              : strWishListDetail,
      backIconColor: Colors.black,
    );
  }

  @override
  Widget body(BuildContext context) {
    return Column(
      children: [
        _bodyView(),
        Get.arguments != null && Get.arguments[isFullField] == true
            ? emptySizeBox()
            : _bottomView()
      ],
    );
  }

  _bodyView() => Expanded(
          child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _imageView(),
            _productBasicInformation(),
            _descrptionWidget(),
            if (Get.arguments != null &&
                Get.arguments[isAddedForWishList] == true) ...[
              emptySizeBox()
            ] else ...[
              _userInfo(),
              if(Get.arguments!=null && Get.arguments[isLive]==false)...[
                _fullFillWishlistHeading(),
                _fullFillWishlistDescption(),
              ],

              _rewaredHeading(),
              _rewardImage(),
            ],
            if (Get.arguments != null &&
                Get.arguments[isFullField] == true) ...[
              _fullFillHeading(),
              _fullFillByUser(),
            ]
          ],
        ).marginSymmetric(horizontal: margin_15),
      ));

  _imageView() => AssetImageWidget(
          Get.arguments[isCosmetic] == false ? iconsPizza : iconsMakeUp ?? "",
          imageHeight: margin_200,
          imageWidth: Get.width,
          imageFitType: BoxFit.cover,
          radiusAll: height_5)
      .marginSymmetric(vertical: margin_20);

  Widget _productBasicInformation() => Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _titleView(),
                _categoryView(),
              ],
            ),
          ),
          Get.arguments != null && Get.arguments[isMyWishList] == true ||
                  Get.arguments != null && Get.arguments[isFullField] == true
              ? _itemPrice()
              : emptySizeBox(),
        ],
      );

  Widget _titleView() => TextView(
      text: "Marshmallow Primer",
      textStyle: textStyleBodyLarge().copyWith(
          color: Colors.black, fontSize: font_16, fontWeight: FontWeight.w600));

  Widget _itemPrice() => Container(
        padding:
            EdgeInsets.symmetric(horizontal: margin_10, vertical: margin_4),
        decoration: BoxDecoration(
            color: AppColors.appColor,
            borderRadius: BorderRadius.all(Radius.circular(margin_15))),
        child: TextView(
            text: "\$100",
            textStyle: textStyleBodyLarge().copyWith(
                color: AppColors.whiteColor,
                fontSize: font_14,
                fontWeight: FontWeight.w600)),
      );

  Widget _categoryView() => TextView(
          text: "NYX Professional Makeup",
          textStyle: textStyleBodyLarge().copyWith(
              color: AppColors.appColor,
              fontSize: font_16,
              fontWeight: FontWeight.w600))
      .marginOnly(top: margin_4);

  _descrptionWidget() => TextView(
          maxLines: 100,
          text:
              "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum ut quam et dolor laoreet tristique ut ut mi. Vivamus volutpat, arcu et dapibus egestas, tellus dolor vulputate lorem, vitae porta risus dolor sit amet dui. Aenean euismod lorem massa, iaculis lacinia libero molestie in.",
          textStyle: textStyleBodyLarge().copyWith(
              color: Colors.black.withOpacity(.5),
              fontSize: font_15,
              fontWeight: FontWeight.w500))
      .marginOnly(top: margin_8, bottom: margin_5);

  _userInfo() => Container(
        width: Get.width,
        padding:
            EdgeInsets.only(left: margin_15, top: margin_8, bottom: margin_8),
        margin: EdgeInsets.symmetric(vertical: margin_15),
        decoration: BoxDecoration(
            color: AppColors.creamColor.withOpacity(.7),
            borderRadius: BorderRadius.all(Radius.circular(margin_10))),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                AssetImageWidget(
                  icProfileUser,
                  imageHeight: margin_50,
                  imageWidth: margin_50,
                ),
                SizedBox(
                  width: margin_10,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      TextView(
                          text: "Sophie Qwens",
                          textStyle: textStyleHeadlineLarge().copyWith(
                              fontSize: font_16, color: Colors.black)),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          AssetImageWidget(
                            icUsers,
                            imageWidth: margin_15,
                            imageHeight: margin_15,
                          ),
                          SizedBox(
                            width: margin_5,
                          ),
                          TextView(
                            text: "6392",
                            textStyle: textStyleHeadlineLarge().copyWith(
                                fontSize: font_14, color: AppColors.appColor),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                SizedBox(
                  width: margin_10,
                ),
                _moreOption(),
              ],
            ),
            _userQuestion(),
            _userAnswer(),
          ],
        ),
      );

  _moreOption() => Container(
        padding: EdgeInsets.all(margin_7),
        margin: EdgeInsets.only(right: margin_10),
        decoration: BoxDecoration(
            color: AppColors.appColor,
            borderRadius: BorderRadius.all(Radius.circular(margin_30))),
        child: Icon(
          Icons.arrow_forward_ios_sharp,
          color: Colors.white,
          size: margin_15,
        ),
      );

  _userQuestion() => TextView(
          text: "Why user wants this:- ",
          textStyle: textStyleBodyLarge().copyWith(
              color: Colors.black,
              fontSize: font_16,
              fontWeight: FontWeight.w500))
      .marginOnly(top: margin_5);

  _userAnswer() => TextView(
          text:
              "Aenean euismod lorem massa, iaculis lacinia libero molestie in.",
          maxLines: 3,
          textStyle: textStyleBodyLarge().copyWith(
              color: Colors.black.withOpacity(.5),
              fontSize: font_16,
              fontWeight: FontWeight.w500))
      .marginOnly(top: margin_5, right: margin_5);

  Widget _fullFillWishlistHeading() => TextView(
      text: strMessageFullFill,
      textStyle: textStyleBodyLarge().copyWith(
          color: Colors.black, fontSize: font_16, fontWeight: FontWeight.w600));

  _fullFillWishlistDescption() => TextView(
          maxLines: 100,
          text:
              "Receiving the items from my wishlist was an unexpected and delightful surprise. You have made my dreams come true, and I cannot thank you enough for your extraordinary generosity. Your selflessness and the effort you put into making me happy have touched my heart deeply.",
          textStyle: textStyleBodyLarge().copyWith(
              color: Colors.black.withOpacity(.5),
              fontSize: font_15,
              fontWeight: FontWeight.w500))
      .marginOnly(top: margin_8, bottom: margin_5);

  Widget _rewaredHeading() => TextView(
      text: strReward,
      textStyle: textStyleBodyLarge().copyWith(
          color: Colors.black, fontSize: font_16, fontWeight: FontWeight.w600)).marginOnly(top: margin_15);

  Widget _rewardImage() => Container(
        height: height_200,
        child: Stack(
          fit: StackFit.expand,
          children: [
            AssetImageWidget(
              iconsReward,
              imageWidth: Get.width,
              imageHeight: height_250,
            ),
            Column(children: [
              AssetImageWidget(
                iconsRippleDiamond,
                imageWidth: margin_100,
                imageHeight: margin_100,
              ).marginSymmetric(vertical: margin_15),
              _rewardHeading(),
              _rewardDescrption(),
            ]).marginSymmetric(horizontal: margin_20),
          ],
        ),
      );

  _rewardHeading() => TextView(
          text: "Free 10 diamonds",
          textStyle: textStyleBodyLarge().copyWith(
              color: Colors.white,
              fontSize: font_16,
              fontWeight: FontWeight.w700))
      .marginOnly(top: margin_5);

  Widget _rewardDescrption() => TextView(
          text:
              "Aenean euismod lorem massa, iaculis lacinia libero molestie in.",
          textAlign: TextAlign.center,
          maxLines: 3,
          textStyle: textStyleBodyLarge().copyWith(
              color: Colors.white,
              fontSize: font_14,
              fontWeight: FontWeight.w400))
      .marginOnly(top: margin_5, right: margin_5);

  Widget _fullFillHeading() => TextView(
      text: strFulfilledBy,
      textStyle: textStyleBodyLarge().copyWith(
          color: Colors.black, fontSize: font_16, fontWeight: FontWeight.w600)).marginOnly(top: margin_15);

  _fullFillByUser() => Container(
        width: Get.width,
        padding:
            EdgeInsets.only(left: margin_15, top: margin_8, bottom: margin_8),
        margin: EdgeInsets.symmetric(vertical: margin_15),
        decoration: BoxDecoration(
            color: AppColors.creamColor.withOpacity(.7),
            borderRadius: BorderRadius.all(Radius.circular(margin_10))),
        child: Row(
          children: [
            AssetImageWidget(
              icProfileUser,
              imageHeight: margin_50,
              imageWidth: margin_50,
            ),
            SizedBox(
              width: margin_10,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  TextView(
                      text: "Sophie Qwens",
                      textStyle: textStyleHeadlineLarge()
                          .copyWith(fontSize: font_16, color: Colors.black)),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      AssetImageWidget(
                        icUsers,
                        imageWidth: margin_15,
                        imageHeight: margin_15,
                      ),
                      SizedBox(
                        width: margin_5,
                      ),
                      TextView(
                        text: "6392",
                        textStyle: textStyleHeadlineLarge().copyWith(
                            fontSize: font_14, color: AppColors.appColor),
                      ),
                    ],
                  )
                ],
              ),
            ),
            SizedBox(
              width: margin_10,
            ),
            _moreOption(),
          ],
        ),
      );

  Widget _bottomView() => Container(
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
                color: Colors.grey.shade300,
                offset: const Offset(0.0, -1.0),
                blurRadius: 3.0 //(x,y)
                ),
          ],
        ),
        padding: EdgeInsets.only(top: margin_10),
        child: Get.arguments != null && Get.arguments[isMyWishList] == true
            ? _addDeleteView()
            : Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _priceInformation(),
                  SizedBox(
                    width: margin_15,
                  ),
                  _buttonView(),
                ],
              ).paddingOnly(left: margin_15, right: margin_15),
      );

  _addDeleteView() => Row(
        children: [
          _deleteButton(),
          SizedBox(
            width: margin_10,
          ),
          _editButton(),
        ],
      ).paddingSymmetric(horizontal: margin_15,vertical: margin_5);

  _deleteButton() => Expanded(
        child: ButtonWidget(
          onTap: () async {
            Get.back();
          },
          child: Container(
              padding: EdgeInsets.symmetric(
                  horizontal: margin_30, vertical: margin_15),
              margin: EdgeInsets.symmetric(vertical: margin_5),
              decoration: BoxDecoration(
                  color: AppColors.whiteColor,
                  border: Border.all(color: AppColors.redPrimaryColor),
                  borderRadius: BorderRadius.all(Radius.circular(margin_10))),
              child: Center(
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    AssetImageWidget(iconsDelete,
                        imageHeight: height_15, imageWidth: height_15),
                    SizedBox(
                      width: margin_5,
                    ),
                    TextView(
                      text: strDelete,
                      textStyle: textStyleBodyLarge().copyWith(
                          color: AppColors.redPrimaryColor,
                          fontSize: font_16,
                          fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
              )),
        ),
      );

  _editButton() => Expanded(
        child: ButtonWidget(
          onTap: () async {
           Get.back();
          },
          child: Container(
              padding: EdgeInsets.symmetric(
                  horizontal: margin_30, vertical: margin_15),
              margin: EdgeInsets.symmetric(vertical: margin_5),
              decoration: BoxDecoration(
                  color: AppColors.whiteColor,
                  border: Border.all(color: AppColors.appColor),
                  borderRadius: BorderRadius.all(Radius.circular(margin_10))),
              child: Center(
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    AssetImageWidget(iconsPencils,
                        imageHeight: height_15, imageWidth: height_15),
                    SizedBox(
                      width: margin_5,
                    ),
                    TextView(
                      text: strEdit,
                      textStyle: textStyleBodyLarge().copyWith(
                          color: AppColors.appColor,
                          fontSize: font_16,
                          fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
              )),
        ),
      );

  _priceInformation() => Expanded(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _price(),
            _priceValue(),
          ],
        ).marginOnly(top: margin_8),
      );

  _price() => TextView(
          text: strPrice,
          textAlign: TextAlign.start,
          textStyle: textStyleBodyLarge().copyWith(
              color: Colors.grey,
              fontSize: font_16,
              fontWeight: FontWeight.w500))
      .marginOnly(top: margin_5);

  _priceValue() => Text.rich(
        TextSpan(
            text: "\$100",
            style: textStyleBodyLarge().copyWith(
                fontSize: font_16,
                color: Colors.black,
                fontWeight: FontWeight.w600),
            children: [
              TextSpan(
                  text: " (including tax)",
                  style: textStyleBodyLarge().copyWith(
                      fontSize: font_12,
                      color: Colors.grey,
                      fontWeight: FontWeight.w600))
            ]),
      );
  _buttonView() => ButtonWidget(
        onTap: () async {
          if (Get.arguments != null &&
              Get.arguments[isAddedForWishList] == true) {
            Get.toNamed(AppRoutes.addWishListView);
          } else {
            var data = await Get.toNamed(AppRoutes.selectPaymentView);
            if (data != null) {
              controller.showSucessDialog();
            }
          }
        },
        child: Container(
            padding: EdgeInsets.symmetric(
                horizontal: Get.arguments != null &&
                        Get.arguments[isAddedForWishList] == true
                    ? margin_10
                    : margin_30,
                vertical: margin_15),
            margin: EdgeInsets.symmetric(vertical: margin_10),
            decoration: BoxDecoration(
                color: AppColors.appColor,
                borderRadius: BorderRadius.all(Radius.circular(margin_10))),
            child: TextView(
              text: Get.arguments != null &&
                      Get.arguments[isAddedForWishList] == true
                  ? strAddedToWishList
                  : strBuyNoew,
              textStyle: textStyleBodyLarge().copyWith(
                  color: Colors.white,
                  fontSize: font_16,
                  fontWeight: FontWeight.w700),
            ).paddingSymmetric(horizontal: margin_18)),
      );
}
