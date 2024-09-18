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

class NearByItemView extends StatelessWidget {
  final String? image;
  const NearByItemView({
    super.key, this.image,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: Get.width,
      height: Get.height,
      child: Stack(children: [
        Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(margin_10),
            ),
            child: ClipRRect(borderRadius: BorderRadius.circular(margin_10),
              child: ColorFiltered(
                colorFilter: ColorFilter.mode(
                    Colors.black.withOpacity(.3), BlendMode.darken),
                child: AssetImageWidget(
                  image??"",
                  imageHeight: Get.height,
                  imageWidth: Get.width,
                  imageFitType: BoxFit.fill,
                ),
              ),
            )),
        _skipButton(),
        _userInfo(),
      ]),
    );
  }

  Widget _skipButton() => Align(
        alignment: Alignment.topRight,
        child: Container(
          margin: EdgeInsets.only(right: margin_8, top: margin_10),
          padding:
              EdgeInsets.symmetric(horizontal: margin_10, vertical: margin_4),
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(margin_30)),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(Icons.remove_red_eye, size: margin_15, color: Colors.black),
              SizedBox(
                width: margin_3,
              ),
              TextView(
                  text: "12k",
                  textStyle: textStyleBodyMedium().copyWith(
                      color: Colors.black, fontWeight: FontWeight.w600)),
            ],
          ),
        ),
      );

  _userInfo() => Align(
        alignment: Alignment.bottomLeft,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            TextView(
                text: "Sophie Owens",
                textAlign: TextAlign.start,
                textStyle: textStyleBodyMedium().copyWith(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                    fontSize: font_16)),
            _countryInfo(),
          ],
        ).marginSymmetric(horizontal: margin_8, vertical: margin_5),
      );

  Widget _countryInfo() => Align(
        alignment: Alignment.topRight,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            AssetImageWidget(
              iconsIcFlag,
              imageHeight: height_10,
              imageWidth: height_10,
            ),
            SizedBox(
              width: margin_3,
            ),
            Expanded(
              child: TextView(
                  text: "United States, 7.5 km away",
                  textStyle: textStyleBodyMedium().copyWith(
                      color: Colors.white, fontWeight: FontWeight.w600)),
            ),
          ],
        ),
      );
}
