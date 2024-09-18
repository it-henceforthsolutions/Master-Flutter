


/*
 * @copyright : Henceforth Pvt. Ltd. <info@henceforthsolutions.com>
 * @author     : Gaurav Negi
 * All Rights Reserved.
 * Proprietary and confidential :  All information contained herein is, and remains
 * the property of Henceforth Pvt. Ltd. and its partners.
 * Unauthorized copying of this file, via any medium is strictly prohibited.
 *
 */


import 'package:engagely/app/modules/settings/controller/contact_us_controller.dart';

import '../../../export.dart';

class ContactUsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ContactUsController>(
          () => ContactUsController(),
    );
  }
}
