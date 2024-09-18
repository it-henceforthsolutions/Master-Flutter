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
import 'package:engagely/app/modules/post/controller/create_post_controller.dart';

class CreatePostView extends BaseView<CreatePostController> {
  CreatePostView({super.key});

  PreferredSizeWidget? appBar(BuildContext context) {
    return AppBarWidget(
      appBarTitleText: strCreatePost,
      isCustom: false,
      bgColor: Colors.white,
      isbackIcon: true,
    );
  }

  @override
  Widget body(BuildContext context) {
    return Column(
      children: [
        Expanded(
            child: SingleChildScrollView(
          child: Column(children: [
            _userInformation(),
            _locationEditText(),
            _writeCaption(),
            _images(),
          ]).marginSymmetric(horizontal: margin_18),
        )),
        _postButton(),
      ],
    );
  }

  _userInformation() => Row(
        children: [
          AssetImageWidget(
            icProfileUser,
            imageHeight: margin_40,
            imageWidth: margin_40,
          ),
          SizedBox(
            width: margin_10,
          ),
          Expanded(
            child: TextView(
                text: "Jessie Pinkmen 👑",
                textStyle: textStyleHeadlineLarge()
                    .copyWith(fontSize: font_18, color: Colors.black)),
          ),
          SizedBox(
            width: margin_10,
          ),
        ],
      ).marginOnly(top: margin_18);

  _locationEditText() => TextFieldWidget(
        hint: strLocations,
        contentPadding: EdgeInsets.symmetric(
          vertical: margin_18,
        ),
        style: textStyleBodyMedium()
            .copyWith(color: Colors.grey.shade600, fontSize: font_14),
        inputType: TextInputType.name,
        fillColor: Colors.white,
        prefixIcon: AssetImageWidget(
          iconsLocation,color: AppColors.appColor,
          imageHeight: margin_20,
          imageWidth: margin_20,
        ).paddingOnly(left: margin_15, right: margin_10),
        inputAction: TextInputAction.next,
        decoration: OutlineInputBorder(
            borderRadius: BorderRadius.circular(radius_10),
            borderSide: BorderSide(color: Colors.grey.shade400)),
      ).marginSymmetric(vertical: margin_15);

  _writeCaption() => TextFieldWidget(
        hint: strWriteCaption,
        contentPadding:
            EdgeInsets.symmetric(vertical: margin_18, horizontal: margin_10),
        style: textStyleBodyMedium()
            .copyWith(color: Colors.grey.shade600, fontSize: font_14),
        inputType: TextInputType.name,
        fillColor: Colors.white,
        inputAction: TextInputAction.next,
        decoration: UnderlineInputBorder(
            borderRadius: BorderRadius.circular(radius_10),
            borderSide: BorderSide(color: Colors.grey.shade400)),
      );

  _images() => Row(
        children: [
          const Expanded(
              child: AssetImageWidget(
            iconsPostImage,
          )),
          SizedBox(
            width: margin_15,
          ),
          const Expanded(
              child: AssetImageWidget(
            iconsPostImage,
          ))
        ],
      ).marginOnly(top: margin_25);

  Widget _postButton() => Container(
        width: Get.width,
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
            Get.offAllNamed(AppRoutes.mainViewRoute);
          },
          buttonText: strPost,
          textColor: Colors.white,
        )
            .paddingSymmetric(horizontal: margin_18)
            .paddingOnly(bottom: margin_10),
      );
}
