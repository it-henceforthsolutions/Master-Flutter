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
import 'package:engagely/app/modules/live/views/gift_views.dart';
import 'package:engagely/app/modules/live/views/inivite_to_join.dart';
import 'package:engagely/app/modules/live/views/wish_list_view.dart';

class UserName {
  String? name;
  String? image;
  UserName({this.name, this.image});
}

class StreamMusicController extends BaseController {
  RxList<UserName> userList = [
    UserName(name: "username", image: icProfileUser),
    UserName(name: "username", image: icProfileUser),
    UserName(name: null, image: icAddUser),
    UserName(name: null, image: icAddUser),

  ].obs;
  openGiftView() {
    Get.bottomSheet(
        backgroundColor: Colors.white,
        const GiftView(),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(margin_30),
                topRight: Radius.circular(margin_30))));
  }

  openWishListView() {
    showModalBottomSheet(
        context: Get.overlayContext!,
        isScrollControlled: true,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(margin_30),
                topRight: Radius.circular(margin_30))),
        builder: (context) {
          return FractionallySizedBox(
            heightFactor: 0.7,
            child: WishListView(),
          );
        });
  }

  openInviteView() {
    Get.bottomSheet(
        backgroundColor: Colors.white,
        InviteToJoinView(),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(margin_30),
                topRight: Radius.circular(margin_30))));
  }
}
