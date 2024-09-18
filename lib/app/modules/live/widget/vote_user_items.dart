
/*
 * @copyright : Henceforth Pvt. Ltd. <info@henceforthsolutions.com>
 * @author     : Gaurav Negi
 * All Rights Reserved.
 * Proprietary and confidential :  All information contained herein is, and remains
 * the property of Henceforth Pvt. Ltd. and its partners.
 * Unauthorized copying of this file, via any medium is strictly prohibited.
 *
 */


import 'package:engagely/app/core/widget/ripple.dart';
import 'package:engagely/app/export.dart';

class VoteuserItem extends StatelessWidget {
  final Function() onTap;
  const VoteuserItem({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
      AssetImageWidget(icProfileUser,imageHeight: margin_35,imageWidth: margin_35,),
      SizedBox(width: margin_10,),
      Expanded(
        child: TextView(text: "Sophie Qwens",textStyle: textStyleHeadlineLarge().copyWith(fontSize: font_14,color: Colors.black)),
      ),
    SizedBox(width: margin_10,),
        _voteButton(),
    ],);
  }

  Widget _voteButton() => ButtonWidget(
    onTap: onTap,
    child: Container(
      margin: EdgeInsets.only(right: margin_10),
      padding:
      EdgeInsets.symmetric(horizontal: margin_18, vertical: margin_6),
      decoration: BoxDecoration(
          color: AppColors.appColor,
          borderRadius: BorderRadius.circular(margin_5)),
      child: TextView(
          text: strVote,
          textStyle: textStyleBodyMedium()
              .copyWith(color: Colors.white, fontWeight: FontWeight.w600)),
    ),
  );
}

