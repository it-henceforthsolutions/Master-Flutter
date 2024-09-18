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

class DialogWidget extends StatelessWidget {
  final String? image;
  final String? title;
  final String? sucessText;
  final String? failureText;
  final double? imageHeight;
  final double? imageWidth;
  final String? descrption;
  final bool? isSucessButtonShow;
  final bool? isFailureButtonShow;
  final headingStyle;
  final padding;
  final descrptionStyle;
  final Widget? descrptionWidget;
  final Function()? onAccepted;
  final Function()? onDeclined;
  const DialogWidget(
      {super.key,
      this.image,
      this.title,
      this.descrption,
      this.onAccepted,
      this.onDeclined,
      this.descrptionWidget,
      this.sucessText,
      this.failureText,
      this.isSucessButtonShow = true,
      this.isFailureButtonShow = true,
      this.imageHeight,
      this.imageWidth,
      this.headingStyle,
      this.descrptionStyle, this.padding});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: Get.width,
        padding: EdgeInsets.symmetric(horizontal: margin_15,vertical: margin_25),
        margin: EdgeInsets.symmetric(horizontal: margin_20),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(margin_15))),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            image==null?emptySizeBox():_imageView(),
            _headingWidget(),
            _descrptionWidget(),
            isSucessButtonShow == true ? _acceptButton() : emptySizeBox(),
            isFailureButtonShow == true ? _declineTextView() : emptySizeBox(),
          ],
        ),
      ),
    );
  }

  Widget _imageView() => Padding(padding: padding??EdgeInsets.zero,
    child: AssetImageWidget(image ?? iconsProfile,
        imageHeight: imageHeight ?? margin_80,
        imageWidth: imageWidth ?? margin_80,
        imageFitType: BoxFit.contain,
    ),
  );

  Widget _headingWidget() => title == null
      ? emptySizeBox()
      : TextView(
              text: title,
              textStyle: headingStyle??textStyleBodyLarge().copyWith(
                  color: Colors.black,
                  fontSize: font_18,
                  fontWeight: FontWeight.w600))
          .marginOnly(left: margin_10, top: margin_15);

  Widget _descrptionWidget() =>
      descrptionWidget ??
      TextView(
              text: descrption,
              textAlign: TextAlign.center,
              maxLines: 1000,
              textStyle: descrptionStyle??textStyleBodyLarge().copyWith(
                  color: Colors.black.withOpacity(.5),
                  fontSize: font_14,
                  fontWeight: FontWeight.w400))
          .marginOnly(top: margin_10,bottom: margin_10);

  Widget _acceptButton() => Transform.scale(
        scale: .9,
        child: MaterialButtonWidget(
          onPressed: onAccepted,
          buttonText: sucessText ?? strAccept,
          textColor: Colors.white,
          buttonBgColor: AppColors.appColor,
        ),
      ).marginOnly(top: margin_10);

  Widget _declineTextView() => ButtonWidget(
        onTap: onDeclined,
        child: TextView(
                text: failureText ?? strDecline,
                textAlign: TextAlign.center,
                maxLines: 1000,
                textStyle: textStyleBodyLarge().copyWith(
                    color: Colors.black,
                    fontSize: font_14,
                    decoration: TextDecoration.underline,
                    fontWeight: FontWeight.w600))
            .marginOnly(top: margin_10),
      );
}
