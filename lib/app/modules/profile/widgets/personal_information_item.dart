/*
 * @copyright : Henceforth Pvt. Ltd. <info@henceforthsolutions.com>
 * @author     : Gaurav Negi
 * All Rights Reserved.
 * Proprietary and confidential :  All information contained herein is, and remains
 * the property of Henceforth Pvt. Ltd. and its partners.
 * Unauthorized copying of this file, via any medium is strictly prohibited.
 *
 */

import 'package:engagely/app/core/widget/ripple.dart';
import 'package:engagely/app/export.dart';

class PersonalInformationItem extends StatelessWidget {
  final Function() onTap;
  final String? title;
  final String? descrption;
  const PersonalInformationItem(
      {super.key, required this.onTap, this.title, this.descrption});

  @override
  Widget build(BuildContext context) {
    return ButtonWidget(
      onTap: onTap,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          TextView(
            text: title,
            maxLines: 1,
            textStyle:
                textStyleTitleLarge().copyWith(fontWeight: FontWeight.w600),
          ),
          TextView(
            text: descrption,
            maxLines: 1,
            textStyle: textStyleBodyMedium().copyWith(
                fontWeight: FontWeight.w500, color: AppColors.greyColor),
          ).paddingOnly(left: margin_3),
        ],
      ).paddingSymmetric(horizontal: margin_8, vertical: margin_5),
    );
  }
}
