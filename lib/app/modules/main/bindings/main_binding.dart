/*
 * @copyright : Henceforth Pvt. Ltd. <info@henceforthsolutions.com>
 * @author     : Gaurav Negi
 * All Rights Reserved.
 * Proprietary and confidential :  All information contained herein is, and remains
 * the property of Henceforth Pvt. Ltd. and its partners.
 * Unauthorized copying of this file, via any medium is strictly prohibited.
 *
 */

import 'package:engagely/app/modules/chats/controller/chat_history_controller.dart';
import 'package:engagely/app/modules/diamond/controllers/my_diamond_controller.dart';
import 'package:engagely/app/modules/profile/controller/profile_controller.dart';

import '../../../export.dart';

class MainBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MainController>(
      () => MainController(),
    );
    Get.lazyPut<HomeController>(
      () => HomeController(),
    );

    Get.lazyPut<ProfileController>(
          () => ProfileController(),
    );

    Get.lazyPut<ChatHistoryController>(() => ChatHistoryController());

    Get.lazyPut<MyDiamondController>(
      () => MyDiamondController(),
    );
  }
}
