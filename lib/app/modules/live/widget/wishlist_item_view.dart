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

class WishListItemView extends StatelessWidget {
  final bool? isFree;
  final String? title;
  final String? image;
  final String? price;
  const WishListItemView({super.key, this.isFree, this.title, this.price, this.image});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: margin_15),
      width: margin_160,
      height: height_5,
      decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: Colors.grey.shade300),
          borderRadius: BorderRadius.circular(margin_10)),child: Column(crossAxisAlignment: CrossAxisAlignment.start,
    children: [
        SizedBox(height: margin_15,),
      Expanded(
        child: AssetImageWidget(image??"",
            imageHeight: Get.height,imageWidth: Get.height,imageFitType: BoxFit.cover,
            radiusAll: height_5).marginSymmetric(horizontal: margin_15),
      ),

      TextView(
          text: title??"",
          textStyle: textStyleBodyLarge().copyWith(
              color: Colors.black,
              fontSize: font_14,
              fontWeight: FontWeight.w600)).paddingOnly(left: margin_15,bottom: margin_3,top: margin_5),

      TextView(
          text: "\$100",
          textStyle: textStyleBodyLarge().copyWith(
              color: AppColors.appColor,
              fontSize: font_14,
              fontWeight: FontWeight.w600)).paddingOnly(left: margin_15,bottom: margin_8),
    ]),
    );
  }
}
