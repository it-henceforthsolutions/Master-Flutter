/*
 * @copyright : Henceforth Pvt. Ltd. <info@henceforthsolutions.com>
 * @author     : Gaurav Negi
 * All Rights Reserved.
 * Proprietary and confidential :  All information contained herein is, and remains
 * the property of Henceforth Pvt. Ltd. and its partners.
 * Unauthorized copying of this file, via any medium is strictly prohibited.
 *
 */

import 'package:engagely/app/core/widget/app_bar_widget.dart';
import 'package:engagely/app/core/widget/ripple.dart';
import 'package:engagely/app/modules/chats/controller/chat_history_controller.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

import '../../../export.dart';

class ChatHistoryScreen extends BaseView<ChatHistoryController> {
  ChatHistoryScreen({super.key});

  @override
  PreferredSizeWidget? appBar(BuildContext context) {
    return AppBarWidget(
      isbackIcon: false,
      appBarTitleText: strChat,
      isCustom: false,
      bgColor: Colors.white,
    );
  }

  @override
  Widget body(BuildContext context) {
    return _bodyWidget();
  }

  Widget _bodyWidget() {
    return GestureDetector(
      onTap: () async {},
      child: Column(
        children: [
          _searchField()
              .paddingSymmetric(horizontal: margin_15, vertical: margin_20),
          Expanded(child: _listWidget())
        ],
      ),
    );
  }

  Widget _searchField() {
    return TextFieldWidget(
      textController: controller.searchController,
      focusNode: controller.focusNode,
      hint: strSearchChat,
      prefixIcon: AssetImageWidget(
        iconsIcSearchL,
        imageWidth: height_15,
        imageHeight: height_15,
        color: Colors.black,
      ).paddingOnly(left: margin_15, right: margin_8),
      borderRadius: radius_10,
      inputType: TextInputType.text,
    );
  }

  Widget _listWidget() {
    return ListView.separated(
      padding: EdgeInsets.zero,
      itemCount: controller.chatHistoryList.length,
      shrinkWrap: true,
      itemBuilder: (BuildContext ctx, index) {
        return _singleChatModel(index);
      },
      separatorBuilder: (context, index) {
        return _dividerWidget();
      },
    );
  }

  Widget _dividerWidget() {
    return Divider(height: height_2, color: Colors.grey.shade300)
        .paddingSymmetric(vertical: margin_6)
        .paddingOnly(left: margin_60);
  }

  Widget _singleChatModel(int index) {
    return Dismissible(
      key: UniqueKey(),
      direction: DismissDirection.endToStart,
      confirmDismiss: (direction) async => null,
      background: emptySizeBox(),
      onDismissed: (direction) {
        // Remove the item from the data source.

        // Then show a snackbar.
      },
      secondaryBackground: Container(
        width: margin_100,
        color: Colors.red,
        child: Padding(
          padding: const EdgeInsets.only(right: 16),
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                AssetImageWidget(
                  iconsChatDelete,
                  imageHeight: margin_20,
                ).marginOnly(right: margin_8),
                TextView(
                  text: strDelete,
                  textAlign: TextAlign.start,
                  textStyle: textStyleBodyMedium().copyWith(
                      fontWeight: FontWeight.w500, color: Colors.white),
                ).marginOnly(top: margin_3),
              ]),
        ),
      ),
      child: ButtonWidget(
        onTap: () {
          Get.toNamed(AppRoutes.chatRoute);
        },
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AssetImageWidget(
              controller.chatHistoryList[index].user?.image ?? '',
              imageHeight: height_38,
              imageWidth: height_38,
              radiusAll: radius_30,
              imageFitType: BoxFit.cover,
            ),
            Expanded(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _nameAndMessageWidget(index),
                  _timeUnreadCount(index).paddingOnly(right: margin_10),
                ],
              ).paddingOnly(left: margin_5, right: margin_5),
            ),
          ],
        ).paddingOnly(left: margin_15).paddingSymmetric(vertical: margin_15),
      ),
    );
  }

  Column _timeUnreadCount(int index) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        TextView(
          text: controller.chatHistoryList[index].time ?? '',
          textAlign: TextAlign.start,
          textStyle: textStyleBodyMedium().copyWith(
              fontWeight: FontWeight.w500,
              color: controller.chatHistoryList[index].unReadMsgCount > 0
                  ? AppColors.appColor
                  : AppColors.greyColor),
          maxLines: 1,
        ),
        controller.chatHistoryList[index].unReadMsgCount > 0
            ? Container(
                decoration: const BoxDecoration(
                    shape: BoxShape.circle, color: AppColors.appColor),
                child: TextView(
                  text: controller.chatHistoryList[index].unReadMsgCount
                      .toString(),
                  textAlign: TextAlign.center,
                  textStyle: textStyleBodyMedium().copyWith(
                      fontWeight: FontWeight.w500, color: AppColors.whiteColor),
                  maxLines: 1,
                ).paddingAll(margin_6),
              )
            : const SizedBox()
      ],
    );
  }

  Expanded _nameAndMessageWidget(int index) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        mainAxisSize: MainAxisSize.min,
        children: [
          TextView(
            text: controller.chatHistoryList[index].user?.name ?? '',
            textAlign: TextAlign.start,
            textStyle:
                textStyleTitleSmall().copyWith(fontWeight: FontWeight.w600),
            maxLines: 1,
          ).paddingOnly(bottom: margin_4),
          Row(
            children: [
              controller.chatHistoryList[index].type == typeSent
                  ? AssetImageWidget(
                      iconsIcSentGreen,
                      imageHeight: height_10,
                      imageWidth: height_12,
                    ).paddingOnly(right: margin_5)
                  : const SizedBox(),
              Expanded(
                child: TextView(
                  text: controller.chatHistoryList[index].text ?? '',
                  textAlign: TextAlign.start,
                  textStyle: textStyleBodyMedium().copyWith(
                      fontWeight: FontWeight.w400, color: AppColors.greyColor),
                  maxLines: 2,
                ),
              ),
            ],
          ),
        ],
      ).paddingSymmetric(horizontal: margin_6),
    );
  }
}
