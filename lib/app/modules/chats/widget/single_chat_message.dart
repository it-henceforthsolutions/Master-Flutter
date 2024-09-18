import '../../../export.dart';
import '../model/data_models/chat_model.dart';

class SingleChatMessage extends StatelessWidget {
  final ChatModel message;

  const SingleChatMessage({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: message.type == typeSent
          ? Alignment.centerRight
          : Alignment.centerLeft,
      child: message.type == typeSent
          ? _sentMessageWidget()
          : _receivedMessageWidget(),
    ).paddingSymmetric(vertical: margin_10);
  }

  Widget _sentMessageWidget() {
    return IntrinsicWidth(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Container(
            constraints: BoxConstraints(maxWidth: Get.width * .7),
            padding: EdgeInsets.symmetric(vertical: margin_3),
            decoration: BoxDecoration(
              color: AppColors.appColor,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(radius_15),
                topRight: Radius.circular(radius_15),
                bottomLeft: Radius.circular(radius_15),
              ),
            ),
            child: (message.msgType == typeVideo
                    ? _videoMessageView()
                    : _textMessageView())
                .paddingSymmetric(vertical: margin_10, horizontal: margin_12),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            mainAxisSize: MainAxisSize.max,
            children: [
              Flexible(
                child: TextView(
                  text: message.time,
                  textAlign: TextAlign.start,
                  textStyle: textStyleBodySmall()
                      .copyWith(fontSize: font_10, color: AppColors.greyColor),
                ),
              ),
              message.msgType == typeVideo
                  ? const SizedBox()
                  : AssetImageWidget(
                      iconsIcSentGreen,
                      imageHeight: height_10,
                      imageWidth: height_12,
                    ),
            ],
          ).paddingOnly(top: margin_3)
        ],
      ),
    );
  }

  TextView _textMessageView({bool isSent = true}) {
    return TextView(
      text: message.text,
      maxLines: 20,
      textStyle: textStyleTitleSmall()
          .copyWith(color: isSent ? AppColors.whiteColor : null),
    );
  }

  Widget _videoMessageView({bool isSent = true}) {
    return Row(
      children: [
        AssetImageWidget(
          isSent ? iconsVideoWhiteBg : iconsIcProfileVid,
          imageWidth: height_32,
          imageHeight: height_32,
        ).paddingOnly(right: margin_8),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextView(
                text: strVideoCallEnded,
                maxLines: 2,
                textStyle: textStyleTitleSmall()
                    .copyWith(color: isSent ? AppColors.whiteColor : null),
              ),
              TextView(
                text: '15:00',
                maxLines: 1,
                textStyle: textStyleBodyMedium().copyWith(
                    color: isSent ? AppColors.whiteColor : null,
                    fontWeight: FontWeight.w400),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _receivedMessageWidget() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AssetImageWidget(
          message.user?.image ?? '',
          imageHeight: height_35,
          imageWidth: height_35,
          radiusAll: radius_20,
          imageFitType: BoxFit.cover,
        ).paddingOnly(right: margin_6, top: margin_3),
        IntrinsicWidth(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Container(
                constraints: BoxConstraints(maxWidth: Get.width * .7),
                decoration: BoxDecoration(
                  boxShadow: const [
                    BoxShadow(
                      color: AppColors.greyColorExtraLight,
                      spreadRadius: 2,
                      blurRadius: 3,
                      offset: Offset(0, 1),
                    ),
                  ],
                  color: AppColors.whiteColor,
                  borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(radius_15),
                    topRight: Radius.circular(radius_15),
                    bottomLeft: Radius.circular(radius_15),
                  ),
                ),
                child: (message.msgType == typeVideo
                        ? _videoMessageView(isSent: false)
                        : _textMessageView(isSent: false))
                    .paddingSymmetric(
                        vertical: margin_10, horizontal: margin_12),
              ),
              TextView(
                text: message.time,
                textAlign: TextAlign.start,
                textStyle: textStyleBodySmall()
                    .copyWith(fontSize: font_10, color: AppColors.greyColor),
              ).paddingOnly(top: margin_3)
            ],
          ),
        ),
      ],
    );
  }
}
