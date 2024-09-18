
import '../../../export.dart';
import '../controllers/reviews_controller.dart';

class ReviewsScreen extends GetView<ReviewsController> {
  const ReviewsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: false,
      extendBodyBehindAppBar: false,
      backgroundColor: Colors.white,

      body: Obx(() => _bodyWidget()),
    );
  }

  Widget _appBarWidget() {
    return SizedBox();
  }

  Widget _bodyWidget() {
    return _reviewsList();
  }

  Widget _reviewsList() {
    return ListView.separated(
      padding: EdgeInsets.zero,
      itemCount: 0,
      shrinkWrap: true,
      itemBuilder: (BuildContext ctx, index) {
        return _singleReviewWidget(index);
      },
      separatorBuilder: (context, index) {
        return _dividerWidget();
      },
    ).paddingSymmetric(vertical: margin_15,horizontal: margin_15);
  }

  Widget _singleReviewWidget(int index) {
    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AssetImageWidget(
               '',
              imageHeight: height_35,
              imageWidth: height_35,
              radiusAll: radius_20,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextView(
                    text: '',
                    textAlign: TextAlign.start,
                    textStyle: textStyleTitleLarge()
                        .copyWith(fontWeight: FontWeight.w600),
                    maxLines: 1,
                  ).paddingOnly(left: margin_3),
                  _ratingWidget(index)

                ],
              ).paddingSymmetric(horizontal: margin_6),
            ),
            TextView(
              text: '24 July 2023',
              textAlign: TextAlign.end,
              textStyle: textStyleBodyMedium().copyWith(
                  fontWeight: FontWeight.w500, color: Colors.grey),
              maxLines: 1,
            ),
          ],
        ),
        _commentTextWidget(index).paddingOnly(top: margin_10)
      ],
    );
  }

  Widget _ratingWidget(int index) {
    return RatingBar.builder(
      initialRating: 1,
      minRating: 1,
      direction: Axis.horizontal,
      allowHalfRating: true,
      itemCount: 5,
      wrapAlignment: WrapAlignment.start,
      unratedColor: Colors.grey,
      itemSize: height_14,
      ignoreGestures: true,
      itemPadding: EdgeInsets.only(right: margin_0point5),
      itemBuilder: (context, _) => Icon(
        Icons.star,
        color:AppColors.appColor ,
      ),
      onRatingUpdate: (rating) {
        print(rating);
      },
    );
  }


  Widget _commentTextWidget(int index) {
    return SizedBox();
    // return ReadMoreTextWidget(
    //   text: controller.reviewsList[index].commentData ?? '',
    //   trimLines: 4,
    //   textAlign: TextAlign.start,
    //   textStyle: textStyleTitleSmall()
    //       .copyWith(fontWeight: FontWeight.w500, color: darkGreyColor),
    // );
  }

  Widget _dividerWidget() {
    return Divider(height: height_1, color: AppColors.greyColor.withOpacity(0.5))
        .paddingSymmetric(vertical: margin_12);
  }
}
