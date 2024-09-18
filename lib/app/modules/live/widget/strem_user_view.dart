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
import 'package:engagely/app/modules/live/controller/stream_music/stream_music_controller.dart';

class StreamUserView extends StatelessWidget {
  final String? imageUrl;
  final String? name;
  final UserName? item;
  const StreamUserView(
      {super.key, this.imageUrl, this.name, required this.item});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        AssetImageWidget(
          item?.image ?? "",
          imageHeight: margin_65,
          imageWidth: margin_65,
        ),
        item?.name == null
            ? emptySizeBox()
            : TextView(
                text: item?.name ?? "",
                textStyle: textStyleBodyMedium().copyWith(
                    color: Colors.white,
                    fontSize: font_12,
                    fontWeight: FontWeight.w600),
              ).marginOnly(top: margin_5)
      ],
    );
  }
}
