/*
 * @copyright : Henceforth Pvt. Ltd. <info@henceforthsolutions.com>
 * @author     : Gaurav Negi
 * All Rights Reserved.
 * Proprietary and confidential :  All information contained herein is, and remains
 * the property of Henceforth Pvt. Ltd. and its partners.
 * Unauthorized copying of this file, via any medium is strictly prohibited.
 *
 */

import 'package:engagely/app/core/base/base_controller.dart';
import 'package:engagely/app/export.dart';

class WishListModel {
  var text;
  List<WishListItems>? items;
  WishListModel({
    required this.text,
    this.items,
  });
}

class WishListItems {
  var image;
  var title;

  WishListItems({required this.title, this.image});
}

class WishListHomeController extends BaseController
    with GetTickerProviderStateMixin {
  int selectedIndex = 0;
  RxInt selectedIndexProduct = 0.obs;
  TabController? tabController;
  TabController? tabRemaingFullFillController;

  List<WishListModel> data = [
    WishListModel(text: "Cosmetics", items: [
      WishListItems(title: "Marshmallow Pr...", image: iconsMakeUp),
      WishListItems(title: "The Healer", image: iconsHealer)
    ]),
    WishListModel(text: "Shoes", items: [
      WishListItems(title: "Nike White Shoe", image: iconsNike),
      WishListItems(title: "Air Jordan Black", image: iconsJordan)
    ]),
    WishListModel(text: "Hand bags", items: [
      WishListItems(title: "Leather Bag", image: iconsLeather),
      WishListItems(title: "Leather Bag", image: iconsLeather)
    ]),
  ];


  List<WishListModel> fullFillItems = [
    WishListModel(text: "Cosmetics", items: [
      WishListItems(title: "Marshmallow Pr...", image: iconsMakeUp),

    ]),
    WishListModel(text: "Shoes", items: [
      WishListItems(title: "Nike White Shoe", image: iconsNike),

    ]),
    WishListModel(text: "Hand bags", items: [
      WishListItems(title: "Leather Bag", image: iconsLeather),

    ]),
  ];

  onInit() {
    tabController = TabController(length: 2, vsync: this);
    tabRemaingFullFillController = TabController(length: 2, vsync: this);

    super.onInit();
  }
}
