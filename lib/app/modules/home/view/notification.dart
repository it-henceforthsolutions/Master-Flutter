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
import 'package:engagely/app/core/widget/focus_menu_tem.dart';
import 'package:engagely/app/modules/home/controller/notification_controller.dart';
import 'package:engagely/app/modules/home/widget/focus_menu.dart';
import 'package:engagely/app/modules/home/widget/notification_item.dart';

import '../../../export.dart';

class NotificationView extends BaseView<NotificationController> {
  NotificationView({super.key});

  @override
  PreferredSizeWidget? appBar(BuildContext context) {
    return AppBarWidget(
      appBarTitleText: strNotification,isCustom: false,bgColor: Colors.white,isbackIcon: true,
    );
  }

  @override
  Widget body(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _headingUnreadItems(),
        _unreadNotifications(),
        _divider(),
        _readNotificationText(),
        _prevouisNotifications(),
      ],
    ).marginSymmetric(horizontal: margin_15, vertical: margin_20);
  }

  _headingUnreadItems() => Row(
        children: [
          TextView(
              text: strUnreadNotification,
              textStyle: textStyleHeadlineLarge()
                  .copyWith(fontSize: font_18, color: Colors.black,fontWeight: FontWeight.w600)),
          Container(
            margin: EdgeInsets.only(right: margin_10, left: margin_5),
            padding:
                EdgeInsets.symmetric(horizontal: margin_5, vertical: margin_2),
            decoration: BoxDecoration(
                color: AppColors.appColor,
                borderRadius: BorderRadius.circular(margin_2)),
            child: TextView(
                text: "3",
                textStyle: textStyleBodyMedium().copyWith(
                    color: Colors.white, fontWeight: FontWeight.w600)),
          ),
          Expanded(child: emptySizeBox()),
          TextView(
              text: strMarkAllAsRead,
              textStyle: textStyleHeadlineLarge().copyWith(
                  fontSize: font_12,
                  color: AppColors.greyLightColor,
                  fontWeight: FontWeight.w600)),
        ],
      );

  Widget _unreadNotifications() => ListView.builder(
      itemCount: 3,
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemBuilder: (context, index) {
        return FocusedMenuHolder(
                menuWidth: Get.width * .92,
                blurSize: 5.0,
                menuBoxDecoration: const BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.all(Radius.circular(15.0))),
                duration: const Duration(milliseconds: 100),
                animateMenuItems: true,
                blurBackgroundColor: Colors.black54,
                openWithTap:
                    true, // Open Focused-Menu on Tap rather than Long Press
                menuOffset:
                    10.0, // Offset value to show menuItem from the selected item/ Offset height to consider, for showing the menu item ( for example bottom navigation bar), so that the popup menu will be shown on top of selected item.
                menuItems: <FocusedMenuItem>[
                  // Add Each FocusedMenuItem  for Menu Options
                  FocusedMenuItem(
                    onPressed: () {},
                    title: Row(
                      children: [
                        Icon(
                          Icons.check,
                          color: AppColors.greenColor,
                          size: margin_18,
                        ),
                         Text(strMarkAsRead,style: textStyleBodyMedium().copyWith(fontWeight: FontWeight.w600),).marginOnly(left: margin_5),
                      ],
                    ),
                  )
                ],
                onPressed: () {},
                child: const NotificationItemView())
            .marginOnly(bottom: margin_5);
      }).marginOnly(top: margin_15);

  _divider() => Divider(
        color: Colors.grey.shade300,
      ).marginOnly(top: margin_15, bottom: margin_10);

  _readNotificationText() => TextView(
      text: strPrevouisNotification,
      textStyle: textStyleHeadlineLarge()
          .copyWith(fontSize: font_18, color: Colors.black,fontWeight: FontWeight.w600));

  Widget _prevouisNotifications() => Obx(
        () => ListView.builder(
            itemCount: controller.myNotificationList.length,
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemBuilder: (context, index) {
              return Obx(
                () => FocusedMenuHolder(
                        menuWidth: Get.width * .92,
                        blurSize: 5.0,
                        duration: const Duration(milliseconds: 100),
                        animateMenuItems: true,
                        blurBackgroundColor: Colors.black54,
                        openWithTap:
                            true, // Open Focused-Menu on Tap rather than Long Press
                        menuOffset:
                            10.0, // Offset value to show menuItem from the selected item/ Offset height to consider, for showing the menu item ( for example bottom navigation bar), so that the popup menu will be shown on top of selected item.
                        menuItems: <FocusedMenuItem>[
                          // Add Each FocusedMenuItem  for Menu Options
                          FocusedMenuItem(
                            onPressed: () {},
                            title: Row(
                              children: [
                                AssetImageWidget(icReadIcon,
                                    imageHeight: margin_18,
                                    imageWidth: margin_18),
                                 Text(strMarkAsUnRead,style: textStyleBodyMedium().copyWith(fontWeight: FontWeight.w600))
                                    .marginOnly(left: margin_5),
                              ],
                            ),
                          ),
                          FocusedMenuItem(
                            onPressed: () {},
                            title: Row(
                              children: [
                                AssetImageWidget(icDeleteIcon,
                                    imageHeight: margin_18,
                                    imageWidth: margin_18),
                                 Text(strDelete,style: textStyleBodyMedium().copyWith(fontWeight: FontWeight.w600))
                                    .marginOnly(left: margin_5),
                              ],
                            ),
                          )
                        ],
                        onPressed: () {},
                        child: NotificationItemView(
                            isShow: false,
                            focus: controller.myNotificationList[index]))
                    .marginOnly(bottom: margin_5),
              );
            }).marginOnly(top: margin_15),
      );
}
