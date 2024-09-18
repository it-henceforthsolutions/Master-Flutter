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

import 'gitft_controller.dart';

class EndLiveVideoController extends BaseController {


  RxList<Items> giftsList =  RxList.empty();
  @override
  void onInit() {
    initList();
    super.onInit();
  }

  initList()async {
    await Future.delayed(const Duration(seconds: 2));
    giftsList.value= [
      Items(name: "X20", icon: iconsEmoji_1),
      Items(name: "X20", icon: iconsEmoji_2),
      Items(name: "X20", icon: iconsEmoji_3),
      Items(name: "X20", icon: iconsEmoji_4),
      Items(name: "X20", icon: iconsEmoji_5),
      Items(name: "X20", icon: iconsEmoji_6),
      Items(name: "X20", icon: iconsEmoji_7),
      Items(name: "X20", icon: iconsEmoji_8),
    ];
  }

  @override
  void onClose() {

    super.onClose();
  }
}
