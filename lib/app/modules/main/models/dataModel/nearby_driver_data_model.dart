/*
 * @copyright : Henceforth Pvt. Ltd. <info@henceforthsolutions.com>
 * @author     : Gaurav Negi
 * All Rights Reserved.
 * Proprietary and confidential :  All information contained herein is, and remains
 * the property of Henceforth Pvt. Ltd. and its partners.
 * Unauthorized copying of this file, via any medium is strictly prohibited.
 *
 */

class NearbyDriverDataModel {
  int? id;
  String? fullName;
  String? firstName;
  String? lastName;
  String? address;
  String? latitude;
  String? longitude;
  String? email;
  var dateOfBirth;
  int? gender;
  String? countryCode;
  String? contactNo;
  String? language;
  String? profileFile;
  int? step;
  String? otp;
  int? otpVerified;
  int? isOnline;
  int? roleId;
  int? stateId;
  int? typeId;
  String? timezone;
  String? createdOn;
  int? rideId;

  NearbyDriverDataModel(
      {this.id,
        this.fullName,
        this.firstName,
        this.lastName,
        this.address,
        this.latitude,
        this.longitude,
        this.email,
        this.dateOfBirth,
        this.gender,
        this.countryCode,
        this.contactNo,
        this.language,
        this.profileFile,
        this.step,
        this.otp,
        this.otpVerified,
        this.isOnline,
        this.roleId,
        this.stateId,
        this.typeId,
        this.timezone,
        this.createdOn,
        this.rideId,
      });

  NearbyDriverDataModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    fullName = json['full_name'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    address = json['address'];
    latitude = json['latitude'];
    longitude = json['longitude'];
    email = json['email'];
    dateOfBirth = json['date_of_birth'];
    gender = json['gender'];
    countryCode = json['country_code'];
    contactNo = json['contact_no'];
    language = json['language'];
    profileFile = json['profile_file'];
    step = json['step'];
    otp = json['otp'];
    otpVerified = json['otp_verified'];
    isOnline = json['is_online'];
    roleId = json['role_id'];
    stateId = json['state_id'];
    typeId = json['type_id'];
    timezone = json['timezone'];
    createdOn = json['created_on'];
    rideId = json['ride_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['full_name'] = this.fullName;
    data['first_name'] = this.firstName;
    data['last_name'] = this.lastName;
    data['address'] = this.address;
    data['latitude'] = this.latitude;
    data['longitude'] = this.longitude;
    data['email'] = this.email;
    data['date_of_birth'] = this.dateOfBirth;
    data['gender'] = this.gender;
    data['country_code'] = this.countryCode;
    data['contact_no'] = this.contactNo;
    data['language'] = this.language;
    data['profile_file'] = this.profileFile;
    data['step'] = this.step;
    data['otp'] = this.otp;
    data['otp_verified'] = this.otpVerified;
    data['is_online'] = this.isOnline;
    data['role_id'] = this.roleId;
    data['state_id'] = this.stateId;
    data['type_id'] = this.typeId;
    data['timezone'] = this.timezone;
    data['created_on'] = this.createdOn;
    data['ride_id'] = this.rideId;
    return data;
  }
}