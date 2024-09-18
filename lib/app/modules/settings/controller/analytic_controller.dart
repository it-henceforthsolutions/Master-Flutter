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

class AnaylyticController extends BaseController with GetTickerProviderStateMixin{

  RxList<AccountInfoModel> listItems= RxList.empty();
  RxBool isPrivacy= false.obs;
  RxBool isLastSeen = false.obs;
  TabController? tabBeansController;
  TabController? tabViewerController;
  TabController? tabBroadCastController;
  @override
  void onInit() {
    tabBeansController = TabController(length: 3, vsync: this);
    tabViewerController = TabController(length: 3, vsync: this);
    tabBroadCastController = TabController(length: 3, vsync: this);

    super.onInit();
  }


}