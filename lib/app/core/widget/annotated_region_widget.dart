


/*
 * @copyright : Henceforth Pvt. Ltd. <info@henceforthsolutions.com>
 * @author     : Gaurav Negi
 * All Rights Reserved.
 * Proprietary and confidential :  All information contained herein is, and remains
 * the property of Henceforth Pvt. Ltd. and its partners.
 * Unauthorized copying of this file, via any medium is strictly prohibited.
 *
 */

import 'package:engagely/app/core/widget/colored_safe_area_widget.dart';

import '../../export.dart';

class AnnotatedRegionWidget extends StatelessWidget {
  final Widget child;
  final Color statusBarColor;
  final Color bottomColor;
  final Brightness statusBarBrightness;

  const AnnotatedRegionWidget(
      {Key? key,
      required this.child,
      this.statusBarColor = Colors.black,
      this.bottomColor = Colors.white,
      required this.statusBarBrightness})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light.copyWith(
            statusBarColor: statusBarColor,
            statusBarBrightness: statusBarBrightness == Brightness.dark
                ? Brightness.light
                : Brightness.dark, // ios
            statusBarIconBrightness: statusBarBrightness),
        child: ColoredSafeArea(
          topColor: statusBarColor,bottomColor: bottomColor,
          child: child,
        ));
  }


}
