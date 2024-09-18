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
import 'package:engagely/app/modules/wishlist/controllers/wishlist_home_controller.dart';

class WishListHomeView extends BaseView<WishListHomeController> {
  WishListHomeView({super.key});

  @override
  PreferredSizeWidget? appBar(BuildContext context) {
    return AppBarWidget(
      bgColor: Colors.white,
      isCustom: false,
      appBarTitleText: strWishlist,
      backIconColor: Colors.black,
      bottomWidget: TabBar(
        controller: controller.tabController,
        indicatorColor: AppColors.appColor,
        indicatorSize: TabBarIndicatorSize.tab,
        labelColor: AppColors.appColor,
        labelStyle: textStyleBodyLarge().copyWith(
            color: AppColors.appColor,
            fontSize: font_16,
            fontWeight: FontWeight.w500),
        unselectedLabelColor: Colors.grey,
        unselectedLabelStyle: textStyleBodyLarge().copyWith(
            color: Colors.grey, fontSize: font_16, fontWeight: FontWeight.w500),
        onTap: (index) {
          controller.selectedIndex = index;
          debugPrint("selectedIndex ${controller.selectedIndex} ${index}");
          controller.update();
        },
        tabs: const [
          Tab(
            child: TextView(text: strProducts),
          ),
          Tab(
            child: TextView(text: strFoods),
          ),
        ],
      ),
    );
  }

  @override
  Widget body(BuildContext context) {
    return  Column(
          children: [
            _tabView(),
            _wishlistProducts(),
          ],
        ).marginSymmetric(vertical: margin_15);
  }

  Widget _tabView() => Container(
        margin: EdgeInsets.symmetric(horizontal: margin_15),
        padding: EdgeInsets.all(margin_5),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(margin_30)),
            border: Border.all(color: Colors.grey.shade300, width: margin_1)),
        child: TabBar(
          controller: controller.tabRemaingFullFillController,
          indicator: BoxDecoration(
            borderRadius: BorderRadius.circular(50),
            color: AppColors.appColor,
          ),
          labelColor: AppColors.whiteColor,
          labelStyle: textStyleBodyLarge().copyWith(
              color: AppColors.whiteColor,
              fontSize: font_16,
              fontWeight: FontWeight.w500),
          unselectedLabelColor: Colors.grey,
          unselectedLabelStyle: textStyleBodyLarge().copyWith(
              color: Colors.grey,
              fontSize: font_16,
              fontWeight: FontWeight.w500),
          onTap: (index) {
            controller.selectedIndexProduct.value = index;
            debugPrint("selectedIndex ${controller.selectedIndexProduct} ${index}");
            controller.update();
          },
          tabs: const [
            Tab(child: TextView(text: strRemaining)),
            Tab(
              child: TextView(text: strFullfilled),
            ),
          ],
        ),
      );

  Widget _wishlistProducts() => Expanded(
        child: Obx(()=>
       ListView.builder(
              itemCount: controller.selectedIndexProduct.value==0?controller.data.length:controller.fullFillItems.length,
              scrollDirection: Axis.vertical,
              itemBuilder: (context, index) => ButtonWidget(
                  onTap: () {
                    Get.toNamed(AppRoutes.wishlistDetail,
                        arguments: {isCosmetic: true});
                  },
                  child: Column(
                    children: [
                      _categoryItems(controller.selectedIndexProduct.value==0?controller.data[index].text:controller.fullFillItems[index].text),
                      _cosmeticListView(controller.selectedIndexProduct.value==0?controller.data[index].items:controller.fullFillItems[index].items),
                    ],
                  ))),
        ),
      );

  _categoryItems(String data) => Container(
        width: Get.width,
        padding:
            EdgeInsets.only(left: margin_15, top: margin_10, bottom: margin_10),
        margin: EdgeInsets.symmetric(vertical: margin_15),
        decoration: BoxDecoration(
          color: Colors.grey.shade100,
        ),
        child: TextView(
          text: data,
          textStyle: textStyleBodyLarge().copyWith(
              color: Colors.black,
              fontSize: font_16,
              fontWeight: FontWeight.w500),
        ),
      );

  _cosmeticListView(List<WishListItems>? items) => SizedBox(
        height: height_150,
        child: ListView.builder(
            itemCount: items?.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) => ButtonWidget(
                onTap: () {
                  if(controller.selectedIndexProduct.value==0) {
                    Get.toNamed(AppRoutes.wishlistDetail,
                        arguments: {isCosmetic: true, isMyWishList: true});
                  }else{
                    Get.toNamed(AppRoutes.wishlistDetail,
                        arguments: {isCosmetic: true, isFullField: true});
                  }
                },
                child:  WishListItemView(
                  image: items![index].image??"",
                  title: items[index].title,
                ).marginOnly(right: margin_10))).marginOnly(left: margin_15),
      );

  @override
  Widget? floatingActionButton() {
    return ButtonWidget(
      onTap: () {
        Get.toNamed(AppRoutes.productCategoryView);
      },
      child: Container(
        width: margin_50,
        height: margin_50,
        decoration: BoxDecoration(
            color: AppColors.appColor,
            borderRadius: BorderRadius.circular(margin_80)),
        child: Icon(
          Icons.add,
          size: margin_25,
          color: Colors.white,
        ),
      ),
    );
  }
}
