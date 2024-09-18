/*
 * @copyright : Henceforth Pvt. Ltd. <info@henceforthsolutions.com>
 * @author     : Gaurav Negi
 * All Rights Reserved.
 * Proprietary and confidential :  All information contained herein is, and remains
 * the property of Henceforth Pvt. Ltd. and its partners.
 * Unauthorized copying of this file, via any medium is strictly prohibited.
 *
 */

import 'package:engagely/app/modules/live/controller/end_live_video_controller.dart';

import '../../../export.dart';

class EndLiveVideoView extends BaseView<EndLiveVideoController> {
  @override
  PreferredSizeWidget? appBar(BuildContext context) {
    return null;
  }

  @override
  Color statusBarColor() {
    return Colors.black;
  }

  @override
  Color pageBackgroundColor() {
    return Colors.black;
  }

  @override
  Brightness statusBarBrightness() {
    return Brightness.light;
  }

  @override
  Widget body(BuildContext context) {
    return SizedBox(
      height: Get.height,
      child: Column(
        children: [
          _endLiveVideoTextView(),
          _button(),
        ],
      ).marginSymmetric(horizontal: margin_18),
    );
  }

  _endLiveVideoTextView() => Expanded(
        child: Center(
          child: TextView(
            maxLines: 4,
            text: strEndVideo,
            textAlign: TextAlign.center,
            textStyle: textStyleHeadlineLarge().copyWith(color: Colors.white),
          ),
        ),
      );

  _button() => Align(
        alignment: Alignment.bottomCenter,
        child: Row(
          children: [
            _cancelButton(),
            SizedBox(
              width: margin_10,
            ),
            _endNowButton(),
          ],
        ).marginOnly(bottom: margin_30),
      );

  Widget _cancelButton() => Expanded(
        child: MaterialButtonWidget(
          buttonBgColor: AppColors.whiteColor.withOpacity(.3),
          onPressed: () {
            Get.back();
          },
          buttonText: strCancel,
          buttonTextStyle: textStyleBodyLarge()
              .copyWith(fontWeight: FontWeight.w500, color: Colors.white),
          textColor: Colors.white,
        ).marginOnly(top: margin_15),
      );

  Widget _endNowButton() => Expanded(
        child: MaterialButtonWidget(
          buttonBgColor: AppColors.redPrimaryColor,
          onPressed: () {
            Get.toNamed(AppRoutes.broadcastEndView);
          },
          buttonText: strEndNow,
          buttonTextStyle: textStyleBodyLarge()
              .copyWith(fontWeight: FontWeight.w500, color: Colors.white),
          textColor: Colors.white,
        ).marginOnly(top: margin_15),
      );
}
