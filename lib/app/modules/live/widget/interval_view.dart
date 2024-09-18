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

class IntervalItemView extends StatelessWidget {
  final String? image;
  final String? title;
  final double? size;
  const IntervalItemView({super.key, this.image, this.title, this.size});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        AssetImageWidget(image ?? "",
                imageWidth: size, imageHeight: size, radiusAll: size)
            .marginOnly(bottom: image == iconsEye ? margin_2 : margin_0),
        TextView(
                text: title,
                textStyle: textStyleBodyMedium().copyWith(
                    fontSize: font_14,
                    color: Colors.white.withOpacity(.8),
                    fontWeight: FontWeight.w500))
            .marginOnly(left: margin_5),
      ],
    );
  }
}
