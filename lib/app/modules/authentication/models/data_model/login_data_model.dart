

/*
 * @copyright : Henceforth Pvt. Ltd. <info@henceforthsolutions.com>
 * @author     : Gaurav Negi
 * All Rights Reserved.
 * Proprietary and confidential :  All information contained herein is, and remains
 * the property of Henceforth Pvt. Ltd. and its partners.
 * Unauthorized copying of this file, via any medium is strictly prohibited.
 *
 */
class LoginDataModel {
  String? sId;
  String? type;
  dynamic socialType;
  dynamic image;
  dynamic socialToken;
  dynamic email;
  dynamic name;
  dynamic username;
  dynamic googleId;
  bool? superAdmin;
  dynamic password;
  dynamic profilePic;
  int? phoneNo;
  String? countryCode;
  bool? isDeactiveUser;
  dynamic dob;
  dynamic customerId;
  String? gender;
  dynamic bio;
  bool? isEmailVerified;
  bool? isPhoneVerified;
  String? deviceType;
  bool? isBlocked;
  bool? isActive;
  bool? isDeleted;
  dynamic blockedAt;
  String? accountStatus;
  dynamic lat;
  dynamic lng;
  int? deactivedUserAt;
  dynamic accountName;
  List<Null>? interest;
  int? deletedAt;
  int? createdAt;
  int? updatedAt;
  String? accessToken;

  LoginDataModel(
      {this.sId,
        this.type,
        this.socialType,
        this.socialToken,
        this.image,
        this.email,
        this.name,
        this.username,
        this.googleId,
        this.superAdmin,
        this.password,
        this.profilePic,
        this.phoneNo,
        this.countryCode,
        this.isDeactiveUser,
        this.dob,
        this.customerId,
        this.gender,
        this.bio,
        this.isEmailVerified,
        this.isPhoneVerified,
        this.deviceType,
        this.isBlocked,
        this.isActive,
        this.isDeleted,
        this.blockedAt,
        this.accountStatus,
        this.lat,
        this.lng,
        this.deactivedUserAt,
        this.accountName,
        this.interest,
        this.deletedAt,
        this.createdAt,
        this.updatedAt,
        this.accessToken});

  LoginDataModel.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    type = json['type'];
    socialType = json['social_type'];
    socialToken = json['social_token'];
    email = json['email'];
    name = json['name'];
    username = json['username'];
    googleId = json['googleId'];
    superAdmin = json['super_admin'];
    
    password = json['password'];
    profilePic = json['profile_pic'];
    phoneNo = json['phone_no'];
    countryCode = json['country_code'];
    isDeactiveUser = json['is_deactive_user'];
    dob = json['dob'];
    customerId = json['customer_id'];
    gender = json['gender'];
    bio = json['bio'];
    isEmailVerified = json['is_email_verified'];
    isPhoneVerified = json['is_phone_verified'];
    deviceType = json['device_type'];
    isBlocked = json['is_blocked'];
    isActive = json['is_active'];
    isDeleted = json['is_deleted'];
    blockedAt = json['blocked_at'];
    accountStatus = json['account_status'];
    lat = json['lat'];
    lng = json['lng'];
    deactivedUserAt = json['deactived_user_at'];
    accountName = json['account_name'];
   
    deletedAt = json['deleted_at'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    accessToken = json['access_token']??json['token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['type'] = this.type;
    data['social_type'] = this.socialType;
    data['social_token'] = this.socialToken;
    data['email'] = this.email;
    data['name'] = this.name;
    data['username'] = this.username;
    data['googleId'] = this.googleId;
    data['super_admin'] = this.superAdmin;
    
    data['password'] = this.password;
    data['profile_pic'] = this.profilePic;
    data['phone_no'] = this.phoneNo;
    data['country_code'] = this.countryCode;
    data['is_deactive_user'] = this.isDeactiveUser;
    data['dob'] = this.dob;
    data['customer_id'] = this.customerId;
    data['gender'] = this.gender;
    data['bio'] = this.bio;
    data['is_email_verified'] = this.isEmailVerified;
    data['is_phone_verified'] = this.isPhoneVerified;
    data['device_type'] = this.deviceType;
    data['is_blocked'] = this.isBlocked;
    data['is_active'] = this.isActive;
    data['is_deleted'] = this.isDeleted;
    data['blocked_at'] = this.blockedAt;
    data['account_status'] = this.accountStatus;
    data['lat'] = this.lat;
    data['lng'] = this.lng;
    data['deactived_user_at'] = this.deactivedUserAt;
    data['account_name'] = this.accountName;
  
    data['deleted_at'] = this.deletedAt;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['access_token'] = this.accessToken;
    return data;
  }
}