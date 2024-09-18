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

class SucessDialogWidget extends StatelessWidget {
  final String? image;
  final String? title;
  final String? descrption;
  const SucessDialogWidget({super.key, this.image, this.title, this.descrption});

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Container(padding: EdgeInsets.all(margin_15),
          margin: EdgeInsets.symmetric(horizontal: margin_30),decoration: BoxDecoration(color: Colors.white,borderRadius: BorderRadius.all(Radius.circular(margin_15))),
          child: Column(crossAxisAlignment: CrossAxisAlignment.center,mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              _imageView(),
              _headingWidget(),
              _descrptionWidget(),
            ],
          ),
        ),
      );

  }

  _imageView() => AssetImageWidget(image ?? iconsMakeUp,
          imageHeight: margin_150,
          imageWidth: Get.width,
          imageFitType: BoxFit.cover,
          radiusAll: height_5);

  _headingWidget() => Row(crossAxisAlignment: CrossAxisAlignment.center,mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextView(
                  text: title,
                  textStyle: textStyleBodyLarge().copyWith(
                      color: Colors.black,
                      fontSize: font_16,
                      fontWeight: FontWeight.w600))
              .marginOnly(left: margin_10),
          AssetImageWidget(iconsEmoji_1,
              imageHeight: margin_25,
              imageWidth: margin_25,
              imageFitType: BoxFit.cover,
              radiusAll: height_5),
        ],
      ).marginOnly(top: margin_15);

  _descrptionWidget() => TextView(
          text: descrption??"",
          textAlign: TextAlign.center,
          maxLines: 1000,
          textStyle: textStyleBodyLarge().copyWith(
              color: Colors.black.withOpacity(.5),
              fontSize: font_14,
              fontWeight: FontWeight.w400))
      .marginOnly(left: margin_10);
}
