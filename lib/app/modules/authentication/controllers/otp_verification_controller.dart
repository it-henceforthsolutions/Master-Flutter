/*
 * @copyright : Henceforth Pvt. Ltd. <info@henceforthsolutions.com>
 * @author     : Gaurav Negi
 * All Rights Reserved.
 * Proprietary and confidential :  All information contained herein is, and remains
 * the property of Henceforth Pvt. Ltd. and its partners.
 * Unauthorized copying of this file, via any medium is strictly prohibited.
 *
 */

import 'package:engagely/app/modules/authentication/models/dataModel/forgot_module_data.dart';

import '../../../export.dart';

class OtpVerificationController extends BaseController {
  final GlobalKey<FormState> otpFormGlobalKey = GlobalKey<FormState>();

  TextEditingController? otpTextController;
  FocusNode? otpFocusNode;

  final APIRepository _repository = Get.find<APIRepository>();
  final LocalStorage _localStorage = Get.find<LocalStorage>();

  LoginDataModel? loginDataModel = LoginDataModel();
  LoginResponseModel _loginResponseModel = LoginResponseModel();
  ForgotModuleData forgotModuleData = ForgotModuleData();

  Timer? timer;
  RxInt start = 30.obs;
  RxString secondsStr = '00:30'.obs;

  @override
  void onInit() {
    _getDataFromArguments();
    _initEditText();
    _initFocusNode();
    startTimer();
    update();
    super.onInit();
  }

  _getDataFromArguments() {
    if (Get.arguments != null) {
      loginDataModel = Get.arguments[dataKey];
    }
  }

  _initEditText() {
    otpTextController = TextEditingController();
  }

  _initFocusNode() {
    otpFocusNode = FocusNode();
  }

  void startTimer() {
    timer = Timer.periodic(
      const Duration(seconds: 1),
      (Timer timer) {
        if (start.value == 0) {
          timer.cancel();
        } else {
          start.value--;
          secondsStr.value = '00:${(start.value).toString().padLeft(2, '0')}';
        }
      },
    );
  }

  hitOtpVerificationApiCall() {
    showLoading();
    Map<String, dynamic> requestModel =
        AuthRequestModel.verifyPhoneRequestPayload(
            otp: otpTextController?.text ?? "",
            fcmToken: "",
            token: loginDataModel?.accessToken);
    _repository.verifyOtpApiCall(dataBody: requestModel).then((value) async {
      hideLoading();
      if (value != null) {
        _loginResponseModel = value;
        Get.offNamed(AppRoutes.profileSetupRoute);
        if (_loginResponseModel.data?.isPhoneVerified == true) {
          saveDataToLocalStorage(_loginResponseModel.data);
        }
      }
    }).onError((error, stackTrace) {
      hideLoading();
      showToast(message: error.toString());
    });
  }

  saveDataToLocalStorage(LoginDataModel? dataModel) {
    _localStorage.saveAuthToken(dataModel?.accessToken);
    _localStorage.saveRegisterData(dataModel);
  }

  hitResendOtpApiCall() {
    showLoading();

    Map<String, dynamic> requestModel = AuthRequestModel.loginRequestModel(
        countryCode: loginDataModel?.countryCode,
        phoneNumber: (loginDataModel?.phoneNo).toString());
    _repository.resendOtpApiCall(dataBody: requestModel).then((value) async {
      otpTextController?.clear();
     otpTextController?.text="";
      hideLoading();
      if (value != null) {
        _loginResponseModel = value;

        start.value = 30;
        startTimer();
      }
    }).onError((error, stackTrace) {
      hideLoading();
      showToast(message: error.toString());
    });
  }

  @override
  void onClose() {
    timer?.cancel();
    super.onClose();
  }
}
