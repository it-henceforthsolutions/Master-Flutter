/*
 * @copyright : Henceforth Pvt. Ltd. <info@henceforthsolutions.com>
 * @author     : Gaurav Negi
 * All Rights Reserved.
 * Proprietary and confidential :  All information contained herein is, and remains
 * the property of Henceforth Pvt. Ltd. and its partners.
 * Unauthorized copying of this file, via any medium is strictly prohibited.
 *
 */

import 'package:engagely/app/modules/authentication/widgets/auth_base_view.dart';

import '../../../export.dart';

class ProfileSetupScreen extends BaseView<ProfileSetupController> {
  ProfileSetupScreen({super.key});

  @override
  PreferredSizeWidget? appBar(BuildContext context) {
    return null;
  }

  @override
  Color statusBarColor() {
    // TODO: implement statusBarColor
    return AppColors.appColor;
  }

  @override
  Widget body(BuildContext context) {
    return AuthBaseView(
      isBackButton: false,
      isSkipButton: true,
      onSkipPressed: () {
        Get.toNamed(AppRoutes.addAddressView);
      },
      bodyWidget: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
              child: SingleChildScrollView(
                  padding: EdgeInsets.zero,
                  child: Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _headingTextView(),
                        _descrptionTextView(),
                        _profileImage(),
                        _form(),
                      ],
                    ).marginSymmetric(horizontal: margin_15),
                  ))),
          _continueButton()
        ],
      ),
    );
  }

  Widget _headingTextView() => Row(
        children: [
          TextView(
            text: strHi,
            textStyle: textStyleHeadlineLarge()
                .copyWith(fontWeight: FontWeight.w600, fontSize: font_22),
          ).marginOnly(top: margin_5),
          AssetImageWidget(
            iconsHand,
            imageHeight: height_30,
            imageWidth: height_30,
          ).marginOnly(top: margin_5, left: margin_5)
        ],
      ).marginOnly(top: margin_15);

  Widget _descrptionTextView() => TextView(
        text: strProfileSetupDescrption,
        maxLines: 2,
        textStyle: textStyleBodyLarge()
            .copyWith(color: AppColors.greyLightColor, height: 1.5),
      ).marginOnly(top: margin_5);

  Widget _profileImage() {
    return Center(
      child: SizedBox(
        height: height_100,
        width: height_100,
        child: Stack(
          alignment: Alignment.center,
          children: [
            AssetImageWidget(
              iconsProfile,
              radiusAll: margin_100,
              imageHeight: margin_100,
              imageWidth: margin_100,
              imageFitType: BoxFit.fill,
            ),
            _imagePickerWidget(),
          ],
        ),
      ).marginSymmetric(vertical: margin_15),
    );
  }

  Widget _imagePickerWidget() => Align(
      alignment: Alignment.center,
      child: InkWell(
        onTap: () {
          Get.bottomSheet(ImagePickerDialog(
            galleryFunction: () {
              Get.back();
              controller.updateImageFile(imageFromGallery());
            },
            cameraFunction: () {
              Get.back();
              controller.updateImageFile(imageFromCamera());
            },
            title: strProfilePicture,
          ));
        },
        child: TextView(
            text: strEdit,
            textStyle: textStyleHeadlineMedium().copyWith(color: Colors.white)),
      ));

  Widget _form() => Form(
        key: controller.formKey,
        child: Column(
          children: [
            _firstNameTextField(),
            _emailTextField(),
            _dobEditText(),
            _genderTextField(),
            _descrptionEditText(),
          ],
        ).paddingOnly(top: margin_20, bottom: margin_10),
      );

  Widget _firstNameTextField() => TextFieldWidget(
        hint: strEnterNickName,
        textController: controller.firstNameTextController,
        focusNode: controller.firstNameFocusNode,
        inputType: TextInputType.name,
        inputAction: TextInputAction.next,
        formatter: [
          FilteringTextInputFormatter.allow(RegExp('[a-zA-Z]')),
        ],
        validate: (String? value) {
          return FieldChecker.fieldChecker(
              value: value?.trim() ?? "", message: strEnterNickName);
        },
      ).paddingOnly(bottom: margin_15);

  Widget _emailTextField() => TextFieldWidget(
        hint: strEnterYourEmail,
        textController: controller.emailEditTextController,
        focusNode: controller.emailFocusNode,
        inputType: TextInputType.emailAddress,
        inputAction: TextInputAction.next,
        validate: (String? value) {
          return FieldChecker.fieldChecker(
              value: value?.trim() ?? "", message: "keyAddress".tr);
        },
      ).paddingOnly(bottom: margin_15);

  Widget _dobEditText() => TextFieldWidget(
        hint: strEnterDateBirth,
        textController: controller.dobEditTextController,
        focusNode: controller.dobFocusNode,
        inputType: TextInputType.text,
        inputAction: TextInputAction.next,
        suffixIcon: AssetImageWidget(iconsCalander, imageHeight: height_15)
            .marginAll(margin_10),
        validate: (String? value) {
          return FieldChecker.fieldChecker(
              value: value?.trim() ?? "", message: strDateBirth);
        },
      ).paddingOnly(bottom: margin_15);

  Widget _genderTextField() => DropDownTextFieldWidget(
        focusNode: controller.genderFocusNode,
        hint: strSelectYourGender,
        items: const <String>["Male", "Female", "Others"],
        dropdownType: true,
      ).paddingOnly(bottom: margin_15);

  Widget _descrptionEditText() => TextFieldWidget(
        hint: strBioShort,
        maxLines: 5,
        minLine: 4,
        textController: controller.descrptionEditTextController,
        focusNode: controller.descrptionFocusNode,
        inputType: TextInputType.multiline,
        inputAction: TextInputAction.newline,
        validate: (String? value) {
          return FieldChecker.fieldChecker(
              value: value?.trim() ?? "", message: strBio);
        },
      );

  Widget _continueButton() => SafeArea(
        top: false,
        child: Container(
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
                  onPressed: () {
                    Get.toNamed(AppRoutes.chooseYourIntersetView);

                  },
                  textColor: Colors.white,
                  buttonText: strContinue,
                  buttonBgColor: AppColors.appColor,
                ).marginSymmetric(horizontal: margin_15))
            .marginOnly(bottom: margin_10),
      );
}
