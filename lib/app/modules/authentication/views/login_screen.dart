/*
 * @copyright : Henceforth Pvt. Ltd. <info@henceforthsolutions.com>
 * @author     : Gaurav Negi
 * All Rights Reserved.
 * Proprietary and confidential :  All information contained herein is, and remains
 * the property of Henceforth Pvt. Ltd. and its partners.
 * Unauthorized copying of this file, via any medium is strictly prohibited.
 *
 */

import 'package:engagely/app/core/widget/intl_phone_field/intl_phone_field.dart';
import 'package:engagely/app/core/widget/ripple.dart';
import 'package:engagely/app/modules/authentication/widgets/auth_base_view.dart';

import '../../../core/widget/intl_phone_field/countries.dart';
import '../../../export.dart';

class LoginScreen extends BaseView<LoginController> {
  LoginScreen({super.key});

  @override
  PreferredSizeWidget? appBar(BuildContext context) {
    return null;
  }

  @override
  Color statusBarColor() {
    return AppColors.appColor;
  }

  @override
  Widget body(BuildContext context) {
    return AuthBaseView(
      isBackButton: true,
      onBackPressed: () {
        Get.back();
      },
      bodyWidget: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _headingTextView(),
            _descrptionTextView(),
            _mobileNumberTextField(),
            _dividerWidget(),
            _socialButton(),
            _loginButton(),
            _termsCondtion(),
          ],
        ).paddingAll(margin_15),
      ),
    );
  }

  Widget _headingTextView() => TextView(
        text: strEnterPNumberH,
        textStyle:
            textStyleHeadlineLarge().copyWith(fontWeight: FontWeight.w600),
      ).marginOnly(top: margin_5);

  Widget _descrptionTextView() => TextView(
        text: strOtpAuth,
        maxLines: 2,
        textStyle: textStyleBodyLarge()
            .copyWith(color: AppColors.greyLightColor, height: 1.5),
      ).marginOnly(top: margin_5);

  _mobileNumberTextField() => Form(
        key: controller.formState,
        child: IntlPhoneField(
                showCountryFlag: false,
                controller: controller.mobileTextController,
                focusNode: controller.mobileNumberFocusNode,
                initialSelectedCountry: controller.selectedCountry.value,
                showDivider: false,
                emptyFieldMessage: strPlsEnterPhone,
                onCountryChanged: (Country country) {
                  controller.selectedCountry.value = country;
                  controller.mobileTextController.clear();
                },
                style: textStyleTitleMedium().copyWith(
                    fontWeight: FontWeight.w400,
                    color: Colors.black,
                    fontSize: font_14),
                flagsButtonPadding: EdgeInsets.symmetric(
                    vertical: margin_10, horizontal: margin_10),
                dropdownIconPosition: IconPosition.trailing,
                dropdownDecoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(margin_10),
                    border: Border.all(color: Colors.grey.shade300)))
            .marginOnly(top: margin_15),
      );

  Widget _dividerWidget() => Row(
        children: [
          Expanded(child: _divider()),
          _orTextView(),
          Expanded(child: _divider()),
        ],
      ).marginOnly(top: margin_20);

  Widget _orTextView() => const TextView(
        text: strOr,
      ).marginSymmetric(horizontal: margin_15);

  Widget _divider() => Divider(
        color: Colors.grey.shade300,
      );

  Widget _socialButton() => Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _googleButton(),
          _facebookButton(),
          _appleButton(),
        ],
      ).marginOnly(top: margin_20);

  Widget _googleButton() => ButtonWidget(
        onTap: () {},
        child: AssetImageWidget(iconsIcGoogle,
            imageWidth: margin_70, imageHeight: margin_70),
      );
  Widget _facebookButton() => ButtonWidget(
        onTap: () {},
        child: AssetImageWidget(iconsIcFacebook,
            imageWidth: margin_70, imageHeight: margin_70),
      );
  Widget _appleButton() => ButtonWidget(
        onTap: () {},
        child: AssetImageWidget(iconsIcApple,
            imageWidth: margin_70, imageHeight: margin_70),
      );

  Widget _loginButton() => MaterialButtonWidget(
        buttonBgColor: AppColors.appColor,
        onPressed: () {
          Get.toNamed(AppRoutes.otpVerificationRoute);
        },
        buttonText: strContinue,
        textColor: Colors.white,
      ).marginOnly(top: margin_15);

  Widget _termsCondtion() => Text.rich(
        TextSpan(
            text: strBySigning,
            style: textStyleBodyLarge().copyWith(
              color: AppColors.greyLightColor,
            ),
            children: [
              TextSpan(
                  text: strTermsCondtion,
                  recognizer: TapGestureRecognizer()
                    ..onTap = () => Get.toNamed(AppRoutes.appContentView,
                        arguments: {pageType: pageTypeTermsCondtions}),
                  style: textStyleTitleSmall().copyWith(
                      fontWeight: FontWeight.w600,
                      height: 1.5,
                      fontSize: font_13,
                      color: Colors.black.withOpacity(.5),
                      decoration: TextDecoration.underline)),
              TextSpan(
                  text: strUserData,
                  style: textStyleBodyLarge().copyWith(
                    color: AppColors.greyLightColor,
                  )),
              TextSpan(
                  text: strPrivacyPolicy,
                  recognizer: TapGestureRecognizer()
                    ..onTap = () => Get.toNamed(AppRoutes.appContentView,
                        arguments: {pageType: pageTypePrivacyPolicy}),
                  style: textStyleTitleSmall().copyWith(
                      fontWeight: FontWeight.w600,
                      height: 1.5,
                      fontSize: font_13,
                      color: Colors.black.withOpacity(.5),
                      decoration: TextDecoration.underline)),
            ]),
      ).paddingOnly(bottom: margin_5, top: margin_10);
}
