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
import 'package:engagely/app/modules/settings/models/request_models/account_information_model.dart';

import '../../../core/widget/dialog.dart';

class SettingsController extends BaseController{

  RxList<AccountInfoModel> listItems= RxList.empty();


  @override
  void onInit() {
    addDataIntoListView();
    super.onInit();
  }

  addDataIntoListView(){
    AccountInfoModel accountInfoModel = AccountInfoModel();
    accountInfoModel.addData();
    listItems.value= accountInfoModel.listItems??[];
  }

  void deleteAccountDialog()  {
   Get.bottomSheet(DialogWidget(
      heading: strDeleteAccount,
      subHeading: strDeleteAccountDes,
      onTapDismiss: () {
        Get.back();
      },
      onTapDone: () {
        Get.offAllNamed(AppRoutes.loginRoute);
      },
    ));
  }

  void logoutDialog()  {
    Get.bottomSheet(DialogWidget(
      heading: strLogout,
      subHeading: strLogoutDes,
      onTapDismiss: () {
        Get.back();
      },
      onTapDone: () {
        Get.offAllNamed(AppRoutes.loginRoute);
      },
    ));
  }
}