import 'package:engagely/app/modules/profile/controller/profile_controller.dart';
import 'package:get/get.dart';


class ProfileBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ProfileController>(() => ProfileController());
  }
}
