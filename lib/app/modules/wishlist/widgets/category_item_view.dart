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
import 'package:engagely/app/modules/wishlist/controllers/product_category_controller.dart';

class CategoryItemView extends StatelessWidget {
  final CategoryItem? item;

  const CategoryItemView({super.key, this.item});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: Get.width,
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        SizedBox(
          height: margin_15,
        ),
        Expanded(
          child: AssetImageWidget(item?.image ?? "",
                  imageHeight: Get.height,
                  imageWidth: Get.width,
                  imageFitType: BoxFit.cover,
                  radiusAll: height_5),
        ),
        TextView(
                text: item?.title ?? "",
                textStyle: textStyleBodyLarge().copyWith(
                    color: Colors.black,
                    fontSize: font_16,
                    fontWeight: FontWeight.w500)).marginOnly(top: margin_8)
            ,
      ]),
    );
  }
}
