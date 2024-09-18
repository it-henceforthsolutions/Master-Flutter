/*
 * @copyright : Henceforth Pvt. Ltd. <info@henceforthsolutions.com>
 * @author     : Gaurav Negi
 * All Rights Reserved.
 * Proprietary and confidential :  All information contained herein is, and remains
 * the property of Henceforth Pvt. Ltd. and its partners.
 * Unauthorized copying of this file, via any medium is strictly prohibited.
 *
 */

import 'package:engagely/app/export.dart';
import 'package:engagely/app/modules/authentication/controllers/add_address_controller.dart';
import 'package:engagely/app/modules/authentication/widgets/auth_base_view.dart';


class AddAddressView extends GetView<AddAddressController> {
  final GlobalKey<FormState> profileSetupFormGlobalKey = GlobalKey<FormState>();


  @override
  Widget build(BuildContext context) {
    return AuthBaseView(
      isBackButton: false,isSkipButton: true,
      onSkipPressed: () {
        Get.toNamed(AppRoutes.chooseYourIntersetView);
      },
      bodyWidget: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(child: SingleChildScrollView(child: Column(crossAxisAlignment: CrossAxisAlignment.start,
              children: [
            _headingTextView(),
            _descrptionTextView(),
            _form(),
          ]).paddingAll(margin_15),)),
          _addAddressButton()
        ],
      ),
    );
  }

  Widget _headingTextView() => TextView(
    text: strAddAddress,
    textStyle: textStyleHeadlineLarge().copyWith(fontWeight: FontWeight.w600),
  ).marginOnly(top: margin_5);

  Widget _descrptionTextView() => TextView(
    text: strAddAddressDes,
    maxLines: 2,
    textStyle: textStyleBodyLarge()
        .copyWith(color: AppColors.greyLightColor, height: 1.5),
  ).marginOnly(top: margin_5);


  _form() => Form(
    key: profileSetupFormGlobalKey,
    child: Column(
      children: [
        _houseTextField(),
        _areaTextField(),
        _cityEditText(),
        _stateDropDown(),
        _pinCodeEditText(),
        _countryDropDown(),
      ],
    ).paddingOnly(top: margin_20, bottom: margin_10),
  );

  _houseTextField() => TextFieldWidget(
    hint: strHouseFlat,
    textController: controller.houseTextController,
    focusNode: controller.houseFocusNode,
    inputType: TextInputType.name,
    inputAction: TextInputAction.next,
    formatter: [
      FilteringTextInputFormatter.allow(RegExp('[a-zA-Z]')),
    ],
    validate: (String? value) {
      return FieldChecker.fieldChecker(
          value: value?.trim() ?? "", message: strHouseFlat);
    },
  ).paddingOnly(bottom: margin_15);

  _areaTextField() => TextFieldWidget(
    hint: strArea,
    textController: controller.areaEditTextController,
    focusNode: controller.areaFocusNode,
    inputType: TextInputType.emailAddress,
    inputAction: TextInputAction.next,
    validate: (String? value) {
      return FieldChecker.fieldChecker(
          value: value?.trim() ?? "", message: strArea);
    },
  ).paddingOnly(bottom: margin_15);

  _cityEditText() => TextFieldWidget(
    hint: strCity,
    textController: controller.cityEditTextController,
    focusNode: controller.cityFocusNode,
    inputType: TextInputType.text,
    inputAction: TextInputAction.next,
    validate: (String? value) {
      return FieldChecker.fieldChecker(
          value: value?.trim() ?? "", message: strCity);
    },
  ).paddingOnly(bottom: margin_15);



  _stateDropDown() => DropDownTextFieldWidget(focusNode: controller.stateFocusNode,
    hint: strState,
    items: const <String>["Male", "Female", "Others"],
    dropdownType: true,
  ).paddingOnly(bottom: margin_15);

  _pinCodeEditText() => TextFieldWidget(
    hint: strPincode,
    textController: controller.pincodeEditTextController,
    focusNode: controller.pincodeFocusNode,
    inputType: TextInputType.number,
    inputAction: TextInputAction.next,
    validate: (String? value) {
      return FieldChecker.fieldChecker(
          value: value?.trim() ?? "", message: strPincode);
    },
  ).paddingOnly(bottom: margin_15);

  _countryDropDown() => DropDownTextFieldWidget(focusNode: controller.cityFocusNode,
    hint: strCountry,
    items: const <String>["Male", "Female", "Others"],
    dropdownType: true,
  ).paddingOnly(bottom: margin_15);



  Widget _addAddressButton() => SafeArea(top: false,
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
      buttonText: strAddAddress,buttonBgColor: AppColors.appColor,
    ).marginSymmetric(horizontal: margin_15)).marginOnly(bottom: margin_10),
  );
}
