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

import 'package:engagely/app/core/widget/app_bar_widget.dart';
import 'package:engagely/app/export.dart';
import 'package:engagely/app/modules/home/widget/user_item_view.dart';
import 'package:engagely/app/modules/live/controller/player_vs_player_module/create_match_controller.dart';
import 'package:engagely/app/modules/live/widget/invite_user_item_view.dart';

class CreateMatchView extends BaseView<CreateMatchController> {
  CreateMatchView({super.key});

  @override
  PreferredSizeWidget? appBar(BuildContext context) {
    return AppBarWidget(
      isCustom: false,
      appBarTitleText: strPlayerVs,
      bgColor: Colors.white,
      isbackIcon: true,
      backIconColor: Colors.black,
    );
  }

  @override
  Widget body(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _totalPaymentView(),
                _competionEditText(),
                _heading(),
                _searchEditText(),
                _listView(),
              ],
            ),
          ),
        ),
        _createCompetionButton(),
      ],
    );
  }

  Widget _totalPaymentView() => Container(
      width: Get.width,
      padding:
          EdgeInsets.only(left: margin_15, top: margin_20, bottom: margin_20),
      decoration: BoxDecoration(
          color: AppColors.creamColor.withOpacity(.7),
          borderRadius: BorderRadius.all(Radius.circular(margin_10))),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _totalPaymentAmount(),
          _amount(),
        ],
      ));
  _totalPaymentAmount() => TextView(
      text: strReward,
      textStyle: textStyleBodyLarge().copyWith(
          color: AppColors.darkGreyColor.withOpacity(.7),
          fontSize: font_14,
          fontWeight: FontWeight.w500));

  _amount() => Container(
      padding: EdgeInsets.symmetric(horizontal: margin_10, vertical: margin_3),
      decoration: BoxDecoration(
          color: AppColors.appColor,
          borderRadius: BorderRadius.all(Radius.circular(margin_15))),
      child: Row(
        children: [
          AssetImageWidget(
            iconsDianmod,
            imageWidth: margin_15,
            imageHeight: margin_15,
            color: Colors.white,
          ),
          TextView(
                  text: "20",
                  textStyle: textStyleBodyLarge().copyWith(
                      color: AppColors.whiteColor,
                      fontSize: font_12,
                      fontWeight: FontWeight.w600))
              .marginOnly(left: margin_2),
        ],
      )).marginOnly(right: margin_15);

  Widget _competionEditText() => TextFieldWidget(
        tvHeading: strCompetitionTitle,
        hint: strEnterTitle,
        contentPadding:
            EdgeInsets.symmetric(vertical: margin_15, horizontal: margin_15),
        inputType: TextInputType.name,
        fillColor: Colors.white,
        inputAction: TextInputAction.next,
        decoration: OutlineInputBorder(
            borderRadius: BorderRadius.circular(radius_10),
            borderSide: BorderSide(color: Colors.grey.shade200)),
      ).marginSymmetric(vertical: margin_15, horizontal: margin_18);

  Widget _heading() => Text.rich(
        TextSpan(
            text: strInvite,
            style: textStyleBodyLarge().copyWith(
                color: Colors.black,
                fontSize: font_18,
                fontWeight: FontWeight.w600),
            children: [
              TextSpan(
                  text: strMaxUsers,
                  style: textStyleTitleSmall().copyWith(
                    fontWeight: FontWeight.w600,
                    height: 1.5,
                    fontSize: font_13,
                    color: Colors.black.withOpacity(.5),
                  )),
            ]),
      ).marginOnly(top: margin_15, left: margin_18);

  Widget _searchEditText() => TextFieldWidget(
        hint: strSearch,
        contentPadding: EdgeInsets.symmetric(
          vertical: margin_15,
        ),
        inputType: TextInputType.name,
        fillColor: Colors.grey.shade200,
        onChange: (data) {
          if (data.isEmpty) {
            controller.isDataShow.value = false;
          } else {
            controller.isDataShow.value = true;
          }
        },
        prefixIcon: Icon(
          Icons.search,
          color: Colors.black,
          size: margin_25,
        ).paddingOnly(left: margin_10),
        inputAction: TextInputAction.next,
        decoration: OutlineInputBorder(
            borderRadius: BorderRadius.circular(radius_30),
            borderSide: BorderSide(color: Colors.grey.shade200)),
      ).marginSymmetric(vertical: margin_15, horizontal: margin_18);

  Widget _listView() => Obx(
        () => controller.isDataShow.value == false
            ? emptySizeBox()
            : ListView.builder(
                itemCount: 2,
                shrinkWrap: true,physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  return const UserInviteItemView()
                      .paddingSymmetric(vertical: margin_10);
                }).paddingSymmetric(horizontal: margin_15),
      );

  Widget _createCompetionButton() => Container(
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
              color: Colors.grey.shade300,
              offset: const Offset(0.0, -1.0),
              blurRadius: 3.0 //(x,y)
              ),
        ],
      ),
      padding: EdgeInsets.only(top: margin_10),
      child: MaterialButtonWidget(
        buttonBgColor: AppColors.appColor,
        onPressed: () {
          Get.toNamed(AppRoutes.playerStreamView, arguments: {isMyLive: true});
        },
        buttonText: strCreateCompetition,
        textColor: Colors.white,
      ).paddingSymmetric(horizontal: margin_18, vertical: margin_5));
}
