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
import 'package:engagely/app/modules/home/widget/user_item_view.dart';
import 'package:engagely/app/modules/settings/controller/creator_center_controller.dart';
import 'package:engagely/app/modules/settings/controller/live_notification_controller.dart';
import 'package:engagely/app/modules/settings/controller/privacy_controller.dart';
import 'package:engagely/app/modules/settings/models/request_models/account_information_model.dart';
import 'package:engagely/app/modules/settings/widgets/privacy_item_view.dart';
import 'package:engagely/app/modules/settings/widgets/settings_item_view.dart';

class LiveNotificationView extends BaseView<LiveNotificationController> {
  LiveNotificationView({super.key});

  @override
  PreferredSizeWidget? appBar(BuildContext context) {
    return AppBarWidget(
      appBarTitleText: strLiveNotification,
      isCustom: false,
      bgColor: Colors.white,
      isbackIcon: true,
    );
  }

  @override
  Widget body(BuildContext context) {
    return ListView.builder(itemCount: 8,itemBuilder: (context,index){
      return UserItemView(index: index,type: strLiveNotification,).paddingSymmetric(vertical: margin_10);
    }).paddingSymmetric(horizontal: margin_15);
  }

  Widget _readRecipitView() => Obx(
        () => PrivacyItemView(
          title: strReadReceipts,
          descrption: strReadReceiptsDes,
          isSelected: controller.isPrivacy?.value,
          onChanged: (bool? data) {
            controller.isPrivacy?.value = data!;
          },
        ).paddingOnly(top: margin_20),
      );

  Widget _lastSeenView() => Obx(
        () => PrivacyItemView(
          title: strLastSeen,
          descrption: strLastSeenDes,
          isSelected: controller.isLastSeen?.value,
          onChanged: (bool? data) {
            controller.isLastSeen?.value = data!;
          },
        ).paddingOnly(top: margin_20),
      );

  Widget _divider() => Divider(
        color: Colors.grey.shade300,
      ).marginOnly(top: margin_20);

  Widget _blockView() => ButtonWidget(
        onTap: () {
          Get.toNamed(AppRoutes.alluserView,
              arguments: {screenType: strBlock, memberCount: "2"});
        },
        child: Row(
          children: [
            Expanded(
                child: TextView(
              text: strBlock,
              textStyle: textStyleBodyLarge()
                  .copyWith(fontWeight: FontWeight.w500, fontSize: font_16),
            )),
            TextView(
              text: "2 users",
              textStyle: textStyleBodyLarge().copyWith(
                  fontWeight: FontWeight.w500,
                  fontSize: font_14,
                  color: Colors.grey),
            ),
            Icon(
              Icons.arrow_forward_ios,
              color: Colors.grey,
              size: margin_12,
            )
          ],
        ).marginOnly(top: margin_20),
      );
}
