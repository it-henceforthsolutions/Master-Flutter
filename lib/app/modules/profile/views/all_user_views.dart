import 'package:engagely/app/core/widget/app_bar_widget.dart';
import 'package:engagely/app/modules/home/widget/user_item_view.dart';
import 'package:engagely/app/modules/profile/controller/all_users_controller.dart';

import '../../../export.dart';

class AllUserViews extends BaseView<AllUserController> {
  @override
  PreferredSizeWidget? appBar(BuildContext context) {
    return AppBarWidget(
      appBarTitleText:
          "${Get.arguments[screenType]} (${Get.arguments[memberCount]})",
      isCustom: false,
      bgColor: Colors.white,
      isbackIcon: true,
    );
  }

  @override
  Widget body(BuildContext context) {
    return _listView();
  }

  Widget _listView() => ListView.builder(
      itemCount:Get.arguments[screenType]==strBlock?2: 8,
      itemBuilder: (context, index) {
        return UserItemView(
          index: index,
          type: Get.arguments[screenType],
        ).paddingSymmetric(vertical: margin_10);
      }).paddingSymmetric(horizontal: margin_15, vertical: margin_15);
}
