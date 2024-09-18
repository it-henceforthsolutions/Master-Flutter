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

class MenuItemView extends StatelessWidget {
  final String? icon;
  final String? title;
  const MenuItemView({super.key, this.icon, this.title});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        AssetImageWidget(
          icon??"",
          imageWidth: margin_25,
          imageHeight: margin_25,
        ),
        Text(
          title??"",
          style:
          textStyleHeadlineLarge().copyWith(fontSize: font_14),
        ).marginOnly(left: margin_5),
      ],
    );
  }
}


