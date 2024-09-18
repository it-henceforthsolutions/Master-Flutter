import 'package:engagely/app/core/widget/ripple.dart';
import 'package:engagely/app/modules/other_user_profile/widgets/single_post_widget.dart';

import '../../../export.dart';

import '../../live/widget/gifts_item_view.dart';
import '../controllers/other_profile_controller.dart';

class OtherProfileScreen extends GetView<OtherProfileController> {
  const OtherProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light.copyWith(
            statusBarColor: Colors.transparent,
            // ios
            statusBarIconBrightness: Brightness.light),
        child: Scaffold(
          backgroundColor: Colors.white,
          body:  _bodyWidget(),
        ));
  }

  Widget _bodyWidget() {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _userImageView().paddingOnly(bottom: height_40),
          _bodyListWidgets()
        ],
      ),
    );
  }

  Widget _bodyListWidgets() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _titleAndIconWidget()
            .paddingSymmetric(vertical: margin_12)
            .paddingSymmetric(horizontal: margin_15),
        _ageLocationWidget()
            .paddingOnly(bottom: margin_12)
            .paddingSymmetric(horizontal: margin_15),
        _fansFollowing()
            .paddingOnly(bottom: margin_12)
            .paddingSymmetric(horizontal: margin_15),

        _followActions()
            .paddingOnly(bottom: margin_12)
            .paddingSymmetric(horizontal: margin_15),
        _descriptionWidget()
            .paddingOnly(bottom: margin_12)
            .paddingSymmetric(horizontal: margin_15),
        _wishListWidget()
            .paddingOnly(bottom: margin_12)
            .paddingSymmetric(horizontal: margin_15),
        _tabsWidget().paddingOnly(bottom: margin_12),
        _tabView(),


      ],
    );
  }

  Widget _userImageView() {
    return Stack(
      alignment: Alignment.bottomLeft,
      clipBehavior: Clip.none,
      children: [
        IntrinsicHeight(
          child: Stack(
            fit: StackFit.loose,
            clipBehavior: Clip.none,
            alignment: Alignment.topCenter,
            children: [
              ShaderMask(
                shaderCallback: (rect) {
                  return const LinearGradient(
                    begin: Alignment.center,
                    end: Alignment.bottomCenter,
                    colors: [Colors.black, Colors.transparent],
                  ).createShader(Rect.fromLTRB(0, 0, rect.width, rect.height));
                },
                blendMode: BlendMode.dstIn,
                child: ButtonWidget(
                  onTap: () {
                    if (Get.arguments[dataKey] == 0) {
                      Get.toNamed(AppRoutes.liveView,
                          arguments: {isMyLive: false});
                    } else if (Get.arguments[dataKey] == 1) {
                      Get.toNamed(
                        AppRoutes.streamGameView,
                      );
                    } else if (Get.arguments[dataKey] == 2) {
                      Get.toNamed(
                        AppRoutes.playerStreamView,
                      );
                    }else if(Get.arguments[dataKey] == 3){
                      Get.toNamed(
                        AppRoutes.streamMusicView,
                      );
                    }
                  },
                  child: AssetImageWidget(
                    iconsIcUser,
                    imageWidth: Get.width,
                    imageHeight: height_230,
                    imageFitType: BoxFit.cover,
                  ),
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SafeArea(
                    child: _appBarActions(),
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [_onlineWidget(), _perMinWidget()],
                  ).paddingOnly(bottom: margin_30,left: margin_10,right: margin_10),
                ],
              ).paddingSymmetric(horizontal: margin_15)
            ],
          ),
        ),
        Positioned(bottom: -height_40, left: height_15, child: _imagesList()),
      ],
    );
  }

  SizedBox _imagesList() {
    return SizedBox(
      height: height_40,
      width: Get.width,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: 4,
        shrinkWrap: true,
        itemBuilder: (context, index) {
          return Container(
            height: height_40,
            width: height_40,
            decoration: index == 0
                ? BoxDecoration(
                    border: Border.all(
                        color: AppColors.appColor, width: margin_1point3),
                    borderRadius: BorderRadius.circular(radius_6))
                : null,
            child: AssetImageWidget(
              iconsIcUser,
              imageFitType: BoxFit.cover,
              radiusAll: radius_4,
            ).paddingAll(index == 0 ? margin_2 : 0),
          );
        },
        separatorBuilder: (context, index) {
          return SizedBox(width: margin_5);
        },
      ),
    );
  }

  Row _appBarActions() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        GestureDetector(
            onTap: () {
              Get.back();
            },
            child: AssetImageWidget(
              icBackIcon,
              imageWidth: height_42,
              imageHeight: height_42,
            )),
        GestureDetector(
            onTapDown: (TapDownDetails details) {
              controller.showMenuWidget(details.globalPosition);
            },
            child: AssetImageWidget(
              iconsIcMoreVert,
              imageWidth: height_42,
              imageHeight: height_42,
              imageFitType: BoxFit.cover,
            )),
      ],
    );
  }

  Widget _onlineWidget() {
    return Obx(
      () => ButtonWidget(
        onTap: () {
          if (controller.typeStatus.value == typeOnline) {
            controller.typeStatus.value = typeOffline;
            controller.offlineDialogShow();
          } else if (controller.typeStatus.value == typeOffline) {
            controller.typeStatus.value = typeOccupied;
            controller.occupiedDialogShow();
          }
          debugPrint("clicked");
        },
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(radius_20),
              color: controller.typeStatus.value == typeOnline
                  ? AppColors.greenColor
                  : controller.typeStatus.value == typeOffline
                      ? AppColors.redColor
                      : AppColors.appColor),
          child: TextView(
            text: controller.typeStatus.value == typeOnline
                ? 'Online'
                : controller.typeStatus.value == typeOffline
                    ? "Offline"
                    : "Occupied",
            textStyle: textStyleBodyMedium().copyWith(
                color: AppColors.whiteColor, fontWeight: FontWeight.w600),
          ).paddingSymmetric(horizontal: margin_10, vertical: margin_5),
        ),
      ),
    );
  }

  Widget _perMinWidget() {
    return ButtonWidget(
      onTap: () {},
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(radius_20),
            color: Colors.black.withOpacity(0.6)),
        child: Row(
          children: [
            AssetImageWidget(
              iconsDianmod,
              imageWidth: height_14,
              imageHeight: height_14,
            ),
            TextView(
              text: '20/min',
              textStyle: textStyleBodyMedium().copyWith(
                  color: AppColors.whiteColor, fontWeight: FontWeight.w600),
            ).paddingOnly(left: margin_5),
          ],
        ).paddingSymmetric(horizontal: margin_8, vertical: margin_5),
      ),
    );
  }

  Widget _titleAndIconWidget() {
    return TextView(
      text: 'Jessie Pinkmen 👑',
      maxLines: 2,
      textStyle: textStyleHeadlineLarge().copyWith(fontWeight: FontWeight.w600),
    );
  }

  Widget _ageLocationWidget() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _coloredRowWidget(iconsIcFemale, '22', color: AppColors.pinkColor)
              .paddingOnly(right: margin_8),
          _coloredRowWidget(iconsIcLocation, 'New York, 7.5km',
              color: AppColors.blueColor),
        ],
      ),
    );
  }

  Widget _coloredRowWidget(String imagePath, String text, {Color? color}) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(radius_20),
          color: color?.withOpacity(0.1)),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          AssetImageWidget(
            imagePath,
            imageWidth: height_14,
            imageHeight: height_14,
          ),
          TextView(
            text: text,
            maxLines: 1,
            textStyle: textStyleTitleSmall()
                .copyWith(color: color, fontWeight: FontWeight.w600),
          ).paddingOnly(left: margin_5),
        ],
      ).paddingSymmetric(horizontal: margin_8, vertical: margin_5),
    );
  }

  Widget _fansFollowing() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _detailRowWidget('20', strFriends),
          _detailRowWidget('10K', strFans),
          _detailRowWidget('20K', strFollowing),
        ],
      ),
    );
  }

  Widget _detailRowWidget(String title, String text) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        TextView(
          text: title,
          maxLines: 1,
          textStyle:
              textStyleTitleLarge().copyWith(fontWeight: FontWeight.w600),
        ),
        TextView(
          text: text,
          maxLines: 1,
          textStyle: textStyleBodyMedium().copyWith(
              fontWeight: FontWeight.w500, color: AppColors.greyColor),
        ).paddingOnly(left: margin_3),
      ],
    ).paddingSymmetric(horizontal: margin_8, vertical: margin_5);
  }

  Row _followActions() {
    return Row(
      children: [
        Expanded(child: _followButtonWidget()),
        _singleImageWidget(iconsIcProfileMsg, onTap: () {
          Get.toNamed(AppRoutes.chatRoute);
        }).paddingSymmetric(horizontal: margin_5),
        _singleImageWidget(iconsIcProfileVid, onTap: () {
          controller.callDialogShow();
        }).paddingOnly(right: margin_5),
        _singleImageWidget(iconsIcProfileGift, onTap: () {
          controller.openGiftView();
        }),
      ],
    );
  }

  Widget _followButtonWidget() {
    return Obx(
      () => ButtonWidget(
        onTap: () {
          controller.followUnfollowDialog();
        },
        child: Container(
            width: Get.width,
            decoration: BoxDecoration(
                color: controller.isFollow == true
                    ? Colors.grey.shade400
                    : AppColors.appColor,
                borderRadius: BorderRadius.all(Radius.circular(margin_5))),
            child: Center(
              child: TextView(
                text: controller.isFollow == true ? strFollowed : strFollow,
                textStyle: textStyleBodyLarge().copyWith(
                    color: Colors.white,
                    fontSize: font_16,
                    fontWeight: FontWeight.w700),
              ).paddingSymmetric(horizontal: margin_18, vertical: margin_9),
            )),
      ),
    );
  }

  Widget _singleImageWidget(String imagePath, {onTap}) {
    return GestureDetector(
        onTap: onTap,
        child: AssetImageWidget(
          imagePath,
          imageWidth: height_35,
          imageHeight: height_35,
          imageFitType: BoxFit.cover,
        ));
  }

  Widget _descriptionWidget() {
    return ReadMoreTextWidget(
      'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum ut quam et dolor laoreet tristique ut ut mi.',
      trimLines: 5,
      style: textStyleTitleSmall()
          .copyWith(fontWeight: FontWeight.w500, color: Colors.grey),
    );
  }

  Widget _wishListWidget() {
    return GestureDetector(
      onTap: () {
        controller.openWishListView();
      },
      child: Container(
        decoration: BoxDecoration(
            gradient: const LinearGradient(colors: [
              AppColors.wishListLightColor,
              AppColors.wishListDarkColor,
            ]),
            borderRadius: BorderRadius.circular(radius_50)),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            AssetImageWidget(
              iconsIcWishlist2,
              imageHeight: height_60,
              imageWidth: height_60,
            ).paddingOnly(left: margin_25),
            Expanded(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                      child: TextView(
                    text: strWishlists,
                    textAlign: TextAlign.start,
                    textStyle: textStyleTitleLarge().copyWith(
                        color: AppColors.whiteColor,
                        fontWeight: FontWeight.w600),
                  )),
                  Icon(
                    Icons.arrow_forward,
                    color: AppColors.whiteColor,
                    size: height_20,
                  ).paddingOnly(left: margin_8)
                ],
              )
                  .paddingSymmetric(horizontal: margin_10)
                  .paddingOnly(right: margin_10),
            ),
          ],
        ),
      ),
    );
  }

  Widget _tabsWidget() {
    return Container(
      width: Get.width,
      decoration: const BoxDecoration(color: AppColors.greyColorExtraLight),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [
            _singleCategoryWidget('Posts (2)', 0),
            _singleCategoryWidget('Moments (1)', 1),
            _singleCategoryWidget('Gifts', 2),
          ],
        ).paddingOnly(top: margin_8).paddingSymmetric(horizontal: margin_15),
      ),
    );
  }

  Widget _singleCategoryWidget(String text, int index) => GestureDetector(
      onTap: () {
        controller.selectedLinkCategoryIndex.value = index;
      },
      child: Container(
        decoration: BoxDecoration(
          border: Border(
              bottom: BorderSide(
                  width: margin_1point5,
                  color: controller.selectedLinkCategoryIndex.value == index
                      ? Colors.black
                      : Colors.transparent)),
        ),
        child: TextView(
                text: text,
                textAlign: TextAlign.center,
                textStyle: textStyleTitleSmall().copyWith(
                    color: controller.selectedLinkCategoryIndex.value == index
                        ? null
                        : AppColors.greyColor))
            .paddingOnly(bottom: margin_10),
      )).paddingOnly(right: margin_30);

  Widget _tabView() {
    switch (controller.selectedLinkCategoryIndex.value) {
      case 0:
        return _postsList();
      case 1:
        return _momentsList();
      default:
        return _giftsView();
    }
  }

  Widget _postsList() {
    return ListView.builder(
        physics: const NeverScrollableScrollPhysics(),
        itemCount: controller.postsList.length,
        shrinkWrap: true,
        padding: EdgeInsets.zero,
        itemBuilder: (BuildContext ctx, index) {
          return SinglePostWidget(
                  postModel: controller.postsList[index], index: index)
              .paddingOnly(bottom: margin_25);
        });
  }

  Widget _momentsList() {
    return ListView.builder(
        physics: const NeverScrollableScrollPhysics(),
        itemCount: controller.momentsList.length,
        shrinkWrap: true,
        padding: EdgeInsets.zero,
        itemBuilder: (BuildContext ctx, index) {
          return SinglePostWidget(
            postModel: controller.momentsList[index],
            index: index,
          ).paddingOnly(bottom: margin_25);
        });
  }

  _giftsView() => GridView.builder(
      itemCount: controller.giftsList.length,
      shrinkWrap: true,
      padding: EdgeInsets.zero,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisSpacing: margin_15,
          mainAxisSpacing: margin_15,
          crossAxisCount: 4,
          childAspectRatio: .85),
      itemBuilder: (context, index) {
        var item = controller.giftsList[index];
        return GiftItemView(
          icon: item.icon,
          price: item.name,
          showIcon: false,
          isCoin: true,
        );
      }).marginSymmetric(horizontal: margin_15);
}
