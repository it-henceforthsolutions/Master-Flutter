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
import 'package:engagely/app/modules/wishlist/controllers/all_products_controller.dart';
import 'package:engagely/app/modules/wishlist/controllers/product_category_controller.dart';
import 'package:engagely/app/modules/wishlist/controllers/wishlist_home_controller.dart';
import 'package:engagely/app/modules/wishlist/widgets/category_item_view.dart';
import 'package:engagely/app/modules/wishlist/widgets/product_item_view.dart';

class AllProductsView extends BaseView<AllProductsController> {
  AllProductsView({super.key});

  @override
  PreferredSizeWidget? appBar(BuildContext context) {
    return AppBarWidget(
      bgColor: Colors.white,
      isCustom: false,
      actionWidget: ButtonWidget(
        onTap: () {},
        child: AssetImageWidget(iconsFilterIcon,
                imageWidth: margin_25, imageHeight: margin_25)
            .marginOnly(right: margin_15),
      ),
      appBarTitleText: Get.arguments[dataKey]?.title ?? "",
      backIconColor: Colors.black,
    );
  }

  @override
  Widget body(BuildContext context) {
    return _bodyWidget()
        .marginOnly(left: margin_18, right: margin_18, top: margin_18);
  }

  Widget _bodyWidget() => Column(
        children: [
          _searchEditText(),
          SizedBox(
            height: height_20,
          ),
          _gridView(),
        ],
      );

  Widget _searchEditText() => TextFieldWidget(
        hint: strSearch,
        contentPadding: EdgeInsets.symmetric(
          vertical: margin_12,
        ),
        inputType: TextInputType.name,
        fillColor: Colors.grey.shade200,
        prefixIcon: AssetImageWidget(
          iconsIcSearchL,
          imageWidth: margin_18,
          imageHeight: margin_18,
        ).marginOnly(left: margin_15, right: margin_10),
        inputAction: TextInputAction.next,
        decoration: OutlineInputBorder(
            borderRadius: BorderRadius.circular(radius_30),
            borderSide: BorderSide(color: Colors.grey.shade200)),
      );

  Widget _gridView() => Expanded(
        child: GridView.builder(
            itemCount: controller.data.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisSpacing: margin_8,
              mainAxisSpacing: margin_8,
              crossAxisCount: 2,
            ),
            itemBuilder: (ctx, index) {
              var productItem = controller.data[index];
              return ButtonWidget(
                onTap: () {
                  Get.toNamed(AppRoutes.wishlistDetail,
                      arguments: {isAddedForWishList: true});
                },
                child: ProductItemView(item: productItem),
              );
            }),
      );
}
