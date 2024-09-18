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
import 'package:engagely/app/core/widget/switch_widget.dart';
import 'package:engagely/app/export.dart';
import 'package:engagely/app/modules/settings/models/request_models/account_information_model.dart';

class PrivacyItemView extends StatelessWidget {
  final Function(bool? data) onChanged;
  final  bool? isSelected;
  final String? title;
  final String? descrption;
  const PrivacyItemView(
      {super.key, required this.onChanged, this.isSelected, this.title, this.descrption, });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [

            Expanded(
                child: TextView(
              text: title ?? "",
              textStyle: textStyleBodyLarge()
                  .copyWith(fontWeight: FontWeight.w500, fontSize: font_16),
            )),
            CustomSwitch(
              value: isSelected!,
              onChanged: onChanged
            ),
          ],
        ),
        TextView(
          text: descrption ?? "",
          maxLines: 5,
          textStyle: textStyleBodyLarge()
              .copyWith(fontWeight: FontWeight.w400, fontSize: font_14,color: Colors.grey),
        ).marginOnly(top: margin_5)
      ],
    );
  }
}
