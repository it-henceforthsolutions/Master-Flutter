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

class AuthBaseView extends StatelessWidget {
  final bool? isBackButton;
  final bool? isSkipButton;
  final Function()? onBackPressed;
  final Function()? onSkipPressed;
  final Widget? bodyWidget;
  const AuthBaseView(
      {super.key,
      this.isBackButton,
      this.bodyWidget,
      this.onBackPressed,
      this.isSkipButton,
      this.onSkipPressed});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        AssetImageWidget(iconsSplashBackground,
            imageWidth: Get.width,
            imageHeight: Get.height,
            imageFitType: BoxFit.cover),
        bodyView(),
      ],
    );
  }

  bodyView() => SizedBox(
        width: Get.width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _backButton(),
            _skipButton(),
            _appLogo(),
            _bodyWidget(),
          ],
        ),
      );

  Widget _backButton() => isBackButton == true
      ? SafeArea(
          child: ButtonWidget(
            onTap: onBackPressed,
            child: Container(
              margin: EdgeInsets.all(margin_15),
              height: height_30,
              width: height_30,
              padding: EdgeInsets.only(
                  left: margin_5, top: margin_5, bottom: margin_5),
              decoration: BoxDecoration(
                  color: AppColors.whiteColor,
                  borderRadius: BorderRadius.circular(margin_30)),
              child: Icon(Icons.arrow_back_ios, size: margin_15),
            ),
          ),
        )
      : emptySizeBox();

  Widget _skipButton() => isSkipButton == true
      ? Align(
          alignment: Alignment.topRight,
          child: SafeArea(
            child: ButtonWidget(
              onTap: onSkipPressed,
              child: Container(
                margin: EdgeInsets.only(top: margin_15, right: margin_15),
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
        )
      : emptySizeBox();

  Widget _appLogo() =>
      Center(child: AssetImageWidget(iconsAppLogo, imageWidth: margin_150))
          .marginOnly(top: margin_30,bottom: margin_100);

  _bodyWidget() => Expanded(
        child: Container(
          width: Get.width,
          decoration: BoxDecoration(
              color: AppColors.whiteColor,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(margin_20),
                  topRight: Radius.circular(margin_20))),
          child: bodyWidget,
        ),
      );
}
