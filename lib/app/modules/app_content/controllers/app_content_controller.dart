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
import 'package:engagely/app/export.dart';

class AppContentController extends BaseController{
  String? pageTitile;
  @override
  void onInit() {
    getDataFromArguments();
    super.onInit();
  }
  getDataFromArguments(){
    if(Get.arguments!=null){
      if(Get.arguments[pageType]==pageTypeAboutUs){
        pageTitile = strAboutUs;
      }else if(Get.arguments[pageType]==pageTypePrivacyPolicy){
        pageTitile = strPrivacyPolicys;
      }else if(Get.arguments[pageType]==pageTypeTermsCondtions){
        pageTitile =strTermsCondtionTitle;
      }
    }
  }
}