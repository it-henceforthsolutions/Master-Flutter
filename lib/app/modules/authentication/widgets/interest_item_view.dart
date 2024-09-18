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
import 'package:engagely/app/modules/authentication/models/request_model/interest_model.dart';

class InterestItemView extends StatelessWidget {
  final InterestModel? interestModel;
  final Color backgroundColor;
  final Color outlineColor;

  const InterestItemView({super.key,this.interestModel, required this.backgroundColor, required this.outlineColor});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: backgroundColor,
          borderRadius:
          BorderRadius.all(Radius.circular(margin_10)),
          border: Border.all(color:outlineColor)),
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Expanded(
              child: AssetImageWidget(
                interestModel?.image??"",
                imageHeight: height_35,
                imageWidth: height_35,
              ).marginOnly(top: margin_10),
            ),
            TextView(
              text:interestModel?.title??"",
              textStyle: textStyleHeadlineLarge()
                  .copyWith(fontSize: font_16),
            ).marginOnly(top: margin_8, bottom: margin_8)
          ]),
    );
  }
}
