
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
import 'package:engagely/app/modules/authentication/models/request_model/interest_model.dart';

import '../../../export.dart';


class PopularBroadCastController extends BaseController {
  RxList<InterestModel> interestList = RxList.empty();
  RxInt selectedIndex=0.obs;

  @override
  void onInit() {
    initList();
    super.onInit();
  }

  initList(){
    interestList.clear();
    interestList.add(InterestModel(title: "Jessie Pinkmen",image: iconsProfile));
    interestList.add(InterestModel(title: "Jessie Pinkmen",image: iconsProfile));
    interestList.add(InterestModel(title: "Jessie Pinkmen",image: iconsProfile));
    interestList.add(InterestModel(title: "Jessie Pinkmen",image: iconsProfile));
    interestList.add(InterestModel(title: "Jessie Pinkmen",image: iconsProfile));
    interestList.add(InterestModel(title: "Jessie Pinkmen",image: iconsProfile));
    interestList.add(InterestModel(title: "Jessie Pinkmen",image: iconsProfile));
    interestList.add(InterestModel(title: "Jessie Pinkmen",image: iconsProfile));
    interestList.add(InterestModel(title: "Jessie Pinkmen",image: iconsProfile));
  }
}