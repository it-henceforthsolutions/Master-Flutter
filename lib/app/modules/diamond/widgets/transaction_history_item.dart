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

class TransactionItemView extends StatelessWidget {
  final int index;
  const TransactionItemView({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric( vertical: margin_10),
      decoration: BoxDecoration(
          color: AppColors.whiteColor.withOpacity(.7),
          borderRadius: BorderRadius.circular(margin_8)),
      child: Row(children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                AssetImageWidget(
                  iconsDianmod,
                  imageHeight: height_20,
                  imageWidth: height_20,
                ),
                _myDiamondsCount(),
              ],
            ),
            SizedBox(
              height: margin_5,
            ),
            _myDiamondsPrice(),
          ],
        ),
        const Spacer(),
        Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            _creditedDebited(),
            SizedBox(
              height: margin_5,
            ),
            _dateTime(),
          ],
        ),
      ]),
    );
  }

  Widget _myDiamondsCount() => TextView(
        text: "10",
        textStyle: textStyleHeadlineLarge().copyWith(
            color: Colors.black,
            fontSize: font_16,
            fontWeight: FontWeight.w600),
      ).marginOnly(left: margin_5);

  Widget _myDiamondsPrice() => Container(
        padding:
            EdgeInsets.symmetric(horizontal: margin_20, vertical: margin_4),
        decoration: BoxDecoration(
            color: AppColors.creamColor.withOpacity(.7),
            borderRadius: BorderRadius.circular(margin_15)),
        child: TextView(
          text: "\$10",
          textStyle: textStyleHeadlineLarge().copyWith(
              color: AppColors.appColor,
              fontSize: font_18,
              fontWeight: FontWeight.w700),
        ).marginOnly(right: margin_5),
      );

  Widget _creditedDebited() => Container(
        padding:
            EdgeInsets.symmetric(horizontal: margin_13, vertical: margin_6),
        decoration: BoxDecoration(
            color: index%2==0?AppColors.parrotColor:AppColors.redColor,
            borderRadius: BorderRadius.circular(margin_15)),
        child: TextView(
          text: index%2==0?strCredited:strDebited,
          textStyle: textStyleHeadlineLarge().copyWith(
              color: AppColors.whiteColor,
              fontSize: font_12,
              fontWeight: FontWeight.w700),
        ).marginOnly(right: margin_5),
      );

  Widget _dateTime() => TextView(
        text: "6 Nov 2023",
        textStyle: textStyleHeadlineLarge().copyWith(
            color: Colors.black.withOpacity(.5),
            fontSize: font_12,
            fontWeight: FontWeight.w400),
      ).marginOnly(left: margin_5);
}
