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


class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SplashController>(
      init: SplashController(),
      builder: (controller) {
        return AnnotatedRegion<SystemUiOverlayStyle>(
            value: SystemUiOverlayStyle.light.copyWith(
            statusBarColor: Colors.transparent,
            // ios
            statusBarIconBrightness: Brightness.dark),
        child: Scaffold(
          backgroundColor: Colors.white,
            body: SizedBox(width: Get.width,
              child: Stack(
                children: [
                  AssetImageWidget(iconsSplashBackground,imageWidth: Get.width,imageHeight: Get.height,imageFitType: BoxFit.cover),
                  Align(alignment: Alignment.center,
                    child: AssetImageWidget(
                      iconsAppLogo,
                        imageHeight: height_150,imageWidth: height_180,
                      ).paddingOnly(bottom: margin_10).animate().slideY(delay: Duration(milliseconds: 100)),
                  ),
                ],
              ),
            ),


        ));
      }
    );
  }
}
