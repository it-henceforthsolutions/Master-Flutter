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
import 'package:engagely/app/modules/live/controller/stream_music/stream_music_controller.dart';
import 'package:engagely/app/modules/live/widget/comments_item_view.dart';
import 'package:engagely/app/modules/live/widget/inviation_dialog_widget.dart';
import 'package:engagely/app/modules/live/widget/strem_user_view.dart';

class StreamMusicView extends GetView<StreamMusicController> {
  const StreamMusicView({super.key});

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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _headerWidget(),
          _bottomView(),
        ],
      ),
    );
  }

  Widget _headerWidget() => Expanded(
        child: Stack(
          fit: StackFit.loose,
          children: [
            ColorFiltered(
                colorFilter: ColorFilter.mode(
                    Colors.black.withOpacity(.4), BlendMode.darken),
                child: AssetImageWidget(iconsMusicStream,
                    imageWidth: Get.width,
                    imageHeight: Get.height,
                    imageFitType: BoxFit.cover)),
            Container(
              height: height_100,
              padding: EdgeInsets.symmetric(horizontal: margin_20),
              margin: EdgeInsets.only(top: margin_30),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  _userImage(),
                  SizedBox(
                    width: margin_10,
                  ),
                  _userName(),
                  const Spacer(),
                  _viewCounts(),
                  _crossIcon(),
                ],
              ),
            ),
          ],
        ),
      );

  Widget _userImage() => Container(
        height: height_45,
        width: margin_40,
        child: Stack(children: [
          Container(
            decoration: BoxDecoration(
                border: Border.all(color: Colors.white, width: margin_2),
                borderRadius: BorderRadius.all(Radius.circular(margin_30))),
            child: AssetImageWidget(iconsProfile,
                imageWidth: height_30,
                imageHeight: height_30,
                radiusAll: margin_30),
          ),
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
  Widget _userName() => TextView(
        text: "Sophie Owens",
        textStyle: textStyleBodyLarge().copyWith(
            color: Colors.white,
            fontSize: font_18,
            fontWeight: FontWeight.w600),
      ).marginOnly(bottom: margin_12);

  Widget _viewCounts() => Align(
        alignment: Alignment.center,
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

  Widget _bottomView() => Expanded(
        child: Container(
          color: Colors.black,
          child: Column(
            children: [
              _userListView(),
              _messageListView(),
              SizedBox(
                height: height_10,
              ),
              _messageSection(),
            ],
          ),
        ),
      );

  Widget _userListView() => SizedBox(
        height: height_80,
        child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: controller.userList.length,
            itemBuilder: (context, index) => ButtonWidget(
                  onTap: () {
                    Get.dialog(DialogWidget(image: icProfileUser,
                      title: strLiveInviation,
                      descrption: strBoradCastInviteDesc,
                      onAccepted: () {
                        Get.back();
                      },
                      onDeclined: () {
                        Get.back();
                      },
                    ));
                  },
                  child: StreamUserView(item: controller.userList[index])
                      .marginOnly(right: margin_20),
                )),
      ).marginSymmetric(horizontal: margin_15, vertical: margin_15);
  Widget _messageListView() => Expanded(
        child: ListView.builder(
                reverse: true,
                itemCount: 3,
                itemBuilder: (context, index) =>
                    const CommentItemView().marginOnly(top: margin_8))
            .marginSymmetric(horizontal: margin_15),
      );
  Widget _messageSection() => Row(
        children: [
          _messageView(),
          SizedBox(
            width: margin_5,
          ),
          if (Get.arguments != null) ...[
            _inviteUserButton()
          ] else ...[
            _gitfButton(),
            SizedBox(
              width: margin_5,
            ),
            _wishlistButton(),
          ]
        ],
      ).marginOnly(bottom: margin_25, left: margin_15, right: margin_15);

  Widget _messageView() => Expanded(
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
              borderSide: BorderSide(color: Colors.white.withOpacity(.5))),
          formatter: [
            FilteringTextInputFormatter.allow(RegExp('[a-zA-Z]')),
          ],
        ),
      );

  Widget _inviteUserButton() => ButtonWidget(
        onTap: () {
          controller.openInviteView();
        },
        child: AssetImageWidget(iconsAddUser,
            imageWidth: height_35,
            imageHeight: height_35,
            radiusAll: height_35),
      );

  Widget _gitfButton() => ButtonWidget(
        onTap: () {
          controller.openGiftView();
        },
        child: AssetImageWidget(iconsGift,
            imageWidth: height_35,
            imageHeight: height_35,
            radiusAll: height_35),
      );
  Widget _wishlistButton() => ButtonWidget(
        onTap: () {
          controller.openWishListView();
        },
        child: AssetImageWidget(iconsBucket,
            imageWidth: height_35,
            imageHeight: height_35,
            radiusAll: height_35),
      );
}
