import 'package:engagely/app/core/widget/app_bar_widget.dart';
import 'package:engagely/app/core/widget/ripple.dart';
import 'package:engagely/app/modules/live/widget/strem_user_view.dart';
import 'package:engagely/app/modules/profile/controller/edit_profile_controller.dart';
import 'package:engagely/app/modules/profile/widgets/mutiple_images.dart';

import '../../../export.dart';
import '../../live/widget/image_viewer.dart';

class EditProfileView extends BaseView<EditProfileController> {
  EditProfileView({super.key});

  @override
  PreferredSizeWidget? appBar(BuildContext context) {
    return AppBarWidget(
      appBarTitleText: strAccount,
      isCustom: false,
      bgColor: Colors.white,
      isbackIcon: true,
    );
  }

  @override
  Widget body(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [_bodyWidget(), _continueButton()],
    );
  }

  Widget _bodyWidget() => Expanded(
          child: SingleChildScrollView(
        child: Column(
          children: [
            _profileImage(),
            _pictureListView(),
            _form(),
          ],
        ),
      ).marginSymmetric(horizontal: margin_18));

  Widget _profileImage() {
    return Center(
      child: SizedBox(
        height: height_100,
        width: height_100,
        child: Stack(
          alignment: Alignment.center,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(margin_100)),
              child: ColorFiltered(
                  colorFilter: ColorFilter.mode(
                      Colors.black.withOpacity(.3), BlendMode.darken),
                  child: AssetImageWidget(
                    iconsProfile,
                    radiusAll: margin_100,
                    imageHeight: margin_100,
                    imageWidth: margin_100,
                    imageFitType: BoxFit.fill,
                  )),
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



  _pictureListView() => SizedBox(
    height: height_55,
    child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: controller.userList.length,
        itemBuilder: (context, index) =>
            ButtonWidget(onTap: (){

            },
              child: MultipleImageViewer(image: controller.userList[index].image)
                  .marginOnly(right: margin_10),
            )),
  );
  Widget _form() => Form(
        key: controller.formGlobalKey,
        child: Column(
          children: [
            _firstNameTextField(),
            _emailTextField(),
            _mobileNumberWidget(),
            _dobEditText(),
            _genderTextField(),
            _descrptionEditText(),
          ],
        ).paddingOnly(top: margin_20, bottom: margin_10),
      );

  _firstNameTextField() => TextFieldWidget(
        hint: strEnterNickName,
        tvHeading: strNickName,
        textController: controller.firstNameTextController,
        focusNode: controller.firstNameFocusNode,
        inputType: TextInputType.name,
        inputAction: TextInputAction.next,
        formatter: [
          FilteringTextInputFormatter.allow(RegExp('[a-zA-Z]')),
        ],
        validate: (String? value) {
          return FieldChecker.fieldChecker(
              value: value?.trim() ?? "", message: strNickName);
        },
      ).paddingOnly(bottom: margin_15);

  _emailTextField() => TextFieldWidget(
        tvHeading: strEmail,
        hint: strEnterEmail,
        textController: controller.emailEditTextController,
        focusNode: controller.emailFocusNode,
        inputType: TextInputType.emailAddress,
        inputAction: TextInputAction.next,
        suffixIcon: Obx(() => !controller.isVerified.value
            ? _verifyButton()
            : AssetImageWidget(iconsVerify,
                    imageHeight: height_15, imageWidth: height_15)
                .marginAll(margin_10)),
        validate: (String? value) {
          return FieldChecker.fieldChecker(
              value: value?.trim() ?? "", message: strEmail);

        },
      ).paddingOnly(bottom: margin_15);

  _verifyButton() => ButtonWidget(
        onTap: () {
          controller.showOtpVerificationSheet();
        },
        child: Container(
          width: margin_60,
          margin: EdgeInsets.all(margin_5),
          padding:
              EdgeInsets.symmetric(horizontal: margin_5, vertical: margin_4),
          decoration: BoxDecoration(
              border: Border.all(color: AppColors.appColor),
              color: AppColors.appColor,
              borderRadius: BorderRadius.circular(margin_5)),
          child: Center(
            child: TextView(
                text: strVerify,
                textStyle: textStyleBodyMedium().copyWith(
                    color: Colors.white, fontWeight: FontWeight.w600)),
          ),
        ),
      );

  Widget _mobileNumberWidget() => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _headingMobileNumber(),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _countryPickerIcon(),
              _mobileNumberTextField(),
            ],
          ),
        ],
      );

  _headingMobileNumber() => TextView(
        text: strPhoneNo,
        textStyle: textStyleBodyLarge().copyWith(
            color: Colors.black.withOpacity(.5),
            fontSize: font_14,
            fontWeight: FontWeight.w500),
      ).marginOnly(bottom: margin_7);

  Widget _countryPickerIcon() {
    return Obx(
      () => CountryPicker(
        showFlag: false,
        selectedCountry: controller.selectedCountry.value,
        returnCountry: (country) {
          controller.selectedCountry.value = country;
        },
      ).paddingOnly(right: margin_10),
    );
  }

  Widget _mobileNumberTextField() => Expanded(
        child: TextFieldWidget(
          hint: strEnterPhoneNumber,
          textController: controller.mobileTextController,
          focusNode: controller.mobileNumberFocusNode,
          formatter: [
            FilteringTextInputFormatter.allow(RegExp('[0-9]')),
          ],
          validate: (data) => PhoneNumberValidate.validateMobile(data),
          inputType: TextInputType.phone,
          suffixIcon: AssetImageWidget(iconsVerify,
                  imageHeight: height_15, imageWidth: height_15)
              .marginAll(margin_10),
          maxLength: 15,
          inputAction: TextInputAction.next,
        ).paddingOnly(bottom: margin_15),
      );

  _dobEditText() => TextFieldWidget(
        tvHeading: strDOB,
        hint: strEnterDateBirth,
        textController: controller.dobEditTextController,
        focusNode: controller.dobFocusNode,
        inputType: TextInputType.text,
        inputAction: TextInputAction.next,
        suffixIcon: AssetImageWidget(iconsCalander, imageHeight: height_15)
            .marginAll(margin_10),
        validate: (String? value) {
          return FieldChecker.fieldChecker(
              value: value?.trim() ?? "", message: strDOB);
        },
      ).paddingOnly(bottom: margin_15);

  _genderTextField() => DropDownTextFieldWidget(
        tvHeading: strGender,
        focusNode: controller.genderFocusNode,
        hint: strSelectYourGender,
        items: const <String>["Male", "Female", "Others"],
        dropdownType: true,
      ).paddingOnly(bottom: margin_15);

  Widget _descrptionEditText() => TextFieldWidget(
        hint: strBioShort,
        tvHeading: strShortBio,
        maxLines: 5,
        minLine: 4,
        textController: controller.descrptionEditTextController,
        focusNode: controller.descrptionFocusNode,
        inputType: TextInputType.multiline,
        inputAction: TextInputAction.newline,
        validate: (String? value) {
          return FieldChecker.fieldChecker(
              value: value?.trim() ?? "", message: strShortBio);
        },
      );

  Widget _continueButton() => Container(
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
      padding:
          EdgeInsets.only(top: margin_10, left: margin_18, right: margin_18),
      child: MaterialButtonWidget(
        onPressed: () {
          Get.back();
        },
        textColor: Colors.white,
        buttonText: strSaveChanges,
        buttonBgColor: AppColors.appColor,
      )).marginSymmetric(vertical: margin_10);
}
