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
import 'package:engagely/app/export.dart';
import 'package:engagely/app/modules/post/controller/post_image_picker_controller.dart';

class PostImagePickView extends BaseView<ImagePickerController> {
  PostImagePickView({super.key});

  PreferredSizeWidget? appBar(BuildContext context) {
    return AppBarWidget(
      appBarTitleText: strCreatePost, isCustom: false,bgColor: Colors.white,isbackIcon: true,
    );
  }

  @override
  Widget body(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            _cameraImagePicker(),
            SizedBox(
              width: margin_15,
            ),
            _galleryImagePicker(),
          ],
        ),
      ],
    ).marginSymmetric(horizontal: margin_18, vertical: margin_25);
  }

  _cameraImagePicker() => Expanded(
        child: ButtonWidget(onTap: (){
          Get.toNamed(AppRoutes.createPostView);
        },
          child: Container(height: height_130,
            padding: EdgeInsets.symmetric(vertical: margin_35),
            decoration: BoxDecoration(
                color: AppColors.greyLightColorw300,
                borderRadius: BorderRadius.circular(margin_10)),
            child: Column(children: [
              _cameraIcon(),
              _takePhoto(),
            ]),
          ),
        ),
      );

  Widget _cameraIcon() => AssetImageWidget(
        iconsCamera,
        imageWidth: margin_35,
        imageHeight: margin_35,
      );

  Widget _takePhoto() => TextView(
        text: strTakePhoto,
        textStyle: textStyleHeadlineLarge().copyWith(
            color: Colors.black,
            fontSize: font_14,
            fontWeight: FontWeight.w500),
      ).marginOnly(top: margin_15);

  _galleryImagePicker() => Expanded(
        child: ButtonWidget(onTap: (){
          Get.toNamed(AppRoutes.createPostView);
        },
          child:Container(height: height_130,
          padding: EdgeInsets.symmetric(vertical: margin_35),
          decoration: BoxDecoration(
              color: AppColors.greyLightColorw300,
              borderRadius: BorderRadius.circular(margin_10)),
          child: Column(children: [
            _galleryIcon(),
            _openGallery(),
          ]),
        ),
      ));

  Widget _galleryIcon() => AssetImageWidget(
        iconsGallery,
        imageWidth: margin_35,
        imageHeight: margin_35,
      );

  Widget _openGallery() => TextView(
        text: strOpenGallery,
        textStyle: textStyleHeadlineLarge().copyWith(
            color: Colors.black,
            fontSize: font_14,
            fontWeight: FontWeight.w500),
      ).marginOnly(top: margin_15,);
}
