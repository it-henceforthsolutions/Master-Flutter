/*
 * @copyright : Henceforth Pvt. Ltd. <info@henceforthsolutions.com>
 * @author     : Gaurav Negi
 * All Rights Reserved.
 * Proprietary and confidential :  All information contained herein is, and remains
 * the property of Henceforth Pvt. Ltd. and its partners.
 * Unauthorized copying of this file, via any medium is strictly prohibited.
 *
 */

import 'package:engagely/app/core/widget/app_bar_widget.dart';
import 'package:engagely/app/export.dart';
import 'package:engagely/app/modules/settings/controller/creator_center_controller.dart';
import 'package:engagely/app/modules/settings/models/request_models/account_information_model.dart';
import 'package:engagely/app/modules/settings/widgets/settings_item_view.dart';

class CreatorCenterView extends BaseView<CreatorCenterController> {
  CreatorCenterView({super.key});

  @override
  PreferredSizeWidget? appBar(BuildContext context) {
    return AppBarWidget(
      appBarTitleText: strCreatorCenter,
      isCustom: false,
      bgColor: Colors.white,
      isbackIcon: true,
    );
  }

  @override
  Widget body(BuildContext context) {
    return SingleChildScrollView(
      child: Column(children: [
        _listView(),
        _divider(),
      ]),
    );
  }

  Widget _listView() => ListView.separated(
      separatorBuilder: (ctx, index) {
        return Divider(
          color: Colors.grey.shade300,
        );
      },
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: controller.listItems.length,
      itemBuilder: (context, index) {
        AccountInfoModel item = controller.listItems[index];
        return SettingsItemView(
          accountInfoModel: item,
          onTap: () {
            Get.toNamed(item.route??"");
          },
        );
      }).paddingSymmetric(horizontal: margin_15, vertical: margin_10);

  Widget _divider() => Divider(
        color: Colors.grey.shade300,
        indent: margin_15,
        endIndent: margin_15,
      );
}
