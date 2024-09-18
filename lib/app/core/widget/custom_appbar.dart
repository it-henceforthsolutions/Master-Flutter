/*
 * @copyright : Henceforth Pvt. Ltd. <info@henceforthsolutions.com>
 * @author     : Gaurav Negi
 * All Rights Reserved.
 * Proprietary and confidential :  All information contained herein is, and remains
 * the property of Henceforth Pvt. Ltd. and its partners.
 * Unauthorized copying of this file, via any medium is strictly prohibited.
 *
 */

import '../../export.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String? appBarTitleText;
  final actionWidget;
  final actions;
  final titleView;
  final Color? bgColor;
  final Color? backIconColor;
  final bool? isDrawerIcon;
  final bool? isCustom;
  final bool? isbackIcon;
  final bool? isDecoration;
  final bool? isAuthentication;
  final Function? onTap;

  CustomAppBar({
    Key? key,
    this.appBarTitleText,
    this.onTap,
    this.actions,
    this.titleView,
    this.isDecoration,
    this.isbackIcon,
    this.actionWidget,
    this.isDrawerIcon = false,
    this.isCustom = false,
    this.isAuthentication = false,
    this.backIconColor,
    this.bgColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return isCustom == false
        ? AppBar(
              elevation:elevation_5,
              toolbarHeight: height_65,
              leading: isDrawerIcon == true ? _menuIcon() : _backIcon(),
              centerTitle: true,
              title: appBarTitleText != "" || appBarTitleText != null
                  ? TextView(
                text: appBarTitleText ?? "",
                      textAlign: TextAlign.center,
                      textStyle: textStyleHeadlineMedium().copyWith(
                          fontWeight: FontWeight.w500,
                          color: AppColors.screenHeadingColor),
                    ).paddingOnly(top: margin_10)
                  : Container(
                      height: 0,
                      width: 0,
                    ),
              shadowColor: Colors.transparent,
              backgroundColor: Colors.white,
              actions: actionWidget ?? [],
            )
        : _customAppBar();
  }

  _customAppBar() {
    return Container(
      child: titleView ??
        Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              InkWell(
                  radius: radius_50,
                  onTap: () {
                    Get.back(result: true);
                  },
                  child: isbackIcon==true?AssetImageWidget(icBackIcon,imageHeight: height_60,):Icon(
                    Icons.arrow_back,
                    size: height_22,

                  ).paddingOnly(
                      left: margin_20,
                      right: margin_5,
                      bottom: margin_5)),
              appBarTitleText != "" || appBarTitleText != null
                  ? Expanded(
                      child: TextView(
                        text: appBarTitleText ?? "",
                        textAlign: TextAlign.center,
                        textStyle: textStyleHeadlineMedium()
                            .copyWith(fontWeight: FontWeight.w700),
                      ).paddingOnly(top: margin_5, left: margin_10),
                    )
                  : Container(
                      height: 0,
                      width: 0,
                    ),
              actions ??
                  Container(
                    width: Get.width * .12,
                  )
            ],
          )
    );
  }

  _backIcon() {
    return GetInkWell(
      child: Icon(Icons.arrow_back_ios_new_rounded).paddingAll(margin_0),
      onTap: () {
        if (onTap == null) {
          Get.back(result: true);
        } else {
          onTap!();
        }
      },
    ).marginOnly(left: margin_10);
  }

  _menuIcon() {
    return GetInkWell(
      onTap: onTap ?? () {},
      child: AssetImageWidget(
        iconsAppLogo,
        imageHeight: height_35,
      ).paddingSymmetric(horizontal: margin_10),
    );
  }

  @override
  Size get preferredSize =>
      Size.fromHeight(isCustom == false ? height_60 : height_65);
}
