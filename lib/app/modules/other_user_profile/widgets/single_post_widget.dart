/*
 * @copyright : Henceforth Pvt. Ltd. <info@henceforthsolutions.com>
 * @author     : Gaurav Negi
 * All Rights Reserved.
 * Proprietary and confidential :  All information contained herein is, and remains
 * the property of Henceforth Pvt. Ltd. and its partners.
 * Unauthorized copying of this file, via any medium is strictly prohibited.
 *
 */

import 'package:engagely/app/modules/other_user_profile/models/post_model.dart';

import '../../../export.dart';
import 'comments_view.dart';

class SinglePostWidget extends StatelessWidget {
  final PostModel postModel;
  final Function(TapDownDetails details)? moreTapButton;
  final int  index ;

  const SinglePostWidget({super.key, required this.postModel, required this. index, this.moreTapButton});

  @override
  Widget build(BuildContext context) {
    return _singlePostView();
  }

  Widget _singlePostView() {
    return Column(children: [
      Row(
        children: [
          AssetImageWidget(
            postModel.imagePath ?? '',
            imageHeight: height_35,
            imageWidth: height_35,
            radiusAll: radius_20,
            imageFitType: BoxFit.cover,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextView(
                  text: postModel.title ?? '',
                  textStyle: textStyleTitleLarge().copyWith(
                    fontWeight: FontWeight.w500,
                  ),
                  maxLines: 1,
                ),
                TextView(
                  text: postModel.daysAgo ?? '',
                  textAlign: TextAlign.start,
                  textStyle: textStyleBodyMedium().copyWith(
                      fontWeight: FontWeight.w400, color: AppColors.greyColor),
                  maxLines: 1,
                ),
              ],
            ).paddingSymmetric(horizontal: margin_6),
          ),
          GestureDetector( onTapDown: moreTapButton,
            child: Icon(
              Icons.more_vert,
              size: height_16,
            ),
          ),
        ],
      ).paddingSymmetric(horizontal: margin_15),
      ReadMoreTextWidget(
         postModel.postData ?? '',
        trimLines: 3,
        style: textStyleTitleSmall()
            .copyWith(fontWeight: FontWeight.w400, color: AppColors.greyColor),
      ).paddingOnly(bottom: margin_5,top: margin_5).paddingSymmetric(horizontal: margin_15),
      _storyImageVideoView().paddingOnly(top: margin_7),
      _likeCommentSection().paddingOnly(top: margin_8),
    ]);
  }

  Widget _storyImageVideoView() {
    return postModel.type == typeVideo
        ? Stack(
            alignment: Alignment.center,
            children: [
              ClipRRect(
                child: ColorFiltered(
                  colorFilter: ColorFilter.mode(
                      Colors.black.withOpacity(0.3), BlendMode.darken),
                  child: AssetImageWidget(
                    postModel.file ?? '',
                    imageHeight: height_180,
                    imageWidth: Get.width,
                    imageFitType: BoxFit.cover,
                  ),
                ),
              ),
              AssetImageWidget(
                iconsPlay,
                imageHeight: height_35,
                imageWidth: height_35,
              ),
            ],
          )
        : AssetImageWidget(
            postModel.file ?? '',
            imageHeight: height_180,
            imageWidth: Get.width,
            imageFitType: BoxFit.cover,
          );
  }

  Widget _likeCommentSection() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _detailRowWidget(index%2==0?iconsLikedFilled:iconsLikeUnselected, text: '22 Likes',isLiked: index%2==0?true:false),
            _detailRowWidget(iconsCommentOutlined, text: '1 Comment',onTap: () => openCommentsView(),),
          ],
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _detailRowWidget(iconsGiftOutlined),
            _detailRowWidget(iconsShareOutlined),
          ],
        ),
      ],
    ).paddingSymmetric(horizontal: margin_15);
  }

  Widget _detailRowWidget(String image, {String? text, VoidCallback? onTap,isLiked}) {
    return GestureDetector(
      onTap: onTap,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          AssetImageWidget(
            image,
            imageWidth: height_14,
            imageHeight: height_14,
          ),
          text != null
              ? TextView(
                  text: text,
                  maxLines: 1,
                  textStyle: textStyleBodyMedium()
                      .copyWith(fontWeight: FontWeight.w400,color: isLiked==true?AppColors.redPrimaryColor:Colors.black),
                ).paddingOnly(left: margin_4)
              : const SizedBox(),
        ],
      ).paddingSymmetric(horizontal: margin_5),
    );
  }

  openCommentsView() {
    Get.bottomSheet(
        backgroundColor: Colors.white,

        CommentsView(),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(margin_30),
                topRight: Radius.circular(margin_30))));
  }
}
