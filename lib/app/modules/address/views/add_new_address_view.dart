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

class AddNewAddressView extends BaseView<AddNewAddressController> {
  AddNewAddressView({super.key});

  @override
  PreferredSizeWidget? appBar(BuildContext context) {
    return AppBarWidget(
      appBarTitleText:Get.arguments!=null?strEditAddress: strAddNewAddress,
      isCustom: false,
      bgColor: Colors.white,
      isbackIcon: true,
    );
  }



  @override
  Widget body(BuildContext context) {
    return Column(
      children: [
        _form(),
        _addAddressButton(),
      ],
    );
  }

  Widget _form() => Expanded(
        child: SingleChildScrollView(
          child: Form(
            key: controller.globalKey,
            child: Column(
              children: [
                _saveAddressTextField(),
                _houseTextField(),
                _areaTextField(),
                _cityEditText(),
                _stateDropDown(),
                _pinCodeEditText(),
                _countryDropDown(),
              ],
            ).paddingOnly(top: margin_20, bottom: margin_10,left: margin_15,right: margin_15),
          ),
        ),
      );

  Widget _saveAddressTextField() => TextFieldWidget(
        hint: strSaveAddressAs,
        textController: controller.saveAddressTextController,
        focusNode: controller.saveAddressFocusNode,
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

  Widget _houseTextField() => TextFieldWidget(
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

  Widget _areaTextField() => TextFieldWidget(
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

  Widget _cityEditText() => TextFieldWidget(
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

  Widget _stateDropDown() => DropDownTextFieldWidget(
        focusNode: controller.stateFocusNode,
        hint: strState,
        items: const <String>["Male", "Female", "Others"],
        dropdownType: true,
      ).paddingOnly(bottom: margin_15);

  Widget _pinCodeEditText() => TextFieldWidget(
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

  Widget _countryDropDown() => DropDownTextFieldWidget(
        focusNode: controller.cityFocusNode,
        hint: strCountry,
        items: const <String>["Male", "Female", "Others"],
        dropdownType: true,
      ).paddingOnly(bottom: margin_15);


  Widget _addAddressButton() =>  Container(decoration: BoxDecoration(
    color: Colors.white,
    boxShadow: [
      BoxShadow(
          color: Colors.grey.shade300,
          offset: const Offset(0.0, -1.0),
          blurRadius: 3.0//(x,y)
      ),
    ],
  ),
    padding: EdgeInsets.only(top: margin_10),
    child: MaterialButtonWidget(
      buttonBgColor: AppColors.appColor,
      onPressed: () {
        Get.back();
      },
      buttonText: Get.arguments!=null?strEditAddress:strAddAddress,textColor: Colors.white,
    ).paddingSymmetric(horizontal: margin_18,).marginOnly(bottom: margin_10),
  );

}
