

import 'package:engagely/app/core/base/base_controller.dart';
import 'package:engagely/app/modules/live/widget/inviation_dialog_widget.dart';

import '../../../export.dart';

class VideoCallController extends BaseController {
  RxBool isRinging= true.obs;
  @override
  void onInit() {


    super.onInit();
  }



  @override
  void onClose() {

    super.onClose();
  }

  void balanceLowDialogShow() {
    Get.dialog( DialogWidget(
      image: icCryEmoji,
      title: strLowBalanceCoin,
      descrption: strLowBalanceCoinDes,sucessText: strBuyCoinss,
      isFailureButtonShow: false, onAccepted: (){
      Get.back();
    },
      padding: EdgeInsets.symmetric(vertical: margin_10),
    ));
  }
}
