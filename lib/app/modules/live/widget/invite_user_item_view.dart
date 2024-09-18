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

class UserInviteItemView extends StatelessWidget {
  const UserInviteItemView({super.key});


  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        AssetImageWidget(
          icProfileUser,
          imageHeight: margin_42,
          imageWidth: margin_42,
        ),
        SizedBox(
          width: margin_10,
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              TextView(
                  text: "Sophie Qwens",
                  textStyle: textStyleHeadlineLarge()
                      .copyWith(fontSize: font_14, color: Colors.black)),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  AssetImageWidget(
                    icUsers,
                    imageWidth: margin_15,
                    imageHeight: margin_15,
                  ),
                  SizedBox(
                    width: margin_5,
                  ),
                  TextView(
                    text: "6392",
                    textStyle: textStyleHeadlineLarge()
                        .copyWith(fontSize: font_12, color: AppColors.appColor),
                  ),
                ],
              )
            ],
          ),
        ),
        SizedBox(
          width: margin_10,
        ),
        _followButton()
      ],
    );
  }

  Widget _followButton() => ButtonWidget(
    onTap: () {},
    child: Container(
      width: margin_75,
      margin: EdgeInsets.only(right: margin_5),
      padding:
      EdgeInsets.symmetric(horizontal: margin_5, vertical: margin_6),
      decoration: BoxDecoration(
          border: Border.all(color: AppColors.appColor),
          color:AppColors.whiteColor,
          borderRadius: BorderRadius.circular(margin_5)),
      child: Center(
        child: TextView(
            text: strInviteView,
            textStyle: textStyleBodyMedium().copyWith(
                color:  AppColors.appColor,
                fontWeight: FontWeight.w600)),
      ),
    ),
  );
}


