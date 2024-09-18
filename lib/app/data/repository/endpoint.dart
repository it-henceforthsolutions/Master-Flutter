
/*
 * @copyright : Henceforth Pvt. Ltd. <info@henceforthsolutions.com>
 * @author     : Gaurav Negi
 * All Rights Reserved.
 * Proprietary and confidential :  All information contained herein is, and remains
 * the property of Henceforth Pvt. Ltd. and its partners.
 * Unauthorized copying of this file, via any medium is strictly prohibited.
 *
 */

const String baseUrl = "http://35.178.116.218:3001/";
const String imageBaseUrl = "https://clickspertdev.fra1.digitaloceanspaces.com/image/original/";

const String loginEndPoint = "user/login";
const String verifyPhoneEndPoint = "user/phone/verify";
const String resendOtpEndPoint = "user/resend/phone-otp";

const String editProfileEndPoint = "user/profile";
const String secondContactEndPoint = "/vendor/second-contact";
const String locationEndPoint = "/vendor/location";
const String getProfileEndPoint = "/vendor/profile";
const String addLocationEndPoint = "/vendor/location";
const String adServicesEndPoint = "/vendor/services";
const String getOtherDocListEndPoint = "/vendor/document";
const String getVendorServicesEndPoint = "/vendor/services";

const String logoutEndPoint = "/vendor/logout";
const String changePasswordEndPoint = "/vendor/password-change";
const String forgotEndPoint = "/vendor/password-forgot";
const String changePhoneNumberEndPoint = "/vendor/change-phone";
const String changeNameImageEndPoint = "//vendor/profile";
const String verifyOtpEndPoint = "/vendor/verify-email-otp";
const String pgoneOtpVerifyEndPoint = "/vendor/phone-otp-verify";
const String verifyForgotOtpEndPoint = "/vendor/verify-otp";
const String newPasswordOtpEndPoint = "/vendor/password-reset";
const String checkEndPoint = "/user/check";
const String getPagesEndPoint = "/user/get-page";
const String faQEndPoint = "/faq/list";
const String profileCompletionEndPoint = "/vendor/profile-completion";
const String updateProfileEndPoint = "/user/update-profile";
const String contactUsEndPoint = "/user/contact-us";
const String uploadProfileEndPoint = "/upload/file";

const String deleteAccountEndPoint = "/user/delete-account";


//type const

const typeActive = 0;
const typeUpcoming = 1;
const typeCompleted = 2;
const typeCancelled = 3;
const typeRequested = 4;



const typePersonalInfo = 0;
const typeServiceInfo = 1;
const typeContactInfo = 2;
const typeLogoutInfo = 3;


const typeTradeLicence = 0;
const typeInsurance = 1;
const typeVatCertificate = 2;
const typeOtherDoc = 3;
const typeDescription = 4;


