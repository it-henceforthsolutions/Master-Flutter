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

class OnBoarding extends GetView<OnBoardingController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: _bodyWidget());
  }

  Widget _bodyWidget() => Stack(
        children: [
          _backGroundImage(),
          _skipButton(),
          _bottomView(),
        ],
      );

  Widget _backGroundImage() => AssetImageWidget(
        iconsOnBoardingImage,
        imageHeight: Get.height,
        imageWidth: Get.width,
        imageFitType: BoxFit.cover,
      );

  Widget _skipButton() => SafeArea(
        child: Align(
          alignment: Alignment.topRight,
          child: ButtonWidget(
            onTap: () {
              controller.onPressSkip();
            },
            child: Container(
              margin: EdgeInsets.only(top: margin_15, right: margin_10),
              padding: EdgeInsets.symmetric(
                  horizontal: margin_15, vertical: margin_5),
              decoration: BoxDecoration(
                  color: AppColors.whiteColor.withOpacity(.3),
                  borderRadius: BorderRadius.circular(margin_15)),
              child: TextView(
                  text: strSkip,
                  textStyle: textStyleBodyMedium().copyWith(
                      color: AppColors.whiteColor,
                      fontWeight: FontWeight.w600)),
            ),
          ),
        ),
      );

  Widget _bottomView() => Align(
        alignment: Alignment.bottomCenter,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            _content(),
            _getStartedButton(),
          ],
        ),
      );

  Widget _content() => const OnBoardingItem(
        heading: strApplicationName,
        subheading: strOnBaordingDescrption,
      );

  Widget _getStartedButton() => MaterialButtonWidget(
      buttonBgColor: AppColors.appColor,
      buttonText: strGetStarted,
      textColor: Colors.white,
      onPressed: () {
        controller.getStarted();
      }).paddingOnly(left: margin_15, right: margin_15,top: margin_20,bottom: margin_40);
}
