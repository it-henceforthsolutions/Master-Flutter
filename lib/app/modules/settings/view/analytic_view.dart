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
import 'package:engagely/app/modules/settings/controller/analytic_controller.dart';
import 'package:engagely/app/modules/settings/controller/creator_center_controller.dart';
import 'package:engagely/app/modules/settings/controller/privacy_controller.dart';
import 'package:engagely/app/modules/settings/models/request_models/account_information_model.dart';
import 'package:engagely/app/modules/settings/widgets/analytic_item_view.dart';
import 'package:engagely/app/modules/settings/widgets/privacy_item_view.dart';
import 'package:engagely/app/modules/settings/widgets/settings_item_view.dart';

class AnalyticView extends BaseView<AnaylyticController> {
  AnalyticView({super.key});

  @override
  PreferredSizeWidget? appBar(BuildContext context) {
    return AppBarWidget(
      appBarTitleText: strAnalytics,
      isCustom: false,
      bgColor: Colors.white,
      isbackIcon: true,
    );
  }

  @override
  Widget body(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            AnalyticsItemView(
              heading: strTotalBeansEarned,
              totalData: '200',
              subHeading: 'Today beans earned',
              todayData: '20',
              color: AppColors.voiletSecondary,
              iconPath: iconsBeansImage,onTap: (int? index){

            },
tabcontroller: controller.tabBeansController,
            ).paddingOnly(   top: margin_10,),
            AnalyticsItemView(
              heading: strTotalViewer,
              totalData: '100',
              subHeading: 'Today viewers',
              todayData: '14',
              color: AppColors.redSecondaryColor,
              iconPath: iconsEyeTrasparent,onTap: (int? index){

            },
              tabcontroller: controller.tabViewerController,
            ).paddingOnly(

              top: margin_10,
            ),
            AnalyticsItemView(
              heading: strTotalBroadcastTime,
              totalData: '10h 50m',
              subHeading: 'Today broadcast time',
              todayData: '00h 30m',
              color: AppColors.skyBluePrimary,
              iconPath: iconsClock,onTap: (int? index){

            },
              tabcontroller: controller.tabBroadCastController,


            ).paddingOnly(
              top: margin_10,
            ),
          ],
        ).marginSymmetric(horizontal: margin_18,vertical: margin_15),
      ),
    );
  }
}
