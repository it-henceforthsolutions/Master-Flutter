import 'package:engagely/app/modules/main/models/menu_code.dart';
class BottomNavItem {
  final String? navTitle;
  final String? icon;
  final String? selectedIcon;
  final MenuCode? menuCode;

  const BottomNavItem(
      {this.navTitle,
       this.icon,
       this.selectedIcon,
       this.menuCode});
}
