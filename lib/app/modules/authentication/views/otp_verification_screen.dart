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

class OtpVerificationScreen extends BaseView<OtpVerificationController> {
  OtpVerificationScreen({super.key});
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
        isBackButton: true,
        onBackPressed: () {
          Get.back();
        },
        bodyWidget: _bodyElements());
  }

  _bodyElements() => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
              child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _headingTextView(),
                _descrptionTextView(),
                _otpTextFields(),
                _resendOtp(),
              ],
            ),
          )),
          _verifyButton(),
        ],
      ).paddingOnly(left: margin_15, right: margin_15, top: margin_15);

  Widget _headingTextView() => TextView(
        text: strVerfiyNumber,
        textStyle:
            textStyleHeadlineLarge().copyWith(fontWeight: FontWeight.w600),
      ).marginOnly(top: margin_5);

  Widget _descrptionTextView() => Text.rich(
        TextSpan(
            text: strResendHeading,
            style: textStyleBodyLarge()
                .copyWith(color: Colors.grey.shade700, height: 1.5),
            children: [
              TextSpan(
                  text: "+91 9856235845",
                  recognizer: TapGestureRecognizer()..onTap = () => Get.back(),
                  style: textStyleTitleSmall().copyWith(
                      fontWeight: FontWeight.w600,
                      fontSize: font_12,
                      color: Colors.black)),
            ]),
      ).marginOnly(top: margin_5);

  _otpTextFields() => Form(
        key: controller.otpFormGlobalKey,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        child: Pinput(
          validator: (String? data) {
            if (data!.isEmpty) {
              return strPleaseEnterOtp;
            }
          },
          errorBuilder: (String? errorText, String pin) {
            return Row(
              children: [
                Text(
                  errorText.toString(),
                  textAlign: TextAlign.start,
                  style: textStyleBodyMedium().copyWith(
                      color: Colors.red,
                      fontWeight: FontWeight.w600,
                      fontSize: font_11),
                ),
                Expanded(child: Container())
              ],
            ).paddingOnly(top: margin_10);
          },
          controller: controller.otpTextController,
          focusNode: controller.otpFocusNode,
          length: 4,
          cursor: Padding(
            padding: EdgeInsets.symmetric(vertical: margin_15),
            child: VerticalDivider(
              color: AppColors.appColor,
              thickness: margin_1point2,
            ),
          ),
          pinContentAlignment: Alignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          // androidSmsAutofillMethod: AndroidSmsAutofillMethod.smsUserConsentApi,
          // listenForMultipleSmsOnAndroid: true,
          keyboardType: TextInputType.number,
          inputFormatters: [
            FilteringTextInputFormatter.allow(RegExp("[0-9]")),
          ],
          defaultPinTheme: PinTheme(
            width: height_50,
            height: height_52,
            textStyle: textStyleBodyLarge().copyWith(color: Colors.black),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(radius_12),
              border: Border.all(color: Colors.grey, width: width_1),
              color: Colors.white,
            ),
          ),
          showCursor: true,
          isCursorAnimationEnabled: true,
          disabledPinTheme: PinTheme(
            width: height_50,
            height: height_52,
            textStyle: textStyleBodyLarge().copyWith(color: Colors.black),
            decoration: BoxDecoration(
              color: Colors.white,
            ),
          ),
          focusedPinTheme: PinTheme(
            width: height_50,
            height: height_52,
            textStyle: textStyleBodyLarge().copyWith(color: Colors.black),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(radius_12),
                border: Border.all(color: Colors.grey, width: width_1)),
          ),
          errorTextStyle: textStyleBodyMedium().copyWith(
              color: Colors.red,
              fontWeight: FontWeight.w600,
              fontSize: font_11),
          pinputAutovalidateMode: PinputAutovalidateMode.onSubmit,
        ).paddingOnly(bottom: margin_20, top: margin_20),
      );

  Widget _resendOtp() => Align(
        alignment: Alignment.centerLeft,
        child: Obx(
          () => Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              controller.start.value == 0
                  ? GetInkWell(
                      onTap: () {
                        controller.start.value = 30;
                        controller.startTimer();
                      },
                      child: TextView(
                          text: strResendCode,
                          textStyle: textStyleBodyLarge().copyWith(
                              fontSize: font_13,
                              color: Colors.black,
                              fontWeight: FontWeight.w600,
                              height: 1.5,
                              decoration: TextDecoration.underline)),
                    )
                  : SizedBox(),
              controller.start.value == 0 ? SizedBox() : _timerText(),
            ],
          ).paddingOnly(top: margin_5),
        ),
      );

  Widget _timerText() => Text.rich(
        TextSpan(
            text: strResendCodeIn,
            style: textStyleBodyLarge().copyWith(color: Colors.grey.shade700),
            children: [
              WidgetSpan(
                child: Obx(
                  () => TextView(
                      text: controller.secondsStr.value,
                      textStyle: textStyleTitleSmall().copyWith(
                        fontWeight: FontWeight.w600,
                        color: Colors.black,
                        fontSize: font_12,
                      )),
                ),
              )
            ]),
      );

  Widget _verifyButton() => SafeArea(
          child: MaterialButtonWidget(
        buttonBgColor: AppColors.appColor,
        onPressed: () {
          Get.toNamed(AppRoutes.profileSetupRoute);
        },
        buttonText: strVerify,
        textColor: Colors.white,
      )).marginOnly(bottom: margin_10);
}
