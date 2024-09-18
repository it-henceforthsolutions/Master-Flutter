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

class CreatorCenterController extends BaseController{

  RxList<AccountInfoModel> listItems= RxList.empty();


  @override
  void onInit() {
    addDataIntoListView();
    super.onInit();
  }

  addDataIntoListView(){
    AccountInfoModel accountInfoModel = AccountInfoModel();
    accountInfoModel.addCreatorData();
    listItems.value= accountInfoModel.listItems??[];
  }
}