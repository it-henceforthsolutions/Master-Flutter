/*
 * @copyright : Henceforth Pvt. Ltd. <info@henceforthsolutions.com>
 * @author     : Gaurav Negi
 * All Rights Reserved.
 * Proprietary and confidential :  All information contained herein is, and remains
 * the property of Henceforth Pvt. Ltd. and its partners.
 * Unauthorized copying of this file, via any medium is strictly prohibited.
 *  
 */

import 'package:engagely/app/export.dart';

class AnalyticsItemView extends StatelessWidget {
  final String heading;
  final TextStyle? textStyle;
  final String totalData;
  final String subHeading;
  final String todayData;
  final Color color;
  final String iconPath;
  final TabController? tabcontroller;
  final Function(int? index) onTap;

  AnalyticsItemView({
    super.key,
    required this.heading,
    required this.tabcontroller,
    required this.totalData,
    required this.subHeading,
    required this.todayData,
    required this.color,
    required this.onTap,
    required this.iconPath,
    this.textStyle,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.width,
      padding: EdgeInsets.all(margin_15),
      decoration: BoxDecoration(
          shape: BoxShape.rectangle,
          color: color,
          borderRadius: BorderRadius.circular(12)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextView(
                    text: heading,
                    textStyle: textStyleBodyLarge().copyWith(
                      fontWeight: FontWeight.w600,
                      fontSize: font_16,
                      color: AppColors.whiteColor,
                    )),
                TextView(
                    text: totalData,
                    textStyle: textStyleBodyLarge().copyWith(
                        fontSize: font_20,
                        fontWeight: FontWeight.w700,
                        color: AppColors.whiteColor)),
                Container(
                    width: width_200,
                    height: height_30,
                    padding: EdgeInsets.all(margin_3),
                    decoration: BoxDecoration(
                        shape: BoxShape.rectangle,
                        borderRadius: BorderRadius.circular(margin_30),
                        color: AppColors.whiteColor),
                    child: TabBar(
                      controller: tabcontroller,
                      indicator: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        color: color,
                      ),
                      labelColor: AppColors.whiteColor,
                      labelStyle: textStyleBodyLarge().copyWith(
                          color: AppColors.whiteColor,
                          fontSize: font_12,
                          fontWeight: FontWeight.w500),
                      unselectedLabelColor: Colors.grey,
                      unselectedLabelStyle: textStyleBodyLarge().copyWith(
                          color: Colors.grey,
                          fontSize: font_12,
                          fontWeight: FontWeight.w500),
                      onTap: (index) {

                      },
                      tabs: const [
                        Tab(child: TextView(text: strToday)),
                        Tab(
                          child: TextView(text: strMonths),
                        ),
                        Tab(
                          child: TextView(text: strYear),
                        ),
                      ],
                    )).paddingOnly(top: 10),
                TextView(
                  text: subHeading,
                  textStyle: textStyleBodyMedium().copyWith(
                      color: AppColors.whiteColor,
                      fontWeight: FontWeight.w500,
                      fontSize: 18),
                ).paddingOnly(top: 10),
                TextView(
                  text: todayData,
                  textStyle: textStyleBodyMedium().copyWith(
                      color: AppColors.whiteColor,
                      fontWeight: FontWeight.w600,
                      fontSize: 20),
                )
              ],
            ),
          ),
          Container(height: height_80,width: margin_80,child: AssetImageWidget(iconPath,imageHeight: height_80,imageWidth: height_80,).paddingAll(margin_5))
        ],
      ),
    );
  }
}
