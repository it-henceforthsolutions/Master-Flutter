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
import 'package:engagely/app/modules/wishlist/controllers/add_wishlist_controller.dart';
import 'package:engagely/app/modules/wishlist/controllers/all_products_controller.dart';
import 'package:engagely/app/modules/wishlist/controllers/product_category_controller.dart';
import 'package:engagely/app/modules/wishlist/controllers/wishlist_home_controller.dart';

class AddWishListBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AddWishListController>(
          () => AddWishListController(),
    );
  }
}
