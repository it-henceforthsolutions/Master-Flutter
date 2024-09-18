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



class CategoryItem {
  var image;
  var title;

  CategoryItem({required this.title, this.image});
}

class AddWishListController extends BaseController
   {


  List<CategoryItem?> data = [
    CategoryItem(title: "Marshmallow Pr...", image: iconsMakeUp),
    CategoryItem(title: "The Healer", image: iconsHealer),
    CategoryItem(title: "Marshmallow Pr...", image: iconsMakeUp),
    CategoryItem(title: "The Healer", image: iconsHealer),
    CategoryItem(title: "Marshmallow Pr...", image: iconsMakeUp),
    CategoryItem(title: "The Healer", image: iconsHealer),
    CategoryItem(title: "Marshmallow Pr...", image: iconsMakeUp),
    CategoryItem(title: "The Healer", image: iconsHealer),
    CategoryItem(title: "Marshmallow Pr...", image: iconsMakeUp),
    CategoryItem(title: "The Healer", image: iconsHealer),

  ];



}
