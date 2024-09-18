import 'package:get/get.dart';

import '../controllers/other_profile_controller.dart';
import '../controllers/reviews_controller.dart';

class OtherProfileBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<OtherProfileController>(() => OtherProfileController());
    Get.lazyPut<ReviewsController>(() => ReviewsController());
  }
}
