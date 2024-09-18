/*
 * @copyright : Henceforth Pvt. Ltd. <info@henceforthsolutions.com>
 * @author     : Gaurav Negi
 * All Rights Reserved.
 * Proprietary and confidential :  All information contained herein is, and remains
 * the property of Henceforth Pvt. Ltd. and its partners.
 * Unauthorized copying of this file, via any medium is strictly prohibited.
 *
 */

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
import 'package:engagely/app/modules/live/controller/broadcast_end_view.dart';
import 'package:engagely/app/modules/live/widget/gifts_item_view.dart';
import 'package:engagely/app/modules/live/widget/interval_view.dart';

import '../../../export.dart';

class BroadcastEndView extends BaseView<BroadcastEndController> {
  BroadcastEndView({super.key});

  @override
  PreferredSizeWidget? appBar(BuildContext context) {
    return null;
  }

  @override
  Color statusBarColor() {
    return Colors.black;
  }

  @override
  Color pageBackgroundColor() {
    return Colors.black;
  }

  @override
  Brightness statusBarBrightness() {
    return Brightness.light;
  }

  @override
  Widget body(BuildContext context) {
    return SizedBox(
      height: Get.height,
      child: Column(
        children: [
          _dismissButton(),
          _bodyView(),
          _button(),
        ],
      ).marginSymmetric(horizontal: margin_18),
    );
  }

  _dismissButton() => Align(
        alignment: Alignment.topRight,
        child: ButtonWidget(
          onTap: () {
            Get.back();
          },
          child: AssetImageWidget(iconsCross,
              imageWidth: height_20,
              imageHeight: height_20,
              radiusAll: height_20),
        ).marginOnly(top: margin_15),
      );

  Widget _bodyView() => Expanded(
        child: Column(
          children: [
            _heading(),
            _intervalView(),
            _ratingView(),
            _giftsHeading(),
            _giftsView(),
          ],
        ),
      );

  Widget _heading() => TextView(
        maxLines: 4,
        text: strBroadcastEnded,
        textAlign: TextAlign.center,
        textStyle: textStyleHeadlineLarge()
            .copyWith(color: Colors.white, fontWeight: FontWeight.w700),
      ).marginOnly(top: margin_25);

  _intervalView() => Container(
    child: Row(
          mainAxisSize: MainAxisSize.min,crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,

          children: [
             IntervalItemView(image: iconsCoinsWhite, title: "200",size: margin_26),
            SizedBox(
              width: margin_15,
            ),
             IntervalItemView(image: iconsTime, title: "0h 0m",size: margin_24),
            SizedBox(
              width: margin_15,
            ),
             IntervalItemView(image: iconsEye, title: "100",size: margin_22),
          ],
        ).marginOnly(top: margin_15),
  );

  _ratingView() => Container(
      width: Get.width,
      padding: EdgeInsets.symmetric(vertical: margin_20),
      margin: EdgeInsets.symmetric(vertical: margin_25),
      decoration: BoxDecoration(
          color: Colors.white.withOpacity(.1),
          borderRadius: BorderRadius.circular(margin_15)),
      child: Column(
        children: [
          _ratingHeading(),
          _ratingBuilder(),
        ],
      ));

  Widget _ratingHeading() => TextView(
        maxLines: 4,
        text: strHowBroadcast,
        textAlign: TextAlign.center,
        textStyle: textStyleHeadlineLarge().copyWith(
            color: Colors.white,
            fontWeight: FontWeight.w400,
            fontSize: font_16),
      );

  Widget _ratingBuilder() => RatingBar.builder(
        initialRating: 5,
        minRating: 1,
        ignoreGestures: true,
        direction: Axis.horizontal,
        allowHalfRating: true,
        itemCount: 5,
        itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
        itemBuilder: (context, _) => const Icon(
          Icons.star_border,
          color: Colors.white,
        ),
        glowColor: Colors.white,
        onRatingUpdate: (rating) {
          print(rating);
        },
      ).marginOnly(top: margin_10);

  Widget _giftsHeading() => TextView(
        maxLines: 4,
        text: strGift,
        textAlign: TextAlign.center,
        textStyle: textStyleHeadlineLarge().copyWith(
            color: Colors.white,
            fontWeight: FontWeight.w600,
            fontSize: font_18),
      );

  Widget _giftsView() => Obx(() =>
      controller.giftsList.length == 0 ? _giftsDescprion() : _giftsListView());

  Widget _giftsDescprion() => TextView(
        maxLines: 4,
        text: strNoGiftsBroadcast,
        textAlign: TextAlign.center,
        textStyle: textStyleHeadlineLarge().copyWith(
            color: Colors.white.withOpacity(.6),
            fontWeight: FontWeight.w500,
            fontSize: font_16),
      ).marginOnly(top: margin_10);

  _giftsListView() => GridView.builder(
      itemCount: controller.giftsList.length,
      shrinkWrap: true,
      padding: EdgeInsets.zero,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisSpacing: margin_15,
          mainAxisSpacing: margin_15,
          crossAxisCount: 4,
          childAspectRatio: .85),
      itemBuilder: (context, index) {
        var item = controller.giftsList[index];
        return GiftItemView(
          icon: item.icon,
          price: item.name,
          isCoin: false,
          showIcon: false,
        );
      }).marginSymmetric(horizontal: margin_15, vertical: margin_10);

  _button() => Align(
        alignment: Alignment.bottomCenter,
        child: Row(
          children: [
            _cancelButton(),
            SizedBox(
              width: margin_10,
            ),
            _shareButton(),
          ],
        ).marginOnly(bottom: margin_30),
      );

  Widget _cancelButton() => Expanded(
        child: MaterialButtonWidget(
          buttonBgColor: AppColors.redPrimaryColor,
          onPressed: () {
            Get.back();
          },
          buttonText: strDiscardVideo,
          textColor: Colors.white,
        ).marginOnly(top: margin_15),
      );

  Widget _shareButton() => Expanded(
        child: MaterialButtonWidget(
          buttonBgColor: AppColors.appColor,
          onPressed: () {
            Get.offAllNamed(AppRoutes.mainViewRoute);
          },
          buttonText: strShare,
          textColor: Colors.white,
        ).marginOnly(top: margin_15),
      );
}
