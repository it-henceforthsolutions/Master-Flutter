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
import 'package:engagely/app/modules/profile/controller/verification_controller.dart';

import '../../../export.dart';

class VerificationView extends StatelessWidget {
  const VerificationView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<VerificationController>(
        init: VerificationController(),
        builder: (controller) {
          return _bodyView();
        });
  }

  Widget _bodyView() => Center(
        child: Container(
            padding: EdgeInsets.symmetric(horizontal: margin_20,vertical: margin_30),
            margin: EdgeInsets.symmetric(horizontal: margin_8),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(margin_15))),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                _headingTextView(),
                _descrptionTextView(),
                _otpTextFields(),
                _resendOtp(),
                _verifyButton(),
              ],
            )).paddingAll(margin_15),
      );

  Widget _headingTextView() => TextView(
        text: strVerfiyEmail,
        textStyle: textStyleHeadlineLarge()
            .copyWith(fontWeight: FontWeight.w600, fontSize: font_18),
      ).marginOnly(top: margin_5);

  Widget _descrptionTextView() => Text.rich(
        textAlign: TextAlign.center,
        TextSpan(
            text: strResendVerifcation,
            style: textStyleBodyLarge()
                .copyWith(color: Colors.grey.shade600, height: 1.5),
            children: [
              TextSpan(
                  text: " john567@gmail.com",
                  recognizer: TapGestureRecognizer()..onTap = () => Get.back(),
                  style: textStyleTitleSmall().copyWith(
                      fontWeight: FontWeight.w600,
                      fontSize: font_12,
                      color: Colors.black)),
            ]),
      ).marginOnly(top: margin_5);

  _otpTextFields() => GetBuilder<VerificationController>(builder: (controller) {
        return Form(
          key: controller.otpVerifyFormGlobalKey,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          child: Pinput(
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
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            // androidSmsAutofillMethod:
            //     AndroidSmsAutofillMethod.smsUserConsentApi,
            // listenForMultipleSmsOnAndroid: true,
            keyboardType: TextInputType.number,
            inputFormatters: [
              FilteringTextInputFormatter.allow(RegExp("[0-9]")),
            ],
            defaultPinTheme: PinTheme(
              width: height_50,
              height: height_52,
              textStyle: textStyleBodyLarge().copyWith(
                  color: Colors.black),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(radius_12),
                border: Border.all(
                    color: Colors.grey.shade300,
                    width: width_1),
                color: Colors.white,
              ),
            ),
            showCursor: true,
            isCursorAnimationEnabled: true,
            disabledPinTheme: PinTheme(
              width: height_50,
              height: height_52,
              textStyle: textStyleBodyLarge().copyWith(
                  color: Colors.black),
              decoration: BoxDecoration(
                color: Colors.white,
              ),
            ),
            focusedPinTheme: PinTheme(
              width: height_50,
              height: height_52,
              textStyle: textStyleBodyLarge().copyWith(
                  color:  Colors.black),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(radius_12),
                  border: Border.all(
                      color: Colors.grey,
                      width: width_1)),
            ),
            errorTextStyle: textStyleBodyMedium().copyWith(
                color: Colors.red,
                fontWeight: FontWeight.w600,
                fontSize: font_11),
            pinputAutovalidateMode: PinputAutovalidateMode.onSubmit,
          ).paddingOnly(bottom: margin_20, top: margin_20),
        );
      });

  Widget _resendOtp() =>
      GetBuilder<VerificationController>(builder: (controller) {
        return Obx(
          () => Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              controller.start.value == 0
                  ? GetInkWell(
                      onTap: () {
                        controller.isFromForgot == true
                            ? controller.hitForgotResendOtpApiCall()
                            : controller.hitResendOtpApiCall();
                      },
                      child: TextView(
                          text: strResendCode,
                          textStyle: textStyleBodyLarge().copyWith(
                              fontSize: font_13,
                              color:  Colors.black,
                              fontWeight: FontWeight.w500,
                              height: 1.5,
                              decoration: TextDecoration.underline)),
                    )
                  : SizedBox(),
              controller.start.value == 0 ? SizedBox() : _timerText(),
            ],
          ).paddingOnly(top: margin_5),
        );
      });

  Widget _timerText() =>
      GetBuilder<VerificationController>(builder: (controller) {
        return Text.rich(
          TextSpan(
              text: strResendCodeIn,
              style: textStyleBodyLarge().copyWith(color: Colors.grey.shade700),
              children: [
                WidgetSpan(
                  child: Obx(
                    () => TextView(
                        text: controller.secondsStr.value,
                        textStyle: textStyleTitleSmall().copyWith(
                          height: 1.5,
                          fontWeight: FontWeight.w500,
                          color:Colors.black,
                          fontSize: font_12,
                        )),
                  ),
                )
              ]),
        );
      });

  Widget _verifyButton() => MaterialButtonWidget(
        buttonBgColor: AppColors.appColor,
        onPressed: () {
         Get.back(result: true);
        },
        buttonText: strVerify,
        textColor: Colors.white,
      ).marginOnly(top: margin_25);
}
