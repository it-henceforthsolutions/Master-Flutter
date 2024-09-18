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
import 'package:engagely/app/modules/settings/controller/earning_controller.dart';
import 'package:engagely/app/modules/settings/controller/privacy_controller.dart';
import 'package:engagely/app/modules/settings/models/request_models/account_information_model.dart';
import 'package:engagely/app/modules/settings/models/request_models/chart_data.dart';
import 'package:engagely/app/modules/settings/widgets/analytic_item_view.dart';
import 'package:engagely/app/modules/settings/widgets/privacy_item_view.dart';
import 'package:engagely/app/modules/settings/widgets/settings_item_view.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class EarningView extends BaseView<EarningController> {
  EarningView({super.key});

  @override
  PreferredSizeWidget? appBar(BuildContext context) {
    return AppBarWidget(
      appBarTitleText: strEarning,
      isCustom: false,
      bgColor: Colors.white,
      isbackIcon: true,
    );
  }

  @override
  Widget body(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          AnalyticsItemView(
            heading: strTotalMoneyEarned,
            totalData: '150',
            subHeading: strTodayMoneyEarned,
            todayData: '10',
            color: AppColors.parrotColorLight,
            iconPath: iconsCircularDollar,
            tabcontroller: controller.tabController,
            onTap: (int? index) {},
          ).paddingOnly(left: 20, right: 20),
          _row(),
          _sfcartesianchart(),
        ],
      ).paddingOnly(
        top: 20,
      ),
    );
  }

  _sfcartesianchart() {
    return Container(
      height: 300,
      child: SfCartesianChart(
          plotAreaBorderWidth: 0,
          primaryXAxis: CategoryAxis(
            labelStyle: const TextStyle(color: Colors.black54),
            majorGridLines: const MajorGridLines(
              width: 0,
            ),
          ),
          primaryYAxis: NumericAxis(
              minimum: 0,
              maximum: 100,
              axisLine: const AxisLine(width: 0),
              majorGridLines: MajorGridLines(
                  width: 1, dashArray: [3.0], color: Colors.grey.shade400),
              labelFormat: '\$ {value}',
              labelStyle: const TextStyle(color: Colors.black54)),
          series: <SplineSeries>[
            SplineSeries<ChartSampleData, String>(
                dataSource: [
                  ChartSampleData(
                    x: 'Jan',
                    y: 0,
                  ),
                  ChartSampleData(
                    x: 'Feb',
                    y: 4,
                  ),
                  ChartSampleData(
                    x: 'Mar',
                    y: 10,
                  ),
                  ChartSampleData(
                    x: 'Apr',
                    y: 20,
                  ),
                  ChartSampleData(
                    x: 'May',
                    y: 30,
                  ),
                  ChartSampleData(
                    x: 'Jun',
                    y: 42,
                  ),
                  ChartSampleData(
                    x: 'Jul',
                    y: 40,
                  ),
                  ChartSampleData(
                    x: 'Aug',
                    y: 41,
                  ),
                  ChartSampleData(
                    x: 'Sep',
                    y: 50,
                  ),
                  ChartSampleData(
                    x: 'Oct',
                    y: 60,
                  ),
                  ChartSampleData(
                    x: 'Nov',
                    y: 70,
                  ),
                  ChartSampleData(
                    x: 'Dec',
                    y: 50,
                  ),
                ],
                xValueMapper: (ChartSampleData sales, _) => sales.x,
                yValueMapper: (ChartSampleData sales, _) => sales.y,
                markerSettings: const MarkerSettings(
                    isVisible: true,
                    height: 10,
                    width: 10,
                    color: Colors.greenAccent),
                color: Colors.greenAccent,
                splineType: SplineType.clamped),
          ]),
    ).paddingOnly(top: 20, left: 10, right: 10);
  }

  _row() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        TextView(
          text: strEarningGraph,
          textStyle: textStyleHeadlineLarge(),
        ),
        Obx(() => Container(
              height: height_35,
              padding: EdgeInsets.symmetric(horizontal: margin_25),
              decoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                  border: Border.all(
                    color: Colors.grey.shade300,
                    width: .8,
                  ),
                  borderRadius: BorderRadius.circular(10)),
              child: Center(
                child: DropdownButtonHideUnderline(
                  child: DropdownButton(
                      padding: EdgeInsets.zero,
                      icon: RotatedBox(
                          quarterTurns: 15,
                          child: Icon(
                            Icons.arrow_back_ios,
                            size: margin_12,
                            color: Colors.grey,
                          )).marginOnly(left: margin_5),
                      iconEnabledColor: Colors.black,
                      value: controller.selected.value,
                      items: <String>['Yearly', 'Month', 'Day']
                          .map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: TextView(
                            text: value,
                            textStyle: textStyleBodyMedium().copyWith(fontSize: font_14),
                          ),
                        );
                      }).toList(),
                      onChanged: (String? newValue) {
                        if (newValue != null) {
                          controller.setSelected(newValue);
                        }
                      }),
                ),
              ),
            ))
      ],
    ).paddingOnly(left: 20, top: 30, right: 20);
  }
}


