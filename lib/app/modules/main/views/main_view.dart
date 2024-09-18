/*
 * @copyright : Henceforth Pvt. Ltd. <info@henceforthsolutions.com>
 * @author     : Gaurav Negi
 * All Rights Reserved.
 * Proprietary and confidential :  All information contained herein is, and remains
 * the property of Henceforth Pvt. Ltd. and its partners.
 * Unauthorized copying of this file, via any medium is strictly prohibited.
 *
 */

import 'package:engagely/app/core/widget/focus_menu_tem.dart';
import 'package:engagely/app/core/widget/focus_menu_widget.dart';
import 'package:engagely/app/modules/chats/view/chat_history_screen.dart';
import 'package:engagely/app/modules/diamond/views/my_diamond_views.dart';
import 'package:engagely/app/modules/main/models/menu_code.dart';
import 'package:engagely/app/modules/main/views/bottom_nav_bar.dart';
import 'package:engagely/app/modules/main/widgets/menu_item_view.dart';
import 'package:engagely/app/modules/profile/views/profile_view.dart';

import '../../../export.dart';

// ignore: must_be_immutable
class MainView extends GetView<MainController> {
  final GlobalKey<ScaffoldState> globalKey = GlobalKey<ScaffoldState>();

  MainView({super.key});

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        return controller.closeApplicationDialog();
      },
      child: Scaffold(
        key: globalKey,
        floatingActionButton: FocusedMenuHolderWidget(
            currentState: (state) {
              controller.isShowMenu.value = state;
              if (state) {
                controller.animationTurns.value -= 0.25;
              } else {
                controller.animationTurns.value = 0;
              }
            },
            menuWidth: Get.width * .52,
            blurSize: 5.0,
            menuBoxDecoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(15.0))),
            duration: const Duration(milliseconds: 100),
            animateMenuItems: true,
            blurBackgroundColor: Colors.black54,
            openWithTap: true,
            // Open Focused-Menu on Tap rather than Long Press
            menuOffset: 10.0,
            // Offset value to show menuItem from the selected item/ Offset height to consider, for showing the menu item ( for example bottom navigation bar), so that the popup menu will be shown on top of selected item.
            menuItems: controller.menuItems,
            onPressed: () {},
            child: Obx(
              () => GestureDetector(
                onTap: controller.isShowMenu.value == true
                    ? () {
                        Get.back();
                      }
                    : null,
                child: Container(
                  width: margin_50,
                  height: margin_50,
                  decoration: BoxDecoration(
                      color: AppColors.appColor,
                      borderRadius: BorderRadius.circular(margin_80)),
                  child: AnimatedRotation(
                    turns: controller.animationTurns.value,
                    duration: const Duration(milliseconds: 400),
                    child: Icon(
                      controller.isShowMenu.value == true
                          ? Icons.clear
                          : Icons.add,
                      size: margin_25,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            )),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        body: Obx(() => getPageOnSelectedMenu(controller.selectedMenuCode)),
        bottomNavigationBar: BottomNavBar(
            onNewMenuSelected: controller.onMenuSelected,
            navController: controller.navController),
      ),
    );
  }

  Widget getPageOnSelectedMenu(MenuCode menuCode) {
    switch (menuCode) {
      case MenuCode.HOME:
        return HomeScreen();
      case MenuCode.DIAMOND:
        return MyDiamondView();
      case MenuCode.CHAT:
        return ChatHistoryScreen();
      case MenuCode.PROFILE:
        return const ProfileView();
      default:
        return Container();
    }
  }
}
