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
import 'package:engagely/app/modules/authentication/models/request_model/interest_model.dart';

class BroadcastItemView extends StatelessWidget {
  final InterestModel? interestModel;
  final Color backgroundColor;
  final Color outlineColor;

  const BroadcastItemView(
      {super.key,
      this.interestModel,
      required this.backgroundColor,
      required this.outlineColor});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Expanded(
              child: Container(
                child: Stack(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(margin_80),
                          border: Border.all(
                              color: AppColors.appColor, width: margin_2)),
                      child: AssetImageWidget(
                        interestModel?.image ?? "",
                        imageWidth: Get.width,
                      ),
                    ),
                    Align(alignment: Alignment.topRight,
                      child: Container(
                        height: height_20,
                        margin: EdgeInsets.all(margin_3),
                        width: height_20,alignment: Alignment.topRight,
                        decoration: BoxDecoration(color: AppColors.appColor,
                          borderRadius: BorderRadius.circular(margin_80),
                        ),child: interestModel?.isCheck==true?Center(child: Icon(Icons.check,size: margin_15,color: Colors.white,)):emptySizeBox(),
                      ),
                    )
                  ],
                ),
              ),
            ),
            TextView(
              text: interestModel?.title ?? "",
              textStyle: textStyleHeadlineLarge().copyWith(fontSize: font_14),
            ),
            Row(crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                AssetImageWidget(
                  icUsers,
                  imageWidth: margin_15,imageHeight: margin_15,
                ),
                SizedBox(width: margin_5,),
                TextView(
                  text: "6392",
                  textStyle: textStyleHeadlineLarge().copyWith(fontSize: font_14,color: AppColors.appColor),
                ),
              ],
            )
          ]),
    );
  }
}
