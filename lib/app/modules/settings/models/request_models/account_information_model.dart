/*
 * @copyright : Henceforth Pvt. Ltd. <info@henceforthsolutions.com>
 * @author     : Gaurav Negi
 * All Rights Reserved.
 * Proprietary and confidential :  All information contained herein is, and remains
 * the property of Henceforth Pvt. Ltd. and its partners.
 * Unauthorized copying of this file, via any medium is strictly prohibited.
 *  
 */

import 'package:engagely/app/core/values/app_assets.dart';
import 'package:engagely/app/core/values/app_strings.dart';
import 'package:engagely/app/export.dart';

class AccountInfoModel {
  List<AccountInfoModel> listItems = [];
  String? title;
  String? icon;
  String? route;
  Map<String,dynamic>? arguments;
  AccountInfoModel({this.title, this.icon, this.route,this.arguments});

  addData() {
    if (listItems.isNotEmpty) {
      listItems.clear();
    }
    listItems.add(AccountInfoModel(
        title: strCreatorCenter,
        icon: iconsCreatorCenter,
        route: AppRoutes.creatorCenterView));
    listItems.add(AccountInfoModel(
        title: strPrivacy, icon: iconsPrivacy, route: AppRoutes.privacyView));
    listItems.add(AccountInfoModel(
      title: strSecurity,
      icon: iconsSecurity,
      route: AppRoutes.securityView,
    ));
    listItems.add(AccountInfoModel(
        title: strWishlist,
        icon: iconsWishList,
        route: AppRoutes.wishListHomeView));
    listItems.add(AccountInfoModel(
        title: strSavedAddress,
        icon: iconsLocations,
        route: AppRoutes.savedAddressView));
    listItems.add(AccountInfoModel(
        title: strLiveNotification,
        icon: iconsLiveNotification,
        route: AppRoutes.liveNotificationView));
    listItems.add(AccountInfoModel(
        title: strContactUs,
        icon: iconsContactUs,
        route: AppRoutes.conatctUsView));
    listItems.add(
        AccountInfoModel(title: strAboutUs, icon: iconsAboutUs,route: AppRoutes.appContentView,arguments: {pageType:pageTypeAboutUs}));
    listItems.add(
        AccountInfoModel(title: strPrivacyPolicys, icon: iconsPrivacyPolicy,route: AppRoutes.appContentView,arguments:  {pageType:pageTypePrivacyPolicy}));
    listItems.add(AccountInfoModel(title: strLogOut, icon: iconsLogout));
  }

  addCreatorData() {
    if (listItems.isNotEmpty) {
      listItems.clear();
    }
    listItems.add(AccountInfoModel(
        title: strPricing,
        icon: iconsCreatorCenter,
        route: AppRoutes.pricingView));
    listItems.add(AccountInfoModel(
        title: strAnalytics,
        icon: iconsPrivacy,
        route: AppRoutes.analyticView));
    listItems.add(AccountInfoModel(
        title: strEarning, icon: iconsSecurity, route: AppRoutes.earningView));
  }
}
