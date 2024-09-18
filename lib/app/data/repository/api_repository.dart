/*
 * @copyright : Henceforth Pvt. Ltd. <info@henceforthsolutions.com>
 * @author     : Gaurav Negi
 * All Rights Reserved.
 * Proprietary and confidential :  All information contained herein is, and remains
 * the property of Henceforth Pvt. Ltd. and its partners.
 * Unauthorized copying of this file, via any medium is strictly prohibited.
 *
 */

import 'package:engagely/app/modules/authentication/models/responseModel/new_model.dart';
import 'package:engagely/app/modules/authentication/models/responseModel/save_data_update_model.dart';
import 'package:engagely/app/modules/authentication/models/responseModel/second_contact_Response_module.dart';
import 'package:engagely/app/modules/authentication/models/responseModel/service_daa_module.dart';
import 'package:http_parser/http_parser.dart';

import '../../export.dart';
import '../../modules/authentication/models/dataModel/forgot_module_data.dart';
import '../../modules/authentication/models/dataModel/location_data_module.dart';
import '../../modules/authentication/models/responseModel/image_data_response_module.dart';
class APIRepository {
  static late DioClient? dioClient;
  var deviceName, deviceType, deviceID, deviceVersion;

  APIRepository() {
    var dio = Dio();
    dioClient = DioClient(baseUrl, dio);
    getDeviceData();
  }

  getDeviceData() async {
    DeviceInfoPlugin info = DeviceInfoPlugin();
    if (Platform.isAndroid) {
      AndroidDeviceInfo androidDeviceInfo = await info.androidInfo;
      deviceName = "ANDROID"; /* androidDeviceInfo.model;*/
      deviceID = androidDeviceInfo.id;
      deviceVersion = androidDeviceInfo.version.release;
      deviceType = "1";
    } else if (Platform.isIOS) {
      IosDeviceInfo iosDeviceInfo = await info.iosInfo;
      deviceName = iosDeviceInfo.systemName;
      deviceID = iosDeviceInfo.identifierForVendor;
      deviceVersion = iosDeviceInfo.systemVersion;
      deviceType = "2";
    }
  }


  /*===================================================================== Second Contact API Call  ==========================================================*/

  Future secondContactApiCall({required Map<String, dynamic>? dataBody}) async {
    try {
      final response = await dioClient!.post(secondContactEndPoint,
          skipAuth: false, data: jsonEncode(dataBody!));
      return LoginDataModel.fromJson(response);
    } catch (e) {
      return Future.error(NetworkExceptions.getDioException(e));
    }
  }
  /*===================================================================== Location API Call  ==========================================================*/

  Future<List<Area>> locationApiCall() async {
    try {
      final response = await dioClient!.get(
        locationEndPoint,
        skipAuth: false,
      );
     // print("8374374837${response['data']}");
      List<Area> detail = [];
    //  print("8374374837$response");

      final areas = response['data'];
         for (var area in areas) {
           detail.add(Area.fromJson(area));
        }
       return detail;
    } catch (e) {
      return Future.error(NetworkExceptions.getDioException(e));
    }
  }
  /*=====================================================================  Add Location API Call  ==========================================================*/

  Future addLocationApiCall({ Map<String, dynamic>? dataBody}) async {
    try {
      final response = await dioClient!.post(
        addLocationEndPoint,
        skipAuth: false,
          data: jsonEncode(dataBody!)
      );
      return LoginDataModel.fromJson(response);
    } catch (e) {
      return Future.error(NetworkExceptions.getDioException(e));
    }
  }
  /*=====================================================================  Add Service API Call  ==========================================================*/

  Future addServiceApiCall({ Map<String, dynamic>? dataBody}) async {
    try {
      final response = await dioClient!.post(
          adServicesEndPoint,
          skipAuth: false,
          data: jsonEncode(dataBody!)
      );
      return  response;
    } catch (e) {
      return Future.error(NetworkExceptions.getDioException(e));
    }
  }

  /*====================================================================== Get Services ============================================*/

  Future getServicesList() async {
    try {
      final response = await dioClient!
          .get(getVendorServicesEndPoint, skipAuth: false);
      return AddServices.fromJson(response);
    } catch (e) {
      return Future.error(NetworkExceptions.getDioException(e));
    }
  }
  /*====================================================================== Get the other document list  ============================================*/

  Future getOtherDocsList() async {
    try {
      final response = await dioClient!
          .get(getOtherDocListEndPoint, skipAuth: false);
      return Getotherdoclist.fromJson(response);
    } catch (e) {
      return Future.error(NetworkExceptions.getDioException(e));
    }
  }
/*===================================================================== Login API Call  ==========================================================*/
  Future loginApiCall({Map<String, dynamic>? dataBody}) async {
    try {
      final response = await dioClient!
          .post(loginEndPoint, data: json.encode(dataBody!));
      return LoginResponseModel.fromJson(response);
    } catch (e) {
      return Future.error(NetworkExceptions.getDioException(e));
    }
  }
  /*===================================================================== Get Profile API Call  ==========================================================*/

  Future getProfileApiCall() async {
    try {
      final response = await dioClient!.get(
        getProfileEndPoint,
        skipAuth: false,
      );
        return LoginDataModel.fromJson(response);
      }
     catch (e) {
      return Future.error(NetworkExceptions.getDioException(e));
    }
  }
  /*===================================================================== ProfileCompletion  API Call  ==========================================================*/

  Future profileCompletionApiCall(
      {required Map<String, dynamic>? dataBody}) async {
    try {
      final response = await dioClient!
          .post(profileCompletionEndPoint, data: jsonEncode(dataBody!),
          skipAuth: false);
      return ProfieCompeletionModel.fromJson(response);
    } catch (e) {
      return Future.error(NetworkExceptions.getDioException(e));
    }
  }
  /*===================================================================== Forgot password API Call  ==========================================================*/
  Future forgotPasswordApiCall(
      {required Map<String, dynamic>? dataBody}) async {
    try {
      final response = await dioClient!
          .put(forgotEndPoint, data: jsonEncode(dataBody!));
      return ForgotModuleData.fromJson(response);
    } catch (e) {
      return Future.error(NetworkExceptions.getDioException(e));
    }
  }
  /*=====================================================================LogOut API Call  ==========================================================*/
  Future logOutApiCall(
      {required Map<String, dynamic>? dataBody}) async {
    try {
      final response = await dioClient!
          .put(logoutEndPoint,skipAuth: false, data: jsonEncode(dataBody!));
      return LoginDataModel.fromJson(response);
    } catch (e) {
      return Future.error(NetworkExceptions.getDioException(e));
    }
  }

  /*=====================================================================  change Number API Call  ==========================================================*/
  Future changeNumberApiCall(
      {required Map<String, dynamic>? dataBody}) async {
    try {
      final response = await dioClient!
          .put(changePhoneNumberEndPoint,skipAuth: false, data: jsonEncode(dataBody!));
      return LoginDataModel.fromJson(response);
    } catch (e) {
      return Future.error(NetworkExceptions.getDioException(e));
    }
  }
  /*=====================================================================  change Image & Name API Call  ==========================================================*/
  Future changeNameImageApiCall(
      {required Map<String, dynamic>? dataBody}) async {
    try {
      final response = await dioClient!
          .put(changeNameImageEndPoint,skipAuth: false, data: jsonEncode(dataBody!));
      return LoginDataModel.fromJson(response["data"]);
    } catch (e) {
      return Future.error(NetworkExceptions.getDioException(e));
    }
  }
/*===================================================================== Verify OTP API Call  ==========================================================*/
  Future verifyOtpApiCall(
      {required Map<String, dynamic>? dataBody, type}) async {
    try {
      final response = await dioClient!.put(verifyPhoneEndPoint,
          skipAuth: false,data: json.encode(dataBody!));
      return LoginResponseModel.fromJson(response);
    } catch (e) {
      return Future.error(NetworkExceptions.getDioException(e));
    }
  }
  /*===================================================================== Verify OTP phone after login API Call  ==========================================================*/
  Future verifyOtpPhoneApiCall(
      {required Map<String, dynamic>? dataBody, type}) async {
    try {
      final response = await dioClient!.put(pgoneOtpVerifyEndPoint,
          skipAuth: false,
          data: jsonEncode(dataBody!));
      return true;
    } catch (e) {
      return Future.error(NetworkExceptions.getDioException(e));
    }
  }
  /*===================================================================== Verify Forgot OTP API Call  ==========================================================*/
  Future verifyForgotOtpApiCall(
      {required Map<String, dynamic>? dataBody, type}) async {
    try {
      final response = await dioClient!.put(
        skipAuth: true,
          verifyForgotOtpEndPoint,
           data: jsonEncode(dataBody!));
      return ForgotModuleData.fromJson(response);
    } catch (e) {
      return Future.error(NetworkExceptions.getDioException(e));
    }
  }
/*===================================================================== NewPassword API Call  ==========================================================*/
  Future newPasswordApiCall({required Map<String, dynamic>? dataBody}) async {
    try {
      final response = await dioClient!.post(newPasswordOtpEndPoint,
          data: jsonEncode(dataBody!));
      return LoginDataModel.fromJson(response);
    } catch (e) {
      return Future.error(NetworkExceptions.getDioException(e));
    }
  }

/*===================================================================== Resend OTP API Call  ==========================================================*/
  Future resendOtpApiCall({required Map<String, dynamic>? dataBody}) async {
    try {
      final response = await dioClient!.post(resendOtpEndPoint,
          skipAuth: false, data: jsonEncode(dataBody!));
      return LoginResponseModel.fromJson(response);
    } catch (e) {
      return Future.error(NetworkExceptions.getDioException(e));
    }
  }

  /*====================================================================== change Password  ============================================*/

  Future changePasswordApiCall(
      {required Map<String, dynamic>? dataBody}) async {
    try {
      final response = await dioClient!.put(changePasswordEndPoint,
          skipAuth: false, data: jsonEncode(dataBody!));
      return MessageResponseModel.fromJson(response);
    } catch (e) {
      return Future.error(NetworkExceptions.getDioException(e));
    }
  }

  // /*====================================================================== update Profile  ============================================*/
  //
  // Future updateProfileApiCall({required Map<String, dynamic>? dataBody}) async {
  //   try {
  //     final response = await dioClient!.post(updateProfileEndPoint,
  //         skipAuth: false, data: FormData.fromMap(dataBody!));
  //     return LoginDataModel.fromJson(response);
  //   } catch (e) {
  //     return Future.error(NetworkExceptions.getDioException(e));
  //   }
  // }

  //*====================================================================== update files to the server  Profile - completion  ============================================*/


  uploadImageApi(file, fileName, String mediaType, String ext) async {
    try{
      FormData formData = FormData.fromMap({
        "file": await MultipartFile.fromFile(file.path,
            filename: fileName, contentType: MediaType(mediaType, ext))
      });
      var response = await dioClient!.post(
        uploadProfileEndPoint,
        data: formData,
      );
      print(
          "++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++$response");
      return ImageData.fromJson(response);

    } catch(e){
      return Future.error(NetworkExceptions.getDioException(e));
    }
  }

}
