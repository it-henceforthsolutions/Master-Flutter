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

class OnBoardingItem extends StatelessWidget {
  final String? image;
  final String? heading;
  final String? subheading;

  const OnBoardingItem({super.key,
    this.image,
    required this.heading,
    required this.subheading,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        AssetImageWidget(iconsAppLogo,imageWidth: margin_150),
        const SizedBox(
          height: 10,
        ),
        TextView(
          text: subheading ?? "",
          textAlign: TextAlign.center,
          maxLines: 4,
          textStyle: textStyleBodyMedium().copyWith(color: Colors.white,fontSize: font_14,height: 1.5),
        ),
      ],
    ).paddingSymmetric(horizontal: margin_35);
  }
}
