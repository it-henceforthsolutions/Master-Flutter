


/*
 * @copyright : Henceforth Pvt. Ltd. <info@henceforthsolutions.com>
 * @author     : Gaurav Negi
 * All Rights Reserved.
 * Proprietary and confidential :  All information contained herein is, and remains
 * the property of Henceforth Pvt. Ltd. and its partners.
 * Unauthorized copying of this file, via any medium is strictly prohibited.
 *
 */

import 'package:engagely/app/modules/settings/controller/creator_center_controller.dart';
import 'package:engagely/app/modules/settings/controller/privacy_controller.dart';

import '../../../export.dart';

class PrivacyBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PrivacyController>(
          () => PrivacyController(),
    );
  }
}
