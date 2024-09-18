/*
 * @copyright : Henceforth Pvt. Ltd. <info@henceforthsolutions.com>
 * @author     : Gaurav Negi
 * All Rights Reserved.
 * Proprietary and confidential :  All information contained herein is, and remains
 * the property of Henceforth Pvt. Ltd. and its partners.
 * Unauthorized copying of this file, via any medium is strictly prohibited.
 *  
 */

import 'package:engagely/app/core/widget/ripple.dart';
import 'package:engagely/app/export.dart';
import 'package:engagely/app/modules/diamond/controllers/my_diamond_controller.dart';
import 'package:engagely/app/modules/diamond/widgets/my_diamond_item_view.dart';

class MyDiamondView extends BaseView<MyDiamondController> {
  @override
  Color statusBarColor() {
    return AppColors.appColor;
  }

  @override
  Color pageBackgroundColor() {
    // TODO: implement pageBackgroundColor
    return AppColors.appColor;
  }

  @override
  PreferredSizeWidget? appBar(BuildContext context) {
    return null;
  }

  @override
  Widget body(BuildContext context) {
    return Stack(
      children: [
        AssetImageWidget(icDiamondBackgorund,
            imageWidth: Get.width, imageFitType: BoxFit.cover),
        Column(
          children: [
            _transactionButton(),
            _myDiamondsHeading(),
            _myDiamondsCount(),
            _bodyView(),
          ],
        ),
      ],
    );
  }

  Widget _transactionButton() => ButtonWidget(onTap: (){
    Get.toNamed(AppRoutes.transactionHistoryView);
  },
    child: Align(
          alignment: Alignment.topRight,
          child: AssetImageWidget(iconsTransaction,
              imageWidth: margin_30, imageHeight: margin_30),
        ).marginOnly(right: margin_15,top: margin_5),
  );

  Widget _myDiamondsHeading() => TextView(
        text: strMyDiamonds,
        textStyle: textStyleHeadlineLarge()
            .copyWith(color: Colors.white, fontSize: font_20),
      ).marginOnly(top: margin_10);
  Widget _myDiamondsCount() => TextView(
        text: "100",
        textStyle: textStyleHeadlineLarge().copyWith(
            color: Colors.white,
            fontSize: font_28,
            fontWeight: FontWeight.w600),
      ).marginOnly(top: margin_5);

  Widget _bodyView() => Expanded(
        child: Container(
          margin: EdgeInsets.only(top: margin_50),
          width: Get.width,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(margin_25),
                  topRight: Radius.circular(margin_25))),
          child: _diamondHistoryListView(),
        ),
      );

  _diamondHistoryListView() => ListView.builder(
          itemCount: 10,
          itemBuilder: (context, index) =>
              const MyDiamondItemView().marginOnly(bottom: margin_10))
      .paddingSymmetric(horizontal: margin_15, vertical: margin_20);
}
