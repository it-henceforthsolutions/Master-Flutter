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

class ImageViewer extends StatelessWidget {
  final Function() onTap;
  final bool? isShowAppBar;
  const ImageViewer({super.key, required this.onTap, this.isShowAppBar});

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      isShowAppBar == true
          ? AppBar(
              elevation: elevation_0,
              leading: ButtonWidget(
                  onTap: () {
                    Get.back(result: true);
                  },
                  child: Icon(
                    Icons.arrow_back_ios,
                    size: margin_18,color: Colors.white,
                  )),
              backgroundColor: Colors.transparent,
              title: TextView(
                  text: "Winner of the competition",
                  textStyle: textStyleHeadlineMedium().copyWith(
                      fontWeight: FontWeight.w500, fontSize: font_18,color: Colors.white)))
          : emptySizeBox(),
      _imageView()
    ]);
  }

  _imageView() => ButtonWidget(onTap: onTap,
    child: Align(
          alignment: Alignment.center,
          child: SizedBox(
            height: margin_250,
            width: margin_250,
            child: Stack(children: [
              AssetImageWidget(iconsLive,
                  imageWidth: margin_250,
                  imageHeight: margin_250,
                  radiusAll: margin_10,
                  imageFitType: BoxFit.cover),
              Align(
                alignment: Alignment.bottomLeft,
                child: TextView(
                        text: "Brenda",
                        textStyle: textStyleHeadlineMedium().copyWith(
                            fontWeight: FontWeight.w500,
                            fontSize: font_18,
                            color: Colors.white))
                    .marginSymmetric(horizontal: margin_15,vertical: margin_18),
              )
            ]),
          ),
        ),
  );

  Widget _voteButton() => ButtonWidget(
        onTap: onTap,
        child: Container(
          margin: EdgeInsets.only(right: margin_10),
          padding:
              EdgeInsets.symmetric(horizontal: margin_18, vertical: margin_5),
          decoration: BoxDecoration(
              color: AppColors.appColor,
              borderRadius: BorderRadius.circular(margin_5)),
          child: TextView(
              text: strVote,
              textStyle: textStyleBodyMedium()
                  .copyWith(color: Colors.white, fontWeight: FontWeight.w600)),
        ),
      );
}
