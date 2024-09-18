/*
 * @copyright : Henceforth Pvt. Ltd. <info@henceforthsolutions.com>
 * @author     : Gaurav Negi
 * All Rights Reserved.
 * Proprietary and confidential :  All information contained herein is, and remains
 * the property of Henceforth Pvt. Ltd. and its partners.
 * Unauthorized copying of this file, via any medium is strictly prohibited.
 *
 */

import 'package:device_preview/device_preview.dart';

import 'app/export.dart';


CustomLoader customLoader = CustomLoader();
GetStorage localStorage = GetStorage();
RxBool isDarkModeTheme=false.obs;





Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  init();

  systemThemeMode();
  orientation();
  initApp();
}

systemThemeMode() {
  var window = WidgetsBinding.instance.window;
  var brightness = window.platformBrightness;
  isDarkModeTheme.value = brightness == Brightness.dark;
  window.onPlatformBrightnessChanged = () {
    WidgetsBinding.instance.handlePlatformBrightnessChanged();
    var brightness = window.platformBrightness;
    isDarkModeTheme.value = brightness == Brightness.dark;
  };

}


init() async {
  await GetStorage.init();
  APIRepository();
  SystemChannels.textInput.invokeMethod('TextInput.hide');
}

initApp() async {

   runApp(const MyApp());
}

orientation() {
  SystemChrome.setSystemUIOverlayStyle(  SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      systemNavigationBarIconBrightness: GetPlatform.isAndroid?Brightness.light: Brightness.dark,
      systemNavigationBarColor:  Platform.isAndroid?AppColors.whiteColor:Colors.transparent,
      systemNavigationBarContrastEnforced: true,
      systemNavigationBarDividerColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark));

  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);

}
