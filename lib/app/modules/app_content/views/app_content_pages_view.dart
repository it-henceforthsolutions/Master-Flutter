/*
 * @copyright : Henceforth Pvt. Ltd. <info@henceforthsolutions.com>
 * @author     : Gaurav Negi
 * All Rights Reserved.
 * Proprietary and confidential :  All information contained herein is, and remains
 * the property of Henceforth Pvt. Ltd. and its partners.
 * Unauthorized copying of this file, via any medium is strictly prohibited.
 *
 */

import 'package:engagely/app/core/widget/app_bar_widget.dart';
import 'package:engagely/app/export.dart';
import 'package:engagely/app/modules/app_content/controllers/app_content_controller.dart';

class AppContentView extends BaseView<AppContentController> {
  AppContentView({super.key});

  @override
  PreferredSizeWidget? appBar(BuildContext context) {
    return AppBarWidget(
      appBarTitleText: controller.pageTitile,
      isCustom: false,
      bgColor: Colors.white,
      isbackIcon: true,
    );
  }

  @override
  Widget body(BuildContext context) {
    return SingleChildScrollView(
      child: Column(children: [
        _imageView(),
        _textView(),
      ]).marginSymmetric(horizontal: margin_18, vertical: margin_20),
    );
  }

  Widget _imageView() => AssetImageWidget(
        iconsAboutImage,
        imageHeight: height_180,
      );

  Widget _textView() => TextView(maxLines: 15000,
      text:
          '''In tempus risus magna, ac aliquam turpis euismod et. Quisque suscipit nec neque eleifend dapibus. Vestibulum euismod, eros vel tincidunt vestibulum, leo purus luctus est, eget imperdiet diam magna suscipit turpis. Praesent auctor egestas sem, vitae scelerisque mi pulvinar quis. Etiam ornare molestie enim a tristique. Duis a massa lacus. Morbi id ultricies massa. Nam vitae ex placerat metus sodales aliquam.

Nam accumsan purus nisi, eu commodo diam dictum in. Donec efficitur dolor sit amet quam ornare fringilla. Mauris consectetur arcu ligula, vel fringilla est ultrices porttitor. Cras molestie ipsum eu massa suscipit, eu imperdiet orci posuere. Morbi quis augue in felis ultricies pretium. Nulla eu pellentesque quam, eu commodo elitDonec faucibus dolor congue, imperdiet nibh a, tristique eros. Aenean at nunc magna. Nam ut dolor sapien. Integer quis quam ultrices, tempus felis et, dapibus ex. Aliquam ac porta leo. In condimentum nibh nulla, eu convallis elit fringilla ultrices. Nulla ut magna nunc. Sed id nisi quis felis condimentum semper. Phasellus egestas maximus risus ac luctus. Ut vulputate diam sit amet euismod lobortis..''',
      textStyle: textStyleBodyMedium().copyWith(
          fontSize: font_14, color: Colors.grey, fontWeight: FontWeight.w600)).marginOnly(top: margin_10);
}
