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

class TabItemView extends StatelessWidget {
  final bool? isSelected;
  final String? title;
  const TabItemView({super.key, this.isSelected, this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding:
      EdgeInsets.symmetric(horizontal: margin_15, vertical: margin_8),
      decoration: BoxDecoration(
          color:isSelected==true? AppColors.appColor:Colors.white,
          borderRadius: BorderRadius.circular(margin_10)),
      child: Center(
        child: TextView(
            text:title,
            textStyle: textStyleHeadlineMedium().copyWith(fontSize: font_16,color: isSelected==true? Colors.white:Colors.black.withOpacity(.6))),
      ),
    );
  }
}

