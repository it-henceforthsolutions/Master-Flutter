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

class CommentItemView extends StatelessWidget {
  const CommentItemView({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(children: [
      Container(
        decoration: BoxDecoration(
            border: Border.all(color: Colors.white, width: margin_2),
            borderRadius: BorderRadius.all(Radius.circular(margin_30))),
        child: AssetImageWidget(iconsProfile,
            imageWidth: height_28,
            imageHeight: height_28,
            radiusAll: height_28).paddingAll(margin_2),
      ),
      SizedBox(width: margin_8,),
      Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start,children: [

        TextView(
            text: "username",
            textStyle: textStyleBodyMedium().copyWith(fontSize: font_16,
                color: Colors.white, fontWeight: FontWeight.w600)),

        TextView(
            text: " Lorem ipsum dolor sit amet consect.",
            textStyle: textStyleBodyMedium().copyWith(fontSize: font_14,
                color: Colors.grey, fontWeight: FontWeight.w500)),
      ],))
    ],);
  }
}
