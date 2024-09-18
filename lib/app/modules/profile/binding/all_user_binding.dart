import 'package:engagely/app/modules/profile/controller/all_users_controller.dart';
import 'package:get/get.dart';


class AllUserBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AllUserController>(() => AllUserController());
  }
}
