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
import 'package:engagely/app/modules/live/widget/sucess_widget.dart';

class WhisListDetailController extends BaseController {
  void showSucessDialog() {
    if(Get.arguments[isCosmetic]==false){
      Get.dialog(const SucessDialogWidget(
        image: iconsPizza,
        title: "Thank You",
        descrption:
        "I hope this message finds you well. I wanted to take a moment to express my heartfelt thanks for the wonderful surprise of a virtual pizza you gifted to me. It brought a smile to my face and warmed my heart in a unique and unexpected way."      ));
    }else{
      Get.dialog(const SucessDialogWidget(
        image: iconsMakeUp,
        title: "Thank You",
        descrption:
        "Receiving the items from my wishlist was an unexpected and delightful surprise. You have made my dreams come true, and I cannot thank you enough for your extraordinary generosity. Your selflessness and the effort you put into making me happy have touched my heart deeply.",
      ));
    }

  }
}
