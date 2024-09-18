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
import 'package:engagely/app/core/widget/ripple.dart';
import 'package:engagely/app/export.dart';
import 'package:engagely/app/modules/settings/controller/creator_center_controller.dart';
import 'package:engagely/app/modules/settings/controller/privacy_controller.dart';
import 'package:engagely/app/modules/settings/controller/security_controller.dart';
import 'package:engagely/app/modules/settings/models/request_models/account_information_model.dart';
import 'package:engagely/app/modules/settings/widgets/privacy_item_view.dart';
import 'package:engagely/app/modules/settings/widgets/settings_item_view.dart';

class SecurityView extends BaseView<SecurityController> {
  SecurityView({super.key});

  @override
  PreferredSizeWidget? appBar(BuildContext context) {
    return AppBarWidget(
      appBarTitleText: strSecurity,
      isCustom: false,
      bgColor: Colors.white,
      isbackIcon: true,
    );
  }

  @override
  Widget body(BuildContext context) {
    return SingleChildScrollView(
      child: Column(children: [
        _appLockView(),
      ]).marginSymmetric(horizontal: margin_15),
    );
  }

  Widget _appLockView() => Obx(
        () => PrivacyItemView(
          title: strAppLock,
          descrption: strAppLockDes,
          isSelected: controller.isLock?.value,
          onChanged: (bool? data) {
            controller.isLock?.value = data!;
          },
        ).paddingOnly(top: margin_20),
      );


}
