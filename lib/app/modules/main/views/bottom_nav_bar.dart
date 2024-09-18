// ignore: must_be_immutable
import 'package:engagely/app/export.dart';
import 'package:engagely/app/modules/main/controllers/bottom_nav_controller.dart';
import 'package:engagely/app/modules/main/models/menu_code.dart';
import 'package:engagely/app/modules/main/models/menu_item.dart';

class BottomNavBar extends StatelessWidget {
  final Function(MenuCode? menuCode) onNewMenuSelected;
  final BottomNavController navController;

  BottomNavBar(
      {Key? key, required this.onNewMenuSelected, required this.navController})
      : super(key: key);

  final Key bottomNavKey = GlobalKey();

  @override
  Widget build(BuildContext context) {

    List<BottomNavItem> navItems = _getNavItems();

    return Obx(() => Theme(
        data: ThemeData(
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
        ),
        child:BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          currentIndex: navController.selectedIndex,
          onTap: (index) {
            if (index == 2) {
              return;
            }
            navController.updateSelectedIndex(index);
            onNewMenuSelected(navItems[index].menuCode);

          },
          items: navItems
              .map(
                (BottomNavItem navItem) => BottomNavigationBarItem(
                    icon: navItem.icon == ""
                        ? emptySizeBox()
                        : AssetImageWidget(
                            (navController.selectedIndex ==
                                    navItems.indexOf(navItem))
                                ? (navItem.selectedIcon ?? "")
                                : (navItem.icon ?? ""),
                            imageHeight: height_25),
                    label: ""),
              )
              .toList(),
        )));
  }

  List<BottomNavItem> _getNavItems() {
    return const [
      BottomNavItem(
        icon: icHome,
        selectedIcon: icHomeSelected,
        menuCode: MenuCode.HOME,
      ),
      BottomNavItem(
          icon: icDiamond,
          selectedIcon: icDiamondSelected,
          menuCode: MenuCode.DIAMOND),
      BottomNavItem(icon: "", selectedIcon: "", menuCode: MenuCode.EMPTY),
      BottomNavItem(
          icon: icMessage,
          selectedIcon: iconsIcChatSelect,
          menuCode: MenuCode.CHAT),
      BottomNavItem(
          icon: icProfile,
          selectedIcon: icProfileSelected,
          menuCode: MenuCode.PROFILE)
    ];
  }
}
