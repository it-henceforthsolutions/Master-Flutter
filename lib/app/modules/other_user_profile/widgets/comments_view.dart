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
import 'package:engagely/app/modules/other_user_profile/controllers/comments_controller.dart';
import 'package:engagely/app/modules/other_user_profile/models/comment_model.dart';

import '../../../export.dart';

class CommentsView extends StatelessWidget {
  const CommentsView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
        init: CommentController(),
        builder: (controller) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _notchView().marginSymmetric(horizontal: margin_18),
              _heading().marginSymmetric(horizontal: margin_18),
              Expanded(child: _commentsList(controller).marginSymmetric(horizontal: margin_18)),
              Divider(height: height_1,color: Colors.grey.shade300,).paddingSymmetric(vertical: margin_10),
              _addCommentField().marginSymmetric(horizontal: margin_18).paddingOnly(bottom: margin_20)
            ],
          );
        });
  }

  Widget _notchView() => Center(
        child: Container(
          margin: EdgeInsets.symmetric(vertical: margin_15),
          width: margin_60,
          height: height_5,
          decoration: BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.circular(margin_5)),
        ),
      );

  Widget _heading() => TextView(
        text: strComments,
        textStyle: textStyleBodyLarge().copyWith(
            color: Colors.black,
            fontSize: font_18,
            fontWeight: FontWeight.w600),
      ).marginOnly(top: margin_10);

  Widget _commentsList(CommentController controller) {
    return ListView.builder(
        itemCount: controller.listData.length,
        shrinkWrap: true,
        padding: EdgeInsets.zero,
        itemBuilder: (BuildContext ctx, index) {
          return _singleCommentView(controller.listData[index])
              .paddingOnly(bottom: margin_25);
        });
  }

  Widget _singleCommentView(CommentModel? model) {
    return GetBuilder<CommentController>(
      builder: (CommentController controller) {
        return Column(children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AssetImageWidget(
                model?.imagePath ?? '',
                imageHeight: height_35,
                imageWidth: height_35,
                radiusAll: radius_20,
                imageFitType: BoxFit.cover,
              ).paddingOnly(top: margin_3),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextView(
                      text: model?.title ?? '',
                      textStyle: textStyleTitleSmall().copyWith(
                        fontWeight: FontWeight.w500,
                      ),
                      maxLines: 1,
                    ),
                    ReadMoreTextWidget(
                       model?.postData ?? '',
                      textAlign: TextAlign.start,
                      style: textStyleTitleSmall().copyWith(
                          fontWeight: FontWeight.w400, color: AppColors.greyColor),
                      trimLines: 3,
                    ),
                    Row(
                      children: [
                        TextView(
                          text: model?.daysAgo ?? '',
                          textStyle: textStyleBodyMedium().copyWith(
                            fontWeight: FontWeight.w400,
                          ),
                        ).paddingOnly(right: margin_8),
                        TextView(
                          text: 'Reply',
                          textStyle: textStyleBodyMedium().copyWith(
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ).paddingOnly(top: margin_8),
                    (model?.replies?.isNotEmpty ?? false)
                        ? ButtonWidget(onTap: (){
                      controller.isShow=!controller.isShow;
                      controller.update();
                    },
                          child: Row(
                              children: [
                                SizedBox(
                                  width: height_20,
                                  child: Divider(
                                    height: height_1,
                                    color: AppColors.greyColor,
                                  ).paddingOnly(right: margin_5),
                                ),
                                TextView(
                                  text: controller.isShow==false?'View ${model?.replies?.length ?? 0} replies':"Hide reply",
                                  textStyle: textStyleBodySmall().copyWith(
                                      fontSize: font_12,
                                      fontWeight: FontWeight.w600,
                                      color: AppColors.greyColor),
                                ),
                              ],
                            ).paddingOnly(top: margin_8),
                        )
                        : const SizedBox(),
        if(controller.isShow==true)...[
                    if (model?.type == typeMain) ...[
                      ...List.generate(model?.replies?.length ?? 0,
                          (index) => _singleCommentView(model?.replies?[index]))
                    ]]
                  ],
                ).paddingSymmetric(horizontal: margin_6),
              ),
            ],
          ).paddingSymmetric(),
          if(controller.isShow==true)...[
          if (model?.type == typeReply) ...[
            ...List.generate(model?.replies?.length ?? 0,
                (index) => _singleCommentView(model?.replies?[index]))
          ]
        ]
        ]).paddingOnly(top: margin_10);
      }
    );
  }

  Widget _addCommentField() {
    return Row(
      children: [
        AssetImageWidget(
          icProfileUser,
          imageHeight: height_40,
          imageWidth: height_40,
          radiusAll: height_40,
          imageFitType: BoxFit.cover,
        ).paddingOnly(right: margin_10),
        Expanded(child: TextFieldWidget(
          hint: strAddCommentHere,
          borderRadius: radius_30,
          decoration: OutlineInputBorder(
              borderRadius: BorderRadius.circular(radius_30),
              borderSide: BorderSide(color: Colors.grey.shade200)),
          fillColor: CupertinoColors.extraLightBackgroundGray,
          suffixIcon: Icon(Icons.emoji_emotions_outlined,color: AppColors.greyColor,size: height_18,),


        ))
      ],
    );
  }
}
