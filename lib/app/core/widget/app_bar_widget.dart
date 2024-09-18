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

class AppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  final String? appBarTitleText;
  final actionWidget;
  final customActions;
  final titleView;
  final bottomWidget;
  final Color? bgColor;
  final Color? backIconColor;
  final bool? isDrawerIcon;
  final bool? isCustom;
  final bool isbackIcon;
  final bool? isDecoration;
  final bool centerTitle;
  final bool? isAuthentication;
  final Function? onTap;

  AppBarWidget({
    Key? key,
    this.appBarTitleText,
    this.onTap,
    this.customActions,
    this.titleView,
    this.isDecoration,
    this.bottomWidget,
    this.isbackIcon = true,
    this.actionWidget,
    this.isDrawerIcon = false,
    this.centerTitle = true,
    this.isCustom = true,
    this.isAuthentication = false,
    this.backIconColor,
    this.bgColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return isCustom == true
        ? _customAppBar()
        : PreferredSize(
            preferredSize:
                Size.fromHeight(bottomWidget != null ? height_80 : height_55),
            child: Container(
                decoration: BoxDecoration(boxShadow: [
                  BoxShadow(
                    color: Colors.grey.shade300,
                    offset: const Offset(0, 2.0),
                    blurRadius: 2.0,
                  )
                ]),
                child: AppBar(
                  elevation: 0.0,
                  centerTitle: centerTitle,
                  titleSpacing: 0,
                  shadowColor: Colors.grey.shade200,
                  flexibleSpace: Container(
                    decoration: BoxDecoration(
                      color: bgColor,
                    ),
                  ),
                  bottom: bottomWidget,
                  leadingWidth: isbackIcon == true ? null : 0,
                  leading: (isbackIcon == false
                      ? const SizedBox()
                      : InkWell(
                          onTap: () {
                            Get.back(result: true);
                          },
                          child: Icon(
                            Icons.arrow_back_ios_new_rounded,
                            color: backIconColor ?? Colors.black,
                            size: height_15,
                          ).paddingOnly(right: margin_12, left: margin_15))),
                  title: (titleView ??
                      ((appBarTitleText != "" || appBarTitleText != null)
                          ? Text(
                              appBarTitleText ?? "",
                              textAlign: TextAlign.start,
                              style: textStyleHeadlineMedium()
                                  .copyWith(fontWeight: FontWeight.w600),
                            )
                          : const SizedBox())),
                  actions: [(actionWidget ?? const SizedBox())],
                )));
  }

  _customAppBar() {
    return Container(
      decoration: BoxDecoration(color: bgColor ?? AppColors.whiteColor),
      child: Container(
          decoration: BoxDecoration(
            color: bgColor ?? Colors.white,
            boxShadow: [
              BoxShadow(
                  color: Colors.grey.shade300,
                  offset: const Offset(0.0, 2.0),
                  blurRadius: 3.0 //(x,y)

                  ),
            ],
          ),
          padding: EdgeInsets.only(bottom: margin_15),
          child: SafeArea(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InkWell(
                    radius: radius_50,
                    onTap: () {
                      Get.back(result: true);
                    },
                    child: isbackIcon == true
                        ? AssetImageWidget(
                            icBackIcon,
                            imageHeight: height_60,
                          ).paddingOnly(top: margin_10)
                        : const SizedBox()),
                Expanded(
                    child: (titleView ??
                        (appBarTitleText != "" || appBarTitleText != null
                            ? TextView(
                                text: appBarTitleText,
                                textAlign: TextAlign.center,
                                textStyle: textStyleHeadlineMedium().copyWith(
                                    fontWeight: FontWeight.w500,
                                    fontSize: font_18))
                            : const SizedBox()))),
                customActions ?? const SizedBox()
              ],
            ),
          )),
    );
  }

  @override
  Size get preferredSize =>
      Size.fromHeight(bottomWidget != null ? height_80 : height_55);
}
