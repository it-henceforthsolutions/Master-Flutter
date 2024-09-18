/*
 * @copyright : Henceforth Pvt. Ltd. <info@henceforthsolutions.com>
 * @author     : Gaurav Negi
 * All Rights Reserved.
 * Proprietary and confidential :  All information contained herein is, and remains
 * the property of Henceforth Pvt. Ltd. and its partners.
 * Unauthorized copying of this file, via any medium is strictly prohibited.
 *
 */

import 'package:engagely/app/core/widget/intl_phone_field/countries.dart';
import 'package:engagely/app/export.dart';

class LoginController extends BaseController {
  GlobalKey<FormState> formState = GlobalKey<FormState>();
  Rx<Country> selectedCountry = const Country(
    name: "India",
    nameTranslations: {},
    flag: "🇮🇳",
    code: "IN",
    dialCode: "91",
    minLength: 10,
    maxLength: 10,
  ).obs;
  TextEditingController mobileTextController = TextEditingController();
  FocusNode mobileNumberFocusNode = FocusNode();
  final LocalStorage _LocalStorage = Get.find<LocalStorage>();
  final APIRepository _apiRepository = Get.find<APIRepository>();

  LoginResponseModel loginResponseModel = LoginResponseModel();

  @override
  void onInit() {
    initEditTextController();
    initFocusNodes();
    super.onInit();
  }

  initEditTextController() {
    mobileTextController = TextEditingController();
  }

  initFocusNodes() {
    mobileNumberFocusNode = FocusNode();
  }

  @override
  void onReady() {

    super.onReady();
  }

  void loginAction() {
    if (formState.currentState!.validate()) {
      hitLoginApiCall();
    }
  }

  /*===================================================================== Login API Call  ==========================================================*/

  hitLoginApiCall() {
    showLoading();
    Map<String, dynamic> requestModel = AuthRequestModel.loginRequestModel(
        phoneNumber: mobileTextController.text.trim(),
        countryCode: selectedCountry.value.fullCountryCode);
    _apiRepository.loginApiCall(dataBody: requestModel).then((value) async {
      hideLoading();
      if (value != null) {
        loginResponseModel = value;
        loginResponseModel.data?.phoneNo=int.parse(mobileTextController.text.trim());
        loginResponseModel.data?.countryCode=selectedCountry.value.fullCountryCode;
        Get.toNamed(AppRoutes.otpVerificationRoute,
            arguments: {dataKey: loginResponseModel.data});
      }
    }).onError((error, stackTrace) {
      hideLoading();
      showToast(message: error.toString());
    });
  }

  @override
  void dispose() {
    mobileTextController.dispose();
    mobileNumberFocusNode.dispose();
    super.dispose();
  }
}
