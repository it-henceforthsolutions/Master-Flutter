import 'package:engagely/app/core/widget/app_bar_widget.dart';
import 'package:engagely/app/modules/settings/controller/contact_us_controller.dart';

import '../../../export.dart';

class ContactUsView extends BaseView<ContactUsController> {
  ContactUsView({super.key});

  @override
  PreferredSizeWidget? appBar(BuildContext context) {
    return AppBarWidget(
      appBarTitleText: strContactUs,
      isCustom: false,
      bgColor: Colors.white,
      isbackIcon: true,
    );
  }

  @override
  Widget body(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [_form(), _continueButton()],
    );
  }

  Widget _form() => Expanded(
        child: Form(
          key: controller.formGlobalKey,
          child: Column(
            children: [
              _nameTextField(),
              _emailTextField(),
              _subjectTextField(),
              _descrptionEditText(),
            ],
          ).paddingOnly(
              top: margin_20,
              bottom: margin_10,
              left: margin_15,
              right: margin_15),
        ),
      );

  _nameTextField() => TextFieldWidget(
        hint: strName,
        textController: controller.firstNameTextController,
        focusNode: controller.firstNameFocusNode,
        inputType: TextInputType.name,
        inputAction: TextInputAction.next,
        formatter: [
          FilteringTextInputFormatter.allow(RegExp('[a-zA-Z]')),
        ],
        validate: (String? value) {
          return FieldChecker.fieldChecker(
              value: value?.trim() ?? "", message: strName);
        },
      ).paddingOnly(bottom: margin_15);

  _emailTextField() => TextFieldWidget(
        hint: strEmail,
        textController: controller.emailEditTextController,
        focusNode: controller.emailFocusNode,
        inputType: TextInputType.emailAddress,
        inputAction: TextInputAction.next,
        validate: (String? value) {
          return FieldChecker.fieldChecker(
              value: value?.trim() ?? "", message: strEmail);
        },
      ).paddingOnly(bottom: margin_15);

  Widget _subjectTextField() => TextFieldWidget(
        hint: strSubject,
        textController: controller.mobileTextController,
        focusNode: controller.mobileNumberFocusNode,
        formatter: [
          FilteringTextInputFormatter.allow(RegExp('[0-9]')),
        ],
        validate: (data) => PhoneNumberValidate.validateMobile(data),
        inputType: TextInputType.phone,
        maxLength: 15,
        inputAction: TextInputAction.next,
      ).paddingOnly(bottom: margin_15);

  Widget _descrptionEditText() => TextFieldWidget(
        hint: strDescriptionn,
        maxLines: 6,
        minLine: 5,
        textController: controller.descrptionEditTextController,
        focusNode: controller.descrptionFocusNode,
        inputType: TextInputType.multiline,
        inputAction: TextInputAction.newline,
        validate: (String? value) {
          return FieldChecker.fieldChecker(
              value: value?.trim() ?? "", message: strDescription);
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
      padding: EdgeInsets.only(
          top: margin_10, left: margin_18, right: margin_18, bottom: margin_5),
      child: MaterialButtonWidget(
        onPressed: () {
          Get.back();
        },
        textColor: Colors.white,
        buttonText: strSubmit,
        buttonBgColor: AppColors.appColor,
      ));
}
