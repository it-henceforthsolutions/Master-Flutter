import 'package:engagely/app/core/widget/ripple.dart';
import 'package:engagely/app/modules/other_user_profile/controllers/video_call_controller.dart';

import '../../../export.dart';

class VideoCallView extends GetView<VideoCallController> {
  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light.copyWith(
            statusBarColor: Colors.transparent,
            // ios
            statusBarIconBrightness: Brightness.dark),
        child: Scaffold(
            body: Stack(
          children: [
            _backGroundImage(),
            _userInformation(),
            _callWidgets(),
          ],
        )));
  }

  _backGroundImage() => ColorFiltered(
      colorFilter:
          ColorFilter.mode(Colors.black.withOpacity(.4), BlendMode.darken),
      child: Obx(
        () => AssetImageWidget(
          controller.isRinging.value == true ? icVideoImg1 : icVideoImg2,
          imageHeight: Get.height,
          imageWidth: Get.width,
          imageFitType: BoxFit.fill,
        ),
      ));

  _bodyView() => Container(
        width: Get.width,
        child: Column(
          children: [_userInformation(), _callWidgets()],
        ),
      );

  _userInformation() => Obx(
        () => controller.isRinging.value == false
            ? emptySizeBox()
            : Align(
                alignment: Alignment.center,
                child: Container(
                  width: Get.width,
                  child: Column(
                    children: [
                      _userImage(),
                      _userName(),
                      _callRinging(),
                    ],
                  ).marginOnly(top: margin_100),
                ),
              ),
      );

  Widget _userImage() => Container(
        padding: EdgeInsets.all(margin_5),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(margin_80),
            border: Border.all(color: Colors.white, width: 1.5)),
        child: AssetImageWidget(
          icVideoImg1,
          imageHeight: margin_80,
          imageWidth: margin_80,
          radiusAll: margin_80,
          imageFitType: BoxFit.cover,
        ),
      );

  Widget _userName() => TextView(
        text: "Jessie Pinkmen",
        textAlign: TextAlign.start,
        textStyle: textStyleTitleLarge().copyWith(
            color: AppColors.whiteColor,
            fontWeight: FontWeight.w600,
            fontSize: font_18),
      ).marginOnly(top: margin_10);

  Widget _callRinging() => TextView(
        text: "Ringing...",
        textAlign: TextAlign.start,
        textStyle: textStyleTitleLarge().copyWith(
            color: Colors.grey, fontSize: font_12, fontWeight: FontWeight.w400),
      ).marginOnly(top: margin_5);

  _callWidgets() => Align(
        alignment: Alignment.bottomCenter,
        child: Container(
          width: Get.width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Obx(
                () => controller.isRinging.value == true
                    ? emptySizeBox()
                    : AssetImageWidget(
                        icVideoImg1,
                        imageHeight: margin_140,
                        imageWidth: margin_100,
                        imageFitType: BoxFit.cover,
                        radiusAll: margin_10,
                      ),
              ).marginOnly(bottom: margin_15, left: margin_25),
              Center(
                child: Container(
                    margin: EdgeInsets.only(bottom: margin_100),
                    decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(margin_60),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        _micButton(),
                        SizedBox(
                          width: margin_10,
                        ),
                        _videoCallButton(),
                        SizedBox(
                          width: margin_10,
                        ),
                        _cameraButton(),
                        SizedBox(
                          width: margin_10,
                        ),
                        _cancelButton(),
                      ],
                    ).paddingSymmetric(
                        horizontal: margin_15, vertical: margin_10)),
              ),
            ],
          ),
        ),
      );

  _micButton() => ButtonWidget(
        onTap: () {
          controller.isRinging.value = false;
        },
        child: AssetImageWidget(
          iconsMic,
          imageHeight: margin_35,
          imageWidth: margin_35,
          imageFitType: BoxFit.fill,
        ),
      );

  _videoCallButton() => AssetImageWidget(
        icVideo,
        imageHeight: margin_35,
        imageWidth: margin_35,
        imageFitType: BoxFit.fill,
      );

  _cameraButton() => ButtonWidget(
        onTap: () {
          controller.balanceLowDialogShow();
        },
        child: AssetImageWidget(
          iconsFlipCamera,
          imageHeight: margin_35,
          imageWidth: margin_35,
          imageFitType: BoxFit.fill,
        ),
      );

  _cancelButton() => ButtonWidget(
        onTap: () {
          controller.isRinging.value = true;
          Get.back();
        },
        child: AssetImageWidget(
          iconsCrossVideo,
          imageHeight: margin_35,
          imageWidth: margin_35,
          imageFitType: BoxFit.fill,
        ),
      );
}
