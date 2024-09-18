import 'package:engagely/app/core/base/base_controller.dart';
import 'package:engagely/app/modules/live/views/wish_list_view.dart';
import 'package:engagely/app/modules/live/widget/inviation_dialog_widget.dart';
import 'package:engagely/app/modules/other_user_profile/models/post_model.dart';

import '../../../export.dart';
import '../../live/controller/gitft_controller.dart';
import '../../live/views/gift_views.dart';

class ProfileController extends BaseController {
  RxInt selectedLinkCategoryIndex = 0.obs;
  RxInt typeStatus = typeOnline.obs;
  RxBool isFollow = false.obs;

  RxList<PostModel> postsList = <PostModel>[
    PostModel(
        imagePath: iconsIcUser,
        title: 'Jessie Pinkmen 👑',
        postData:
            'Aliquam felis urna, feugiat ac tincidunt id, ultrices eget orci.',
        daysAgo: '15 days ago',
        file: iconsIcUser2),
    PostModel(
        imagePath: iconsIcUser,
        title: 'Jessie Pinkmen 👑',
        postData:
            'Aliquam felis urna, feugiat ac tincidunt id, ultrices eget orci.',
        daysAgo: '15 days ago',
        file: iconsIcUser2),
    PostModel(
        imagePath: iconsIcUser,
        title: 'Jessie Pinkmen 👑',
        postData:
            'Aliquam felis urna, feugiat ac tincidunt id, ultrices eget orci.',
        daysAgo: '15 days ago',
        file: iconsIcUser2),
    PostModel(
        imagePath: iconsIcUser,
        title: 'Jessie Pinkmen 👑',
        type: typeVideo,
        postData:
            'Aliquam felis urna, feugiat ac tincidunt id, ultrices eget orci.',
        daysAgo: '15 days ago',
        file: iconsIcUser2),
    PostModel(
        imagePath: iconsIcUser,
        title: 'Jessie Pinkmen 👑',
        postData:
            'Aliquam felis urna, feugiat ac tincidunt id, ultrices eget orci.',
        daysAgo: '15 days ago',
        file: iconsIcUser2),
    PostModel(
        imagePath: iconsIcUser,
        title: 'Jessie Pinkmen 👑',
        postData:
            'Aliquam felis urna, feugiat ac tincidunt id, ultrices eget orci.',
        daysAgo: '15 days ago',
        file: iconsIcUser2),
    PostModel(
        imagePath: iconsIcUser,
        title: 'Jessie Pinkmen 👑',
        type: typeVideo,
        postData:
            'Aliquam felis urna, feugiat ac tincidunt id, ultrices eget orci.',
        daysAgo: '15 days ago',
        file: iconsIcUser2),
    PostModel(
        imagePath: iconsIcUser,
        title: 'Jessie Pinkmen 👑',
        type: typeVideo,
        postData:
            'Aliquam felis urna, feugiat ac tincidunt id, ultrices eget orci.',
        daysAgo: '15 days ago',
        file: iconsIcUser2),
  ].obs;
  RxList<PostModel> momentsList = <PostModel>[
    PostModel(
        imagePath: iconsIcUser,
        title: 'Jessie Pinkmen 👑',
        type: typeVideo,
        postData:
            'Aliquam felis urna, feugiat ac tincidunt id, ultrices eget orci.',
        daysAgo: '15 days ago',
        file: iconsIcUser2),
    PostModel(
        imagePath: iconsIcUser,
        title: 'Jessie Pinkmen 👑',
        postData:
            'Aliquam felis urna, feugiat ac tincidunt id, ultrices eget orci.',
        daysAgo: '15 days ago',
        file: iconsIcUser2),
    PostModel(
        imagePath: iconsIcUser,
        title: 'Jessie Pinkmen 👑',
        postData:
            'Aliquam felis urna, feugiat ac tincidunt id, ultrices eget orci.',
        daysAgo: '15 days ago',
        file: iconsIcUser2),
    PostModel(
        imagePath: iconsIcUser,
        title: 'Jessie Pinkmen 👑',
        type: typeVideo,
        postData:
            'Aliquam felis urna, feugiat ac tincidunt id, ultrices eget orci.',
        daysAgo: '15 days ago',
        file: iconsIcUser2),
    PostModel(
        imagePath: iconsIcUser,
        title: 'Jessie Pinkmen 👑',
        postData:
            'Aliquam felis urna, feugiat ac tincidunt id, ultrices eget orci.',
        daysAgo: '15 days ago',
        file: iconsIcUser2),
  ].obs;

  List<Items> giftsList = <Items>[
    Items(name: "X20", icon: iconsEmoji_1),
    Items(name: "X20", icon: iconsEmoji_2),
    Items(name: "X20", icon: iconsEmoji_3),
    Items(name: "X20", icon: iconsEmoji_4),
    Items(name: "X20", icon: iconsEmoji_5),
    Items(name: "X20", icon: iconsEmoji_6),
    Items(name: "X20", icon: iconsEmoji_7),
    Items(name: "X20", icon: iconsEmoji_8),
  ];

  void showMenuWidget(Offset globalPosition) {
    double left = globalPosition.dx;
    double top = globalPosition.dy;
    showMenu(
      shape:
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(margin_8)),
      context: Get.overlayContext!,
      position: RelativeRect.fromLTRB(left, top + 10, margin_25, 0),
      items: [
        const PopupMenuItem<String>(
          height: 10,
          value: strEdit,
          child: TextView(
            text: strEdit,
          ),
        ),
        PopupMenuItem<String>(
            height: 15,
            value: strShare,
            child: Divider(
              color: Colors.grey.shade300,
            )),
        const PopupMenuItem<String>(
          height: 10,
          value: strDelete,
          child: TextView(
            text: strDelete,
          ),
        ),
      ],
      elevation: 8.0,
    );
  }

  void followUnfollowDialog() {
    Get.dialog(DialogWidget(
      onAccepted: () {
        isFollow.value = !isFollow.value;
        Get.back();
        refresh();
      },
      onDeclined: () {
        Get.back();
      },
      sucessText: isFollow.value == true ? strUnFollow : strFollow,
      failureText: isFollow.value == true ? "Keep Follow" : "Keep UnFollow",
      descrptionWidget: _descrption(),
    ));
  }

  Widget _descrption() => Text.rich(
        textAlign: TextAlign.center,
        TextSpan(
            text:
                "Are you sure want to ${isFollow.value == true ? "unfollow" : "follow"}",
            style: textStyleBodyLarge().copyWith(
              fontWeight: FontWeight.w500,
              height: 1.5,
              fontSize: font_14,
              color: Colors.black.withOpacity(.5),
            ),
            children: [
              TextSpan(
                  text: "Jessie Pinkmen👑",
                  style: textStyleTitleSmall().copyWith(
                    fontWeight: FontWeight.w600,
                    height: 1.5,
                    fontSize: font_14,
                    color: Colors.black.withOpacity(.7),
                  )),
            ]),
      ).paddingOnly(bottom: margin_5, top: margin_10);

  openGiftView() {
    Get.bottomSheet(
        backgroundColor: Colors.white,
        GiftView(),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(margin_30),
                topRight: Radius.circular(margin_30))));
  }

  openWishListView() {
    showModalBottomSheet(
        context: Get.overlayContext!,
        isScrollControlled: true,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(margin_30),
                topRight: Radius.circular(margin_30))),
        builder: (context) {
          return FractionallySizedBox(
            heightFactor: 0.7,
            child: WishListView(),
          );
        });
  }

  void offlineDialogShow() {
    Get.dialog(DialogWidget(
      isSucessButtonShow: false,
      isFailureButtonShow: false,
      image: iconsOffline,
      title: strCreatorOffline,
      descrption: strCreatorDescrption,
      padding: EdgeInsets.symmetric(vertical: margin_20),
    ));
  }

  void occupiedDialogShow() {
    Get.dialog( DialogWidget(
      isSucessButtonShow: false,
      isFailureButtonShow: false,
      image: iconsOccupied,
      title: strCreatorOccupied,
      descrption: strCreatorOccupiedDes,
      padding: EdgeInsets.symmetric(vertical: margin_10),
    ));
  }
  void callDialogShow() {
    Get.dialog( DialogWidget(
      title: strVideoCall,
      descrptionWidget: callDescrption(),sucessText: strContinueToVideoCall,
      failureText: strCancel,onAccepted: (){
        Get.back();
     Get.toNamed(AppRoutes.videoCallView);
    },
      onDeclined: (){
        Get.back();
      },
      padding: EdgeInsets.symmetric(vertical: margin_10),
    ));
  }

  Widget callDescrption() => Text.rich(
    textAlign: TextAlign.center,
    TextSpan(
        text:
        "This video call costs you ",
        style: textStyleBodyLarge().copyWith(
          fontWeight: FontWeight.w500,
          height: 1.5,
          fontSize: font_14,
          color: Colors.black.withOpacity(.5),
        ),
        children: [
          TextSpan(
              text: "10 coin/minute.",
              style: textStyleTitleSmall().copyWith(
                fontWeight: FontWeight.w600,
                height: 1.5,
                fontSize: font_14,
                color: Colors.black.withOpacity(.7),
              )),
        ]),
  ).paddingOnly(bottom: margin_5, top: margin_10);

}
