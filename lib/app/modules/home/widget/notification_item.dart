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

class NotificationItemView extends StatelessWidget {
  final bool? isShow;
  final bool? focus;
  const NotificationItemView({super.key, this.isShow=true, this.focus=false});

  @override
  Widget build(BuildContext context) {
    return Container(decoration: BoxDecoration(color: isShow==false?Colors.white: AppColors.creamColor.withOpacity(.5),),
      padding: EdgeInsets.symmetric(horizontal: margin_10,vertical: margin_8),
      child: Row(
        children: [
          AssetImageWidget(icProfileUser,imageHeight: margin_42,imageWidth: margin_42,),
          SizedBox(width: margin_10,),
          Expanded(
            child: Column(crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                TextView(text: "Lorem ipsum dolor sit amet.",textStyle: textStyleHeadlineLarge().copyWith(fontSize: font_14,color: Colors.black)),
                TextView(
                  text: "03/13/2023",
                  textStyle: textStyleHeadlineLarge().copyWith(fontSize: font_10,color: AppColors.greyLightColor),
                ),
              ],),
          ),
          SizedBox(width: margin_10,),
          isShow==false?emptySizeBox(): Container(width: margin_8,height: margin_8,decoration: BoxDecoration(color: AppColors.appColor,borderRadius: BorderRadius.all(Radius.circular(margin_8))),)
        ],),
    );
  }


}

