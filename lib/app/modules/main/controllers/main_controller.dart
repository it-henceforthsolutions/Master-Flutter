/*
 * @copyright : Henceforth Pvt. Ltd. <info@henceforthsolutions.com>
 * @author     : Gaurav Negi
 * All Rights Reserved.
 * Proprietary and confidential :  All information contained herein is, and remains
 * the property of Henceforth Pvt. Ltd. and its partners.
 * Unauthorized copying of this file, via any medium is strictly prohibited.
 *
 */

import 'package:engagely/app/core/widget/dialog.dart';
import 'package:engagely/app/core/widget/focus_menu_tem.dart';
import 'package:engagely/app/modules/main/controllers/bottom_nav_controller.dart';
import 'package:engagely/app/modules/main/models/menu_code.dart';
import 'package:engagely/app/modules/main/widgets/menu_item_view.dart';

import '../../../export.dart';

class MainController extends GetxController with GetTickerProviderStateMixin {
  RxBool isShowMenu = false.obs;
  final _selectedMenuCodeController = MenuCode.HOME.obs;
  final navController = BottomNavController();
 RxDouble animationTurns= 0.0.obs;
  late AnimationController controller;
  late Animation<double> animation;
  MenuCode get selectedMenuCode => _selectedMenuCodeController.value;

RxList<FocusedMenuItem> menuItems =RxList.empty();
  final lifeCardUpdateController = false.obs;

  onMenuSelected(MenuCode? menuCode) async {
    _selectedMenuCodeController(menuCode);

  }

  @override
  void onInit() {
    controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    )
      ..forward()
      ..repeat(reverse: true);
    animation = Tween<double>(begin: 0.0, end: 1.0).animate(controller);
    addMenuItems();
    super.onInit();
  }

  addMenuItems(){
    if(menuItems.isNotEmpty){
      menuItems.clear();
    }
    menuItems.value= [
      // Add Each FocusedMenuItem  for Menu Options

      FocusedMenuItem(
          onPressed: () {
            Get.toNamed(AppRoutes.liveView,
                arguments: {isMyLive: true});
          },
          title: const MenuItemView(
            icon: iconsLiveIc,
            title: strGoLive,
          )),
      FocusedMenuItem(
          onPressed: () {
            Get.toNamed(AppRoutes.postImagePickerView);
          },
          title: const MenuItemView(
            icon: iconsPost,
            title: strCreatePost,
          )),
      FocusedMenuItem(
          onPressed: () {
            Get.toNamed(AppRoutes.streamGameView, arguments: {isMyLive: true});
          },
          title: const MenuItemView(
            icon: iconsGame,
            title: strStreamGame,
          )),
      FocusedMenuItem(
          onPressed: () {
            Get.toNamed(AppRoutes.streamMusicView,arguments: {isMyLive: true});
          },
          title: const MenuItemView(
            icon: iconsMusic,
            title: strMusicStream,
          )),
      FocusedMenuItem(
          onPressed: () {
            Get.toNamed(AppRoutes.createMatchView,);
          },
          title: const MenuItemView(
            icon: iconsVsButton,
            title: strPlyervs,
          ))
    ];
  }






  Future<bool> closeApplicationDialog() async {
    if (selectedMenuCode == MenuCode.HOME) {
      var result = await Get.bottomSheet(DialogWidget(
        heading: strExitApp,
        subHeading: strExitAppMessage,
        onTapDismiss: () {
          Get.back();
        },
        onTapDone: () {
         SystemNavigator.pop();
        },
      ));
      return result;
    } else {
      setToHomeView();

      return false;
    }
  }

  setToHomeView(){
    _selectedMenuCodeController.value = MenuCode.HOME;
    navController.updateSelectedIndex(0);
    onMenuSelected(MenuCode.HOME);
  }

}
