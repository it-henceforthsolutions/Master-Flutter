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


class Items {
  String? name;
  String? icon;
  Items({this.name,this.icon});
}
class InviteToJoinController extends BaseController {
  TabController? tabController;
  List<Items> listData = <Items>[
    Items(name: "Free",icon: iconsGift_0),
    Items(name: "20",icon: iconsGift_1),
    Items(name: "20",icon: iconsGift_2),
    Items(name: "20",icon: iconsGift_3),
    Items(name: "20",icon: iconsGift_4),
    Items(name: "20",icon: iconsGift_5),
    Items(name: "20",icon: iconsGift_7),
    Items(name: "20",icon: iconsGift_8),

  ];

  List<Items> listEmojiData = <Items>[
    Items(name: "20",icon: iconsEmoji_1),
    Items(name: "20",icon: iconsEmoji_2),
    Items(name: "20",icon: iconsEmoji_3),
    Items(name: "20",icon: iconsEmoji_4),
    Items(name: "20",icon: iconsEmoji_5),
    Items(name: "20",icon: iconsEmoji_6),
    Items(name: "20",icon: iconsEmoji_7),
    Items(name: "20",icon: iconsEmoji_8),

  ];

  List<Items> listAnmiatedData = <Items>[
    Items(name: "20",icon: iconsAnimated_1),
    Items(name: "20",icon: iconsAnimated_2),
    Items(name: "20",icon: iconsAnimated_3),
    Items(name: "20",icon: iconsAnimated_4),
    Items(name: "20",icon: iconsAnimated_3),
    Items(name: "20",icon: iconsAnimated_4),
    Items(name: "20",icon: iconsAnimated_1),
    Items(name: "20",icon: iconsAnimated_2),

  ];

  int seletedIndex =0;

  @override
  void onInit() {
    super.onInit();
  }

}