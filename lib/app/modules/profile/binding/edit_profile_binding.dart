import 'package:engagely/app/modules/profile/controller/edit_profile_controller.dart';
import 'package:get/get.dart';


class EditProfileBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<EditProfileController>(() => EditProfileController());
  }
}
