


/*
 * @copyright : Henceforth Pvt. Ltd. <info@henceforthsolutions.com>
 * @author     : Gaurav Negi
 * All Rights Reserved.
 * Proprietary and confidential :  All information contained herein is, and remains
 * the property of Henceforth Pvt. Ltd. and its partners.
 * Unauthorized copying of this file, via any medium is strictly prohibited.
 *
 */

import '../../../export.dart';

class SplashController extends GetxController{
  var timer;

  RxString currentLogo=iconsSplashLogo.obs;

  LoginDataModel loginResponseModel = LoginDataModel();

  final APIRepository _repository = Get.find<APIRepository>();
  final LocalStorage _LocalStorage = Get.find<LocalStorage>();

  @override
  void onInit() {
    _navigateToNextScreen();
    super.onInit();
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }

  //*===================================================================== Check App validity ==========================================================*
  void _navigateToNextScreen() =>
      timer = Timer(const Duration(seconds: 3, milliseconds: 500), () async {
      Get.offAllNamed(AppRoutes.welcomeScreen);
      });


}
