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
import 'package:engagely/app/modules/settings/models/request_models/account_information_model.dart';

class SettingsItemView extends StatelessWidget {
  final AccountInfoModel? accountInfoModel;
  final Function() onTap;
  const SettingsItemView(
      {super.key, required this.accountInfoModel, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return ButtonWidget(
      onTap: onTap,
      child: Row(
        children: [
          AssetImageWidget(
            accountInfoModel?.icon ?? "",
            imageHeight: height_15,
            imageWidth: height_15,
          ),
          SizedBox(
            width: margin_15,
          ),
          Expanded(
              child: TextView(
            text: accountInfoModel?.title ?? "",
            textStyle: textStyleBodyLarge()
                .copyWith(fontWeight: FontWeight.w500, fontSize: font_16),
          )),
          Icon(
            Icons.arrow_forward_ios,
            color: Colors.grey,
            size: margin_15,
          ),
        ],
      ).paddingSymmetric(vertical: margin_15),
    );
  }
}
