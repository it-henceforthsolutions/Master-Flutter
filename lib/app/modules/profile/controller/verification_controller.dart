


/*
 * @copyright : Henceforth Pvt. Ltd. <info@henceforthsolutions.com>
 * @author     : Gaurav Negi
 * All Rights Reserved.
 * Proprietary and confidential :  All information contained herein is, and remains
 * the property of Henceforth Pvt. Ltd. and its partners.
 * Unauthorized copying of this file, via any medium is strictly prohibited.
 *
 */

import 'package:engagely/app/core/base/base_controller.dart';
import 'package:engagely/app/modules/authentication/models/dataModel/forgot_module_data.dart';
import 'package:engagely/app/modules/authentication/models/responseModel/second_contact_Response_module.dart';

import '../../../export.dart';

class VerificationController extends GetxController {
  final GlobalKey<FormState> otpVerifyFormGlobalKey = GlobalKey<FormState>();

  TextEditingController otpTextController = TextEditingController();
  FocusNode otpFocusNode = FocusNode();

  final APIRepository _repository = Get.find<APIRepository>();
  final LocalStorage _LocalStorage = Get.find<LocalStorage>();
 // final SignUpController data=Get.find<SignUpController>();

  SecondContactResponseModel secondContactResponseModel = SecondContactResponseModel();
  LoginDataModel loginResponseModel = LoginDataModel();
  ForgotModuleData forgotModuleData=ForgotModuleData();


  Timer? timer;
  RxInt start = 30.obs;
  RxString secondsStr = '00:30'.obs;
  bool isFromForgot = false;
  String countryCode = "";
  String contactNumber = "";
  String emailTxt = "";
  String uniqueCode = "";
  bool? isFromSignup=false;

  @override
  void onInit() {

    getArguments();
    startTimer();
    update();
    super.onInit();
  }

  getArguments() {
    print("object");
    if (Get.arguments != null) {
     // if (Get.arguments[fromSignUp] != null) {
        uniqueCode =Get.arguments[uniqueCode11]??"";
        isFromForgot=Get.arguments[fromForgot];
        isFromSignup=Get.arguments[fromSignUp];
        emailTxt=Get.arguments[argEmail]??"";
        update();
        // print(emailTxt);
    //  }

    }
  }


  @override
  void onReady() {
    super.onReady();
  }

  void startTimer() {
    timer = new Timer.periodic(
      Duration(seconds: 1),
      (Timer timer) {
        if (start.value == 0) {
          timer.cancel();
        } else {
          start.value--;
          secondsStr.value = '00:' + (start.value).toString().padLeft(2, '0');
        }
      },
    );
  }

  hitOtpVerificationApiCall() {

    Map<String, dynamic> requestModel = AuthRequestModel.verifyOtpRequestModel(
       otp: int.parse(otpTextController.text.trim()),
    );
    //print('data od api${jsonEncode(requestModel)}');
    print("++++++++++++++++++");
    _repository.verifyOtpApiCall(dataBody: requestModel).then((value) async {
      if(value!=null){
        secondContactResponseModel = value;
        //print(object)
        saveDataToLocalStorage2(secondContactResponseModel);
        if (isFromSignup == true) {
          Get.toNamed(AppRoutes.secondaryContactRoute, arguments: {fromSignUp: true});}
        //  else {
        //   Get.toNamed(AppRoutes.setPasswordRoute);
        // }
      }
    }).onError((error, stackTrace) {
      showToast(message: error.toString());
    });
  }

  saveDataToLocalStorage2(SecondContactResponseModel? secondContactResponseModel) {
    _LocalStorage.saveAuthToken(secondContactResponseModel?.accessToken);
  }

  saveDataToLocalStorage(LoginDataModel? loginResponseModel) {
    _LocalStorage.saveAuthToken(loginResponseModel?.accessToken);
    //_LocalStorage.saveRegisterData(loginResponseModel?.detail);
  }

  hitResendOtpApiCall() {
    Map<String, dynamic> requestModel = AuthRequestModel.resendOtpRequestModel();
    _repository.resendOtpApiCall(dataBody: requestModel).then((value) async {
      if (value != null) {
        start.value = 30;
        startTimer();
        loginResponseModel = value;
        saveDataToLocalStorage(loginResponseModel);
       // print( saveDataToLocalStorage(loginResponseModel));
       // showToast(message: 'OTP: ${loginResponseModel.detail?.otp}');
      }
    }).onError((error, stackTrace) {
      showToast(message: error.toString());
    });
  }

  hitForgotResendOtpApiCall() {
    var forgotReq = AuthRequestModel.forgotPasswordRequestModel(
        email: emailTxt
    );
    _repository.forgotPasswordApiCall(dataBody: forgotReq).then((value) {
      if(value!=null) {
        start.value = 30;
        startTimer();
        forgotModuleData = value;
        uniqueCode=forgotModuleData.uniqueCode!;
        update();
        showToast(message: forgotModuleData.message,);
      }}).onError((error, stackTrace) {
      showToast(message: error.toString());
    });
  }
  hitOtpVerificationForgotApiCall() {

    Map<String, dynamic> requestModel = AuthRequestModel.verifyForgotOtpRequestModel(
      otp: int.parse(otpTextController.text.trim()),
      uniqueCode: uniqueCode,
    );
    //print('data od api${jsonEncode(requestModel)}');
    print("++++++++++++++++++");
    _repository.verifyForgotOtpApiCall(dataBody: requestModel).then((value) async {
      if(value!=null){
        forgotModuleData = value;
       Get.toNamed(AppRoutes.setPasswordRoute ,arguments: {uniqueCode11: forgotModuleData.uniqueCode??''});
      }
    }).onError((error, stackTrace) {
      showToast(message: error.toString());
    });
  }

  @override
  void onClose() {
    timer?.cancel();
    super.onClose();
  }
}
