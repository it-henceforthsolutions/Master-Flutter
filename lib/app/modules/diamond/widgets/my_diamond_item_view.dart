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

class MyDiamondItemView extends StatelessWidget {
  const MyDiamondItemView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: margin_15,vertical: margin_15),
      decoration: BoxDecoration(   color: AppColors.creamColor.withOpacity(.7),borderRadius: BorderRadius.circular(margin_8)),

      child: Row(children: [
        AssetImageWidget(iconsDianmod,imageHeight: height_20,imageWidth: height_20,),
        _myDiamondsCount(),
        const Spacer(),
        _myDiamondsPrice(),
        _moreOption(),
      ]),
    );
  }

  Widget _myDiamondsCount() => TextView(
    text: "10",
    textStyle: textStyleHeadlineLarge().copyWith(
        color: AppColors.greyColor,
        fontSize: font_14,
        fontWeight: FontWeight.w600),
  ).marginOnly(left: margin_5);
  Widget _myDiamondsPrice() => TextView(
    text: "\$10",
    textStyle: textStyleHeadlineLarge().copyWith(
        color: AppColors.appColor,
        fontSize: font_16,
        fontWeight: FontWeight.w700),
  ).marginOnly(right: margin_5);

  Widget _moreOption()=> AssetImageWidget(iconsMore,imageHeight: height_20,imageWidth: height_20,);
}
