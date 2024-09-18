/*
 * @copyright : Henceforth Pvt. Ltd. <info@henceforthsolutions.com>
 * @author     : Gaurav Negi
 * All Rights Reserved.
 * Proprietary and confidential :  All information contained herein is, and remains
 * the property of Henceforth Pvt. Ltd. and its partners.
 * Unauthorized copying of this file, via any medium is strictly prohibited.
 *
 */

import 'package:engagely/app/export.dart';

import '/app/core/base/base_controller.dart';

class OnBoardingController extends BaseController {
  RxList<OnBoardingItem> listItem = RxList.empty();
  RxInt selectedIndex = 0.obs;
  Rx<PageController> pageController = PageController(
    initialPage: 0,
  ).obs;

  final LocalStorage _localStorage = Get.find<LocalStorage>();

  @override
  void onInit() {
    addData();
    super.onInit();
  }

  addData() {
    listItem.clear();
    listItem.add(const OnBoardingItem(
        image: iconsOnBoardingImage,
        heading: strOnBaordingHeading,
        subheading: strOnBaordingDescrption));
    listItem.add(const OnBoardingItem(
        image: iconsOnBoardingImage,
        heading: strOnBaordingHeadingSecond,
        subheading: strOnBaordingDesSecond));
    listItem.add(const OnBoardingItem(
        image: iconsOnBoardingImage,
        heading: strOnBaordingHeadingThird,
        subheading: strOnBaordingDesSecond));
  }

  void movePageController({required int pageIndex}) {
    selectedIndex.value++;
    if (selectedIndex.value <= 2) {
      pageController.value.animateToPage(selectedIndex.value,
          duration: const Duration(seconds: 1), curve: Curves.linear);
      pageController.refresh();
    } else {
      _localStorage.savefirstLaunch(true);
      Get.offAllNamed(AppRoutes.loginRoute);
    }
  }

  percentageUpdate() {
    if (selectedIndex.value == 0) {
      return .3;
    } else if (selectedIndex.value == 1) {
      return .6;
    } else {
      return 1.0;
    }
  }

  void skipPage() {
    _localStorage.savefirstLaunch(true);

  }

  void getStarted() {
    Get.offAllNamed(AppRoutes.loginRoute);
  }

  void onPressSkip() {

  }
}
