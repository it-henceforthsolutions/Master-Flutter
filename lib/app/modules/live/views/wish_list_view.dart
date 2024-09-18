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
import 'package:engagely/app/modules/live/controller/gitft_controller.dart';
import 'package:engagely/app/modules/live/widget/wishlist_item_view.dart';

import '../../../export.dart';

class WishListView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder(
        init: GiftController(),
        builder: (controller) {
          return SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _notchView(),
                _heading(),
                _categoryCostmeticView(),
                _cosmeticListView(),
                _categoryFoodView(),
                _foodListView(),
              ],
            ),
          );
        });
  }

  Widget _notchView() => Center(
        child: Container(
          margin: EdgeInsets.symmetric(vertical: margin_15),
          width: margin_60,
          height: height_5,
          decoration: BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.circular(margin_5)),
        ),
      );

  Widget _heading() => TextView(
        text: strWishlist,
        textStyle: textStyleBodyLarge().copyWith(
            color: Colors.black,
            fontSize: font_18,
            fontWeight: FontWeight.w600),
      ).marginOnly(top: margin_10, left: margin_15);

  _categoryCostmeticView() => Container(
        width: Get.width,
        padding:
            EdgeInsets.only(left: margin_15, top: margin_8, bottom: margin_8),
        margin: EdgeInsets.symmetric(vertical: margin_15),
        decoration: BoxDecoration(
          color: Colors.grey.shade200,
        ),
        child: TextView(
          text: "Cosmetics",
          textStyle: textStyleBodyLarge().copyWith(
              color: Colors.black,
              fontSize: font_14,
              fontWeight: FontWeight.w600),
        ),
      );

  _cosmeticListView() => SizedBox(
        height: height_150,
        child: ListView.builder(
            itemCount: 3,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) => ButtonWidget(
                onTap: () {
                  Get.toNamed(AppRoutes.wishlistDetail,arguments: {isCosmetic:true,isLive:true});
                },
                child: const WishListItemView(
                  image: iconsMakeUp,
                  title: "Marshmallow Sm...",
                ).marginOnly(right: margin_10))).marginOnly(left: margin_15),
      );

  _categoryFoodView() => Container(
        width: Get.width,
        padding:
            EdgeInsets.only(left: margin_15, top: margin_8, bottom: margin_8),
        margin: EdgeInsets.symmetric(vertical: margin_15),
        decoration: BoxDecoration(
          color: Colors.grey.shade200,
        ),
        child: TextView(
          text: "Food",
          textStyle: textStyleBodyLarge().copyWith(
              color: Colors.black,
              fontSize: font_14,
              fontWeight: FontWeight.w600),
        ),
      );

  _foodListView() => SizedBox(
        height: height_150,
        child: ListView.builder(
            itemCount: 3,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) => ButtonWidget(onTap: (){
              Get.toNamed(AppRoutes.wishlistDetail,arguments: {isCosmetic:false,isLive:true});

            },
              child: const WishListItemView(
                    image: iconsPizza,
                    title: "Pizza in evening sna...",
                  ).marginOnly(right: margin_10),
            )).marginOnly(left: margin_15),
      );
}
