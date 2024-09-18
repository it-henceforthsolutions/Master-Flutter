/*
 * @copyright : Henceforth Pvt. Ltd. <info@henceforthsolutions.com>
 * @author     : Gaurav Negi
 * All Rights Reserved.
 * Proprietary and confidential :  All information contained herein is, and remains
 * the property of Henceforth Pvt. Ltd. and its partners.
 * Unauthorized copying of this file, via any medium is strictly prohibited.
 *
 */

class ForgotModuleData {
  String? uniqueCode;
  int? otp;
  String? message;

  ForgotModuleData({this.uniqueCode, this.otp, this.message});

  ForgotModuleData.fromJson(Map<String, dynamic> json) {
    uniqueCode = json['unique_code'];
    otp = json['otp'];
    message = json['message'];
  }
}
