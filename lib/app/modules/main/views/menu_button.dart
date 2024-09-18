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

class MenuButtonView extends StatelessWidget {
  final Function() onTapCreatePost;
  const MenuButtonView({super.key, required this.onTapCreatePost});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(backgroundColor: Colors.transparent,
        body: Container(
          height: 150,
          decoration: BoxDecoration(
              color: Colors.red, borderRadius: BorderRadius.circular(margin_15)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.end,
            mainAxisSize: MainAxisSize.min,
            children: [
              _createPost(),
            ],
          ),
        ),
      ),
    );
  }

  _createPost() => ButtonWidget(
        onTap: onTapCreatePost,
        child: Row(
          children: [
            AssetImageWidget(
              iconsPost,
              imageWidth: margin_30,
              imageHeight: margin_30,
            ),
            TextView(text: strCreatePost, textStyle: textStyleBodyMedium()),
          ],
        ),
      );
}
