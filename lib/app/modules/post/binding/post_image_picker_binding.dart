/*
 * @copyright : Henceforth Pvt. Ltd. <info@henceforthsolutions.com>
 * @author     : Gaurav Negi
 * All Rights Reserved.
 * Proprietary and confidential :  All information contained herein is, and remains
 * the property of Henceforth Pvt. Ltd. and its partners.
 * Unauthorized copying of this file, via any medium is strictly prohibited.
 *
 */

import 'package:engagely/app/modules/post/controller/post_image_picker_controller.dart';

import '../../../export.dart';

class PostImagePickerBiniding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ImagePickerController>(
      () => ImagePickerController(),
    );
  }
}
