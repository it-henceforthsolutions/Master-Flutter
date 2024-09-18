/*
 * @copyright : Henceforth Pvt. Ltd. <info@henceforthsolutions.com>
 * @author     : Gaurav Negi
 * All Rights Reserved.
 * Proprietary and confidential :  All information contained herein is, and remains
 * the property of Henceforth Pvt. Ltd. and its partners.
 * Unauthorized copying of this file, via any medium is strictly prohibited.
 *
 */

import 'package:engagely/app/modules/app_content/controllers/app_content_controller.dart';
import 'package:engagely/app/modules/authentication/controllers/add_address_controller.dart';

import '../../../export.dart';

class AppContentBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AppContentController>(
          () => AppContentController(),
    );
  }
}