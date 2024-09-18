/*
 * @copyright : Henceforth Pvt. Ltd. <info@henceforthsolutions.com>
 * @author     : Gaurav Negi
 * All Rights Reserved.
 * Proprietary and confidential :  All information contained herein is, and remains
 * the property of Henceforth Pvt. Ltd. and its partners.
 * Unauthorized copying of this file, via any medium is strictly prohibited.
 *
 */

import 'package:engagely/app/core/values/app_constants.dart';
import 'package:get/get_connect/http/src/multipart/multipart_file.dart';
import 'package:get/get_utils/get_utils.dart';

class AuthRequestModel {

/*==================================================Login Request Model==============================================*/
  static loginRequestModel({
    required String? countryCode,
    required String phoneNumber,
  }) {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["country_code"] = countryCode;
    data["phone_no"] = int.parse(phoneNumber);

    return data;
  }

  /*==================================================Phone Verify Request Model==============================================*/
  static verifyPhoneRequestPayload({
    required String? token,
    required String otp,
    required String fcmToken,
  }) {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["token"] = token;
    data["otp"] = int.parse(otp);
    data["fcm_token"] = fcmToken;
    data["device_type"] =
        GetPlatform.isAndroid ? deviceTypeAndroid : deviceTypeIOS;

    return data;
  }


  /*==================================================phoneNumber Change Request Model==============================================*/
  static editProfileRequestPayload({
    required String? name,
    required String? bio,
    required String? email,
    required String? profilePic,
    required String? dob,
    required dynamic? interestList,
  }) {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["name"] = name;
    data["bio"] = bio;
    data["email"] = email;
    data["profile_pic"] = profilePic;
    data["dob"] = dob;
    if(interestList.length!=0)
    data["interest"] = dob;
    return data;
  }

  /*=================================================== Profile Completion Model==============================================*/
  static profileCompletionApiCall({
    String? description,
    String? tradeLicence,
    String? insurance,
    String? vat,
    String? otherDoc,
    String? documentId,
  }) {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['description'] = description;
    data['trade_license'] = tradeLicence;
    data['insurance'] = insurance;
    data['vat'] = vat;
    data['other_doc'] = otherDoc;
    data['document_id'] = documentId;
    return data;
  }

/*==================================================LogOut Request Model==============================================*/
  static logOutRequestModel() {
    final Map<String, dynamic> data = <String, dynamic>{};
    return data;
  }

  /*================================================== Get Profile Request Model==============================================*/
  static getProfileRequestModel() {
    final Map<String, dynamic> data = <String, dynamic>{};
    return data;
  }
/*================================================== Get Location  Request Model==============================================*/

  static locationRequestModel() {
    final Map<String, dynamic> data = <String, dynamic>{};
    return data;
  }
  /*================================================== Get services  Request Model==============================================*/

  static servicesRequestModel() {
    final Map<String, dynamic> data = <String, dynamic>{};
    return data;
  }
  /*================================================== Add Location  Request Model==============================================*/

  static addLocationRequestModel({
    String? cityId,
    List? areaId,
  }) {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["city_id"] = cityId;
    data["area_id"] = areaId;
    return data;
  }
  /*================================================== Add Services  Request Model==============================================*/

/*  static Map<String, dynamic> addServicesRequestModel({  List<String>? service}) {
    final Map<String, dynamic> data =<String, dynamic> {};
    data["services"]=service;
    return data;
  }*/

  static Map<String, dynamic> addServicesRequestModel(
      {List<Map<String, dynamic>>? service}) {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["services"] = service;
    return data;
  }

  // static Map<String, dynamic> addServicesRequestModel({
  //   String? serviceId,
  //   List<String>? subServiceIds,
  // }) {
  //   final Map<String, dynamic> data = <String, dynamic>{};
  //   data["services"] = [
  //     {
  //       "service_id": serviceId,
  //       "sub_service_ids": subServiceIds,
  //     }
  //   ];
  //   return data;
  // }

/*==================================================Forgot Password Request Model==============================================*/
  static forgotPasswordRequestModel({
    String? email,
  }) {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["email"] = email;
    return data;
  }

/*==================================================Verify Otp Request Model==============================================*/
  static verifyOtpRequestModel({
    required int? otp,
  }) {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["otp"] = otp;
    return data;
  }

  /*==================================================New Password Request Model==============================================*/
  static newPasswordRequestModel({
    required String? uniqueCode,
    required String? password,
  }) {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["unique_code"] = uniqueCode;
    data["password"] = password;
    return data;
  }

/*==================================================Verify Forgot Otp Request Model==============================================*/
  static verifyForgotOtpRequestModel({
    String? uniqueCode,
    required int? otp,
  }) {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["unique_code"] = uniqueCode;
    data["otp"] = otp;
    return data;
  }

  /*==================================================add Name Image Request Model==============================================*/
  static addNameImageRequestModel({
    String? image,
    String? name,
  }) {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["image"] = image;
    data["name"] = name;
    return data;
  }
/*==================================================Resend Otp Request Model==============================================*/

  static resendOtpRequestModel() {
    final Map<String, dynamic> data = <String, dynamic>{};
    //data["User[country_code]"] = countryCode;
    return data;
  }

/*====================================================change password Request Model====================================*/

  static changePasswordRequestModel(
      {required String oldPassword, newPassword}) {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["old_password"] = oldPassword;
    data["new_password"] = newPassword;

    return data;
  }

  /*===================================================Profile creation Request Model==============================================*/

  static profileRequestModel({
    MultipartFile? profileFile,
    required String? firstName,
    required String? lastName,
    required String? address,
    required String? latitude,
    required String? longitude,
  }) {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["User[profile_file]"] = profileFile;
    data["User[first_name]"] = firstName;
    data["User[last_name]"] = lastName;
    data["User[address]"] = address;
    data["User[latitude]"] = latitude;
    data["User[longitude]"] = longitude;

    return data;
  }

/*====================================================change password Request Model====================================*/

  static contactUsRequestModel({
    required String name,
    required String email,
    required String contact,
    required String description,
  }) {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["Information[full_name]"] = name;
    data["Information[email]"] = email;
    data["Information[mobile]"] = contact;
    data["Information[description]"] = description;
    return data;
  }

  /*==================================================== Book Ride Request Model====================================*/

  static bookRideRequestModel({
    String? pickUp,
    var pickUpLat,
    var pickUpLong,
    String? destination,
    var destinationLong,
    var destinationLat,
    var carTypeId,
    var estimatedAmount,
    String? estimateTime,
    String? pickUpTime,
    var totalKm,
    var scheduleDuration,
    var paymentType,
    var addStops,
    var driverId,
  }) {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["Ride[pickup]"] = pickUp;
    data["Ride[pickup_lat]"] = pickUpLat;
    data["Ride[pickup_long]"] = pickUpLong;
    data["Ride[destination]"] = destination;
    data["Ride[destination_long]"] = destinationLong;
    data["Ride[destination_lat]"] = destinationLat;
    data["Ride[car_type_id]"] = carTypeId;
    data["PriceDetail[estimated_amount]"] = estimatedAmount;
    data["Ride[estimate_time]"] = estimateTime;
    data["Ride[pickup_time]"] = pickUpTime;
    data["Ride[total_km]"] = totalKm;
    data["Ride[schedule_duration]"] = scheduleDuration;
    data["Ride[payment_type]"] = paymentType;
    data["Ride[stops]"] = addStops;
    data["Ride[driver_id]"] = driverId;
    return data;
  }

/*==================================================Social Login Request ==============================================*/

  static socialLoginRequestModel(
      {var userId,
      var email,
      var fullName,
      var username,
      var provider,
      var imgUrl,
      var deviceToken,
      var deviceType,
      var deviceName}) {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['User[userId]'] = userId;
    data['User[email]'] = email;
    data['User[full_name]'] = fullName;
    data['LoginForm[username]'] = username;
    data['LoginForm[provider]'] = provider;
    data['LoginForm[device_token]'] = deviceToken;
    data['LoginForm[device_type]'] = deviceType;
    data['LoginForm[device_name]'] = deviceName;
    data['img_url'] = imgUrl;

    return data;
  }

  static logCrashErrorReq({
    error,
    packageVersion,
    phoneModel,
    ip,
    stackTrace,
  }) {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Log[error]'] = error;
    data['Log[link]'] = packageVersion;
    data['Log[referer_link]'] = phoneModel;
    data['Log[user_ip]'] = ip;
    data['Log[description]'] = stackTrace;
    return data;
  }

  /*====================================================Schedule Ride Request Model====================================*/

  static scheduleRideRequestModel({
    String? pickUpLocation,
    String? destination,
    var destinationLong,
    var destinationLat,
    var pickUpLat,
    var pickUpLong,
    var carTypeId,
    var estimatedAmount,
    var finalAmount,
    String? estimateTime,
    String? pickUpTime,
    var totalKm,
    String? scheduleDuration,
    var paymentType,
    var discount,
    var promoCodeId,
    var typeId,
    var driverId,
  }) {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["Ride[pickup_location]"] = pickUpLocation;
    data["Ride[destination]"] = destination;
    data["Ride[destination_long]"] = destinationLong;
    data["Ride[destination_lat]"] = destinationLat;
    data["Ride[pickup_lat]"] = pickUpLat;
    data["Ride[pickup_long]"] = pickUpLong;
    data["Ride[car_type_id]"] = carTypeId;
    data["Ride[estimated_amount]"] = estimatedAmount;
    data["Ride[final_amount]"] = finalAmount;
    data["Ride[estimate_time]"] = estimateTime;
    data["Ride[pickup_time]"] = pickUpTime;
    data["Ride[total_km]"] = totalKm;
    data["Ride[schedule_duration]"] = scheduleDuration;
    data["Ride[payment_type]"] = paymentType;
    data["Ride[discount]"] = discount;
    data["Ride[promo_code_id]"] = promoCodeId;
    data["Ride[type_id]"] = typeId;
    data["Ride[driver_id]"] = driverId;
    return data;
  }

  /*====================================================Add Address Request Model====================================*/

  static addAddressRequestModel({
    String? name,
    var country,
    String? state,
    var zipCode,
    var addressOne,
    var latitudeOne,
    var longitudeOne,
    String? typeId,
    var anyOtherName,
  }) {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["UserAddress[name]"] = name;
    data["UserAddress[country]"] = country;
    data["UserAddress[state]"] = state;
    data["UserAddress[zipcode]"] = zipCode;
    data["UserAddress[address_one]"] = addressOne;
    data["UserAddress[latitude_one]"] = latitudeOne;
    data["UserAddress[longitude_one]"] = longitudeOne;
    data["UserAddress[type_id]"] = typeId;
    data["UserAddress[other]"] = anyOtherName;
    return data;
  }

  /*====================================================Send Message Request Model====================================*/

  static sendMessageReq({
    String? message,
    int? toId,
    int? rideId,
  }) {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Chat[message]'] = message;
    data['Chat[to_id]'] = toId;
    data['Chat[ride_id]'] = rideId;
    return data;
  }
  /*====================================================Send Courier Request Model====================================*/

  static sendCourierReq({
    String? pickUp,
    String? destination,
    var destinationLong,
    var destinationLat,
    var pickUpLat,
    var pickUpLong,
    int? carTypeId,
    String? estimateTime,
    String? pickUpTime,
    var totalKm,
    var totalMin,
    int? deliveryTypeId,
    String? length,
    String? height,
    String? weight,
    String? width,
    String? quantity,
    String? description,
  }) {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Ride[pickup]'] = pickUp;
    data['Ride[destination]'] = destination;
    data['Ride[destination_long]'] = destinationLong;
    data['Ride[destination_lat]'] = destinationLat;
    data['Ride[pickup_lat]'] = pickUpLat;
    data['Ride[pickup_long]'] = pickUpLong;
    data['Ride[car_type_id]'] = carTypeId;
    data['Ride[estimate_time]'] = estimateTime;
    data['Ride[pickup_time]'] = pickUpTime;
    data['Ride[total_km]'] = totalKm;
    data['Ride[total_min]'] = totalMin;
    data['CourierDetail[delivery_type_id]'] = deliveryTypeId;
    data['CourierDetail[length]'] = length;
    data['CourierDetail[height]'] = height;
    data['CourierDetail[weight]'] = weight;
    data['CourierDetail[width]'] = width;
    data['CourierDetail[quantity]'] = quantity;
    data['CourierDetail[description]'] = description;
    return data;
  }

  /*===================================================Add Rating Request Model==============================================*/

  static addRatingReq({
    required var rating,
    required var review,
  }) {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["Rating[rating] "] = rating;
    data["Rating[comment]"] = review;
    return data;
  }
}
