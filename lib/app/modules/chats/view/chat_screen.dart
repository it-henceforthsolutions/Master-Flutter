import '../../../export.dart';
import '../../live/views/gift_views.dart';
import '../controller/chat_controller.dart';
import '../model/data_models/chat_model.dart';
import '../widget/single_chat_message.dart';

class ChatScreen extends GetView<ChatScreenController> {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
          backgroundColor: AppColors.whiteColor,
          appBar: _appBarWidget(),
          body: _bodyWidget()
              .paddingSymmetric(horizontal: margin_15, vertical: margin_10)),
    );
  }

  PreferredSizeWidget _appBarWidget() {
    return AppBarWidget(
      isCustom: false,
      centerTitle: false,
      backIconColor: Colors.white,
      titleView: _appBarTitleWidget(),
      bgColor: AppColors.appColor,
      actionWidget: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          GestureDetector(
            onTap: () {},
            child: AssetImageWidget(
              iconsVideoWhiteBg,
              imageHeight: height_22,
              imageWidth: height_22,
            ).paddingOnly(right: margin_8),
          ),
          GestureDetector(
            onTapDown: (TapDownDetails details) {
              controller.showMenuWidget(details.globalPosition);
            },
            child: AssetImageWidget(
              iconsMoreVertBg,
              imageHeight: height_22,
              imageWidth: height_22,
            ).paddingOnly(right: margin_12),
          ),
        ],
      ),
    );
  }

  Widget _appBarTitleWidget() {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Stack(
          alignment: Alignment.bottomLeft,
          clipBehavior: Clip.none,
          children: [
            AssetImageWidget(
              controller.userModel.image ?? '',
              imageHeight: height_35,
              imageWidth: height_35,
              radiusAll: radius_30,
              imageFitType: BoxFit.cover,
            ),
            Positioned(
              bottom: height_2,
              left: height_25,
              child: Container(
                decoration: const BoxDecoration(
                    shape: BoxShape.circle, color: AppColors.whiteColor),
                child: Container(
                  height: height_5,
                  width: height_5,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: controller.isLive.value
                          ? AppColors.greenColor
                          : AppColors.redColor),
                ).paddingAll(margin_2),
              ),
            ),
          ],
        ).paddingOnly(right: margin_6),
        Flexible(
          child: TextView(
                  text: controller.userModel.name ?? '',
                  textStyle: textStyleTitleLarge().copyWith(
                      fontWeight: FontWeight.w600, color: AppColors.whiteColor))
              .paddingOnly(right: margin_15),
        ),
      ],
    );
  }

  Widget _bodyWidget() {
    return Column(
      children: [
        Expanded(
          child: ListView.builder(
            reverse: true,
            itemCount: controller.groupedMessages.length,
            itemBuilder: (context, index) {
              return _singleDayChat(index);
            },
          ),
        ),
        _messageTextField()
      ],
    );
  }

  Widget _singleDayChat(int index) {
    DateTime day =
        controller.groupedMessages.keys.toList().reversed.elementAt(index);
    List<ChatModel> dayMessages = controller.groupedMessages[day]!;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            _dividerWidget(),
            TextView(
              text: controller.getDayLabel(day),
              textStyle: textStyleBodyMedium().copyWith(
                  fontWeight: FontWeight.w500, color: AppColors.greyColor),
            ).paddingSymmetric(horizontal: margin_7),
            _dividerWidget()
          ],
        ),
        ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: dayMessages.length,
          itemBuilder: (context, index) {
            return SingleChatMessage(
              message: dayMessages[index],
            );
          },
        ),
      ],
    );
  }

  Widget _dividerWidget() {
    return Expanded(
      child: Divider(
              height: margin_0point7,
              color: AppColors.greyColor.withOpacity(0.5))
          .paddingSymmetric(vertical: margin_15),
    );
  }

  Widget _messageTextField() {
    return Container(
      color: Colors.transparent,
      child: Row(
        children: [
          Expanded(
            child: TextFieldWidget(
              textController: controller.chatMessageController,
              focusNode: controller.chatFocusNode,
              onChange: (value) {
                controller.chatMessage.value = value.trim();
              },
              hint: strFreeMessages,
              borderRadius: radius_30,
              suffixIcon: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  AssetImageWidget(
                    iconsAttchment,
                    imageHeight: height_18,
                    imageWidth: height_18,
                    color: AppColors.greyColor,
                  ).paddingOnly(right: margin_5),
                  Icon(
                    Icons.emoji_emotions_outlined,
                    color: AppColors.greyColor,
                    size: height_18,
                  ),
                ],
              ).paddingSymmetric(vertical: margin_0, horizontal: margin_8),
            ),
          ),
          GestureDetector(
            onTap: openGiftView,
            child: AssetImageWidget(
              iconsGiftOrange,
              imageWidth: height_40,
              imageHeight: height_40,
            ),
          ).paddingSymmetric(horizontal: margin_6),
          GestureDetector(
            onTap: () {},
            child: AssetImageWidget(
              iconsMicOrange,
              imageWidth: height_40,
              imageHeight: height_40,
            ),
          )
        ],
      )
          .paddingOnly(bottom: margin_15, top: margin_3)
          .paddingSymmetric(horizontal: margin_5),
    );
  }

  openGiftView() {
    Get.bottomSheet(
        backgroundColor: Colors.white,
        GiftView(),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(margin_30),
                topRight: Radius.circular(margin_30))));
  }
}
