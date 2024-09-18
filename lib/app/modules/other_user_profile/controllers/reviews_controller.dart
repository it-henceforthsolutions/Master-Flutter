

import 'package:get/get.dart';

class ReviewsController extends GetxController {
  // RxList<ReviewModel> reviewsList = <ReviewModel>[].obs;

  @override
  void onInit() {
    _initControllers();
    _getArgs();
    super.onInit();
  }

  void _getArgs() {
    if (Get.arguments != null) {}
  }

  @override
  void onReady() {
    // reviewsList.value = List.generate(6, (index) {
    //   return ReviewModel(
    //       title: 'John Doe',
    //       imagePath: index % 2 == 0 ? iconsIcUser : iconsIcUser2,
    //       createdOn: DateTime.now(),
    //       rating: index.toDouble(),
    //       commentData:
    //           'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed a velit eget metus accumsan sollicitudin eget sit amet nunc. Ut rhoncus lobortis convallis. Maecenas ac sem eget arcu efficitur efficitur eleifend ut metus.');
    // });

    super.onReady();
  }

  void _initControllers() {}

  @override
  void onClose() {
    _disposeControllers();
    super.onClose();
  }

  void _disposeControllers() {}
}
