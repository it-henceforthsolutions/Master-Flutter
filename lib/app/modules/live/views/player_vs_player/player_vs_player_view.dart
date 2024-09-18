/*
 * @copyright : Henceforth Pvt. Ltd. <info@henceforthsolutions.com>
 * @author     : Gaurav Negi
 * All Rights Reserved.
 * Proprietary and confidential :  All information contained herein is, and remains
 * the property of Henceforth Pvt. Ltd. and its partners.
 * Unauthorized copying of this file, via any medium is strictly prohibited.
 *
 */

/*
 * @copyright : Henceforth Pvt. Ltd. <info@henceforthsolutions.com>
 * @author     : Gaurav Negi
 * All Rights Reserved.
 * Proprietary and confidential :  All information contained herein is, and remains
 * the property of Henceforth Pvt. Ltd. and its partners.
 * Unauthorized copying of this file, via any medium is strictly prohibited.
 *
 */

import 'dart:ui';

import 'package:engagely/app/core/widget/ripple.dart';
import 'package:engagely/app/export.dart';
import 'package:engagely/app/modules/live/controller/player_vs_player_module/player_vs_player_controller.dart';
import 'package:engagely/app/modules/live/widget/comments_item_view.dart';
import 'package:engagely/app/modules/live/widget/image_viewer.dart';

class PlayerStreamView extends GetView<PlayerVSControllerController> {
  const PlayerStreamView({super.key});

  PreferredSizeWidget? appBar(BuildContext context) {
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light.copyWith(
            statusBarColor: Colors.transparent,
            // ios
            statusBarIconBrightness: GetPlatform.isAndroid?Brightness.light:Brightness.dark),
        child: Obx(
          () => ImageFiltered(
              imageFilter: ImageFilter.blur(
                  sigmaY: controller.intialValue.value,
                  sigmaX: controller.intialValue
                      .value), //SigmaX and Y are just for X and Y directions
              child: Stack(
                children: [
                  viewDivider(),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _headerWidget(),
                      Expanded(child: _messageListView()),
                      SizedBox(height: margin_10,),
                      Get.arguments != null ? emptySizeBox() : _bottomView(),
                    ],
                  ).marginSymmetric(horizontal: margin_15, vertical: margin_20),
                ],
              )),
        ));
  }

  viewDivider() =>   ColorFiltered(
      colorFilter: ColorFilter.mode(
          Colors.black.withOpacity(.3), BlendMode.darken),
      child: Column(
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: AssetImageWidget(iconsLive,
                      imageWidth: Get.width,
                      imageHeight: Get.height,
                      imageFitType: BoxFit.cover),
                ),
                Expanded(
                  child: AssetImageWidget(icChild,
                      imageWidth: Get.width,
                      imageHeight: Get.height,
                      imageFitType: BoxFit.cover),
                ),
              ],
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: AssetImageWidget(icChild,
                      imageWidth: Get.width,
                      imageHeight: Get.height,
                      imageFitType: BoxFit.cover),
                ),
                Expanded(
                  child: AssetImageWidget(iconsLive,
                      imageWidth: Get.width,
                      imageHeight: Get.height,
                      imageFitType: BoxFit.cover),
                ),
              ],
            ),
          )
        ],
      ));

  _headerWidget() => Column(
        children: [
          _groupName(),
          Row(
            children: [
              _userImage(),
              SizedBox(
                width: margin_10,
              ),
              _userName(),
              _viewCounts(),
              _crossIcon(),
            ],
          ),
          Get.arguments != null ? _liveActions() : emptySizeBox()
        ],
      ).marginOnly(top: margin_30);

  Widget _groupName() => TextView(
        text: "VK",
        textStyle: textStyleBodyLarge().copyWith(
            color: Colors.white,
            fontSize: font_18,
            fontWeight: FontWeight.w600),
      ).marginOnly(bottom: margin_12);

  Widget _userImage() => Container(
        height: height_45,
        width: margin_40,
        child: Stack(children: [
          Align(
            alignment: Alignment.topRight,
            child: Container(
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.white, width: margin_2),
                  borderRadius: BorderRadius.all(Radius.circular(margin_30))),
              child: AssetImageWidget(iconsProfile,
                  imageWidth: height_18,
                  imageHeight: height_18,
                  radiusAll: height_18),
            ),
          ),
          Container(
            decoration: BoxDecoration(
                border: Border.all(color: Colors.white, width: margin_2),
                borderRadius: BorderRadius.all(Radius.circular(margin_30))),
            child: AssetImageWidget(iconsProfile,
                imageWidth: height_18,
                imageHeight: height_18,
                radiusAll: height_18),
          ),
          Positioned(
              top: margin_16,
              child: Container(
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.white, width: margin_2),
                    borderRadius: BorderRadius.all(Radius.circular(margin_30))),
                child: AssetImageWidget(iconsProfile,
                    imageWidth: height_18,
                    imageHeight: height_18,
                    radiusAll: height_18),
              )),
          Positioned(
              left: 18,
              top: 16,
              child: Container(
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.white, width: margin_2),
                    borderRadius: BorderRadius.all(Radius.circular(margin_30))),
                child: AssetImageWidget(iconsProfile,
                    imageWidth: height_18,
                    imageHeight: height_18,
                    radiusAll: height_18),
              )),
          _liveButton(),
        ]),
      );

  _liveButton() => Align(
        alignment: Alignment.bottomCenter,
        child: Container(
            padding:
                EdgeInsets.symmetric(horizontal: margin_5, vertical: margin_2),
            decoration: BoxDecoration(
                color: AppColors.bloodRedColor,
                border: Border.all(color: Colors.white, width: margin_2),
                borderRadius: BorderRadius.all(Radius.circular(margin_8))),
            child: TextView(
              text: strLive.toUpperCase(),
              textStyle: textStyleBodyMedium().copyWith(
                  color: Colors.white,
                  fontSize: font_10,
                  fontWeight: FontWeight.w600),
            )),
      );
  Widget _userName() => Expanded(
        child: TextView(
          text: "Sophie, Sofia, Brenda\n& Olivia",
          maxLines: 2,
          textStyle: textStyleBodyLarge().copyWith(
              color: Colors.white,
              fontSize: font_16,
              fontWeight: FontWeight.w600),
        ).marginOnly(bottom: margin_12),
      );

  Widget _viewCounts() => Align(
        alignment: Alignment.topRight,
        child: Container(
          margin: EdgeInsets.only(
              right: margin_8, top: margin_3, bottom: margin_12),
          padding:
              EdgeInsets.symmetric(horizontal: margin_5, vertical: margin_2),
          decoration: BoxDecoration(
              color: Colors.black.withOpacity(.5),
              borderRadius: BorderRadius.circular(margin_5)),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(Icons.remove_red_eye, size: margin_15, color: Colors.white),
              SizedBox(
                width: margin_3,
              ),
              TextView(
                  text: "0",
                  textStyle: textStyleBodyMedium().copyWith(
                      color: Colors.white, fontWeight: FontWeight.w600)),
            ],
          ),
        ),
      );

  Widget _crossIcon() => ButtonWidget(
        onTap: () {
          Get.back();
        },
        child: AssetImageWidget(iconsCross,
                imageWidth: height_30,
                imageHeight: height_30,
                radiusAll: margin_30)
            .marginOnly(bottom: margin_12),
      );

  _liveActions() => Align(
        alignment: Alignment.topRight,
        child: Container(
            padding:
                EdgeInsets.symmetric(horizontal: margin_8, vertical: margin_15),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(margin_25)),
            child: Column(
              children: [_suffleIcon(), _liveIcon(), _liveMic()],
            )),
      );

  Widget _suffleIcon() => ButtonWidget(
        onTap: () {
          Get.back();
        },
        child: AssetImageWidget(iconsFlipLive,
                imageWidth: height_15,
                imageHeight: height_15,
                radiusAll: height_20)
            .marginOnly(bottom: margin_8),
      );

  Widget _liveIcon() => ButtonWidget(
        onTap: () {
          Get.back();
        },
        child: AssetImageWidget(iconsLiveVideo,
                imageWidth: height_15,
                imageHeight: height_15,
                radiusAll: height_20)
            .marginOnly(bottom: margin_8),
      );

  Widget _liveMic() => ButtonWidget(
      onTap: () {
        Get.back();
      },
      child: AssetImageWidget(iconsLiveAudio,
          imageWidth: height_15, imageHeight: height_15, radiusAll: height_20));

  _messageListView() => ListView.builder(
      reverse: true,
      itemCount: 3,
      itemBuilder: (context, index) => ButtonWidget(
          onTap: () {
            controller.intialValue.value = 5.0;
            if (index == 0) {
              Get.dialog(ImageViewer(
                  isShowAppBar: true,
                  onTap: () {
                    controller.intialValue.value = 0.0;
                    Get.back();
                  }));
            } else {
              Get.dialog(ImageViewer(
                onTap: () {
                  controller.intialValue.value = 0.0;

                  Get.back();
                },
                isShowAppBar: false,
              ));
            }
          },
          child: CommentItemView().marginOnly(top: margin_5)));

  _bottomView() => Row(
        children: [
          _messageView(),
          SizedBox(
            width: margin_5,
          ),
          _voteBadgeButton(),
        ],
      );

  _messageView() => Expanded(
        child: TextFieldWidget(
          hint: strAddComment,
          readOnly: true,
          inputType: TextInputType.name,
          fillColor: Colors.black,
          hintStyle: textStyleBodyLarge()
              .copyWith(color: Colors.white, fontSize: font_14),
          suffixIcon: AssetImageWidget(iconsSend,
                  imageWidth: height_22,
                  imageHeight: height_22,
                  radiusAll: height_22)
              .paddingAll(margin_5),
          prefixIcon: AssetImageWidget(iconsEmoji,
                  imageWidth: height_22,
                  imageHeight: height_22,
                  radiusAll: height_22)
              .paddingOnly(left: margin_10, right: margin_10),
          inputAction: TextInputAction.next,
          decoration: OutlineInputBorder(
              borderRadius: BorderRadius.circular(radius_30),
              borderSide: const BorderSide(color: Colors.black)),
          formatter: [
            FilteringTextInputFormatter.allow(RegExp('[a-zA-Z]')),
          ],
        ),
      );

  _voteBadgeButton() => ButtonWidget(
        onTap: () {
          controller.openVoteUsersSheet();
        },
        child: AssetImageWidget(icVoteBadge,
            imageWidth: height_35,
            imageHeight: height_35,
            radiusAll: height_35),
      );
}
