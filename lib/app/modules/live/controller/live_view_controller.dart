/*
 * @copyright : Henceforth Pvt. Ltd. <info@henceforthsolutions.com>
 * @author     : Gaurav Negi
 * All Rights Reserved.
 * Proprietary and confidential :  All information contained herein is, and remains
 * the property of Henceforth Pvt. Ltd. and its partners.
 * Unauthorized copying of this file, via any medium is strictly prohibited.
 *
 */

import 'package:engagely/app/export.dart';
import 'package:engagely/app/modules/live/views/gift_views.dart';
import 'package:engagely/app/modules/live/views/inivite_to_join.dart';
import 'package:engagely/app/modules/live/views/wish_list_view.dart';

class LiveController extends GetxController {
  RxInt state = typeConnecting.obs;
  Timer? timer;
  @override
  void onInit() {
    getDataFromArguments();
    super.onInit();
  }
  @override
  void onReady() {
    super.onInit();
  }

  getDataFromArguments() {
    if (Get.arguments[isMyLive] == true) {
      state.value = typeConnecting;
      updateState();
    } else {
      state.value = typeChat;
    }
  }

  updateState(){
    timer= Timer.periodic(const Duration(seconds: 5), (timer) {
      if(state.value == typeConnecting){
        state.value = typeLive;
      }else if(state.value == typeLive){
        state.value = typeChat;
      }else if(state.value == typeChat){
        state.value = typeTwoMember;
      }else if(state.value == typeTwoMember){
        state.value = typeThreeMember;
      }else if(state.value == typeThreeMember){
        state.value = typeFourMember;
      }else if(state.value == typeFourMember){
        timer.cancel();
        Get.toNamed(AppRoutes.endLiveVideoView);
      }

    });
  }

  openGiftView() {
    Get.bottomSheet(
        backgroundColor: Colors.white,
        GiftView(isCoin: false),
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

  @override
  void onClose() {
    timer?.cancel();
    super.onClose();
  }
}
