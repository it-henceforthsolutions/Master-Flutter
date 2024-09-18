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

class GiftItemView extends StatelessWidget {
  final bool? isFree;
  final String? icon;
  final String? price;
  final bool showIcon;
  final bool isCoin;
  final int? isEmoji;

  const GiftItemView({super.key, this.isFree, this.icon, this.price,this.showIcon=true, required this.isCoin,  this.isEmoji});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
          child: AssetImageWidget(icon ?? "",
              imageWidth: height_55,
              imageHeight: height_55,
              radiusAll: height_55),
        ),
        price == "Free"
            ? TextView(
          text: "Free",
          textStyle: textStyleBodyLarge().copyWith(
              color: Colors.grey,
              fontSize: font_14,
              fontWeight: FontWeight.w600),
        ).marginOnly(left: margin_5)
            : Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            showIcon?   AssetImageWidget(isCoin==true?iconsCoins:iconsDianmod,
                imageWidth:isEmoji==1?height_12: height_15,
                imageHeight: isEmoji==1?height_12: height_15,
                radiusAll:isEmoji==1?height_12: height_15,).marginAll(isEmoji==1?height_5: margin_0):const SizedBox(),
            TextView(
                text: price,
                textStyle: textStyleBodyLarge().copyWith(
                    color: Colors.grey,
                    fontSize: font_14,
                    fontWeight: FontWeight.w600))
                .paddingOnly(left: margin_5),
          ],
        )
      ],
    );
  }
}
