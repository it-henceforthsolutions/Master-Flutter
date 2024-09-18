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
import 'package:engagely/app/modules/wishlist/controllers/product_category_controller.dart';
import 'package:engagely/app/modules/wishlist/controllers/wishlist_home_controller.dart';
import 'package:engagely/app/modules/wishlist/widgets/category_item_view.dart';

class ProductCategoryView extends BaseView<ProductCategoryController> {
  ProductCategoryView({super.key});

  @override
  PreferredSizeWidget? appBar(BuildContext context) {
    return AppBarWidget(
      bgColor: Colors.white,
      isCustom: false,
      appBarTitleText: strAddProductWishList,
      backIconColor: Colors.black,
    );
  }

  @override
  Widget body(BuildContext context) {
    return GridView.builder(
        itemCount: controller.data.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisSpacing: margin_18,
            crossAxisCount: 2,
            childAspectRatio: 1.1),
        itemBuilder: (ctx, index) {
          return ButtonWidget(
            onTap: () {
              Get.toNamed(AppRoutes.allProductsView,
                  arguments: {dataKey: controller.data[index]});
            },
            child: CategoryItemView(
              item: controller.data[index],
            ),
          );
        }).marginSymmetric(horizontal: margin_18, vertical: margin_10);
  }
}
