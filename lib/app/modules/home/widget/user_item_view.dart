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
import 'package:engagely/app/core/widget/switch_widget.dart';
import 'package:engagely/app/export.dart';

class UserItemView extends StatelessWidget {
  final int index;
  final String? type;
  const UserItemView({super.key, required this.index, this.type});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          height: height_42,
          width: height_43,
          child: Stack(
            children: [
              AssetImageWidget(
                icProfileUser,
                imageHeight: margin_42,
                imageWidth: margin_42,
              ),
             type==strLiveNotification?Align(
               alignment: Alignment.bottomRight,
               child: Container(decoration: BoxDecoration(color: Colors.white,borderRadius: BorderRadius.circular(margin_17)),
                 child: AssetImageWidget(
                   iconsIcFlag,
                   imageHeight: margin_15,
                   imageWidth: margin_15,radiusAll: margin_5,
                 ).marginAll(margin_3),
               ),
             ).marginAll(margin_2): index % 2 == 0
                  ? emptySizeBox()
                  : Align(
                      alignment: Alignment.bottomRight,
                      child: AssetImageWidget(
                        iconsMemberOption,
                        imageHeight: margin_15,
                        imageWidth: margin_15,
                      ).marginAll(margin_3),
                    ),
            ],
          ),
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
        type==strLiveNotification?CustomSwitch(onChanged: (data){

        },value: true,): _followButton(),
      ],
    );
  }

  Widget _followButton() => ButtonWidget(
        onTap: () {},
        child: Container(
          width: type == strBlocked?margin_100:margin_75,
          margin: EdgeInsets.only(right: margin_5),
          padding:
              EdgeInsets.symmetric(horizontal: margin_5, vertical: margin_6),
          decoration: BoxDecoration(
              border: Border.all(color: AppColors.appColor),
              color: type == strFriends
                  ? Colors.white
                  : type == strBlocked
                      ? AppColors.appColor
                      : index % 2 == 0
                          ? AppColors.appColor
                          : Colors.white,
              borderRadius: BorderRadius.circular(margin_5)),
          child: Center(
            child: TextView(
                text: type == strFriends
                    ? strRemove
                    : type == strBlocked
                        ? strUnBlocked
                        : index % 2 == 0
                            ? strFollow
                            : strRemove,
                textStyle: textStyleBodyMedium().copyWith(fontSize: font_12,
                    color: type == strFriends
                        ? AppColors.appColor
                        : type == strBlocked
                            ? AppColors.whiteColor
                            : index % 2 == 0
                                ? Colors.white
                                : AppColors.appColor,
                    fontWeight: FontWeight.w600)),
          ),
        ),
      );
}
