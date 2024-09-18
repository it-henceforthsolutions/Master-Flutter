/*
 * @copyright : Henceforth Pvt. Ltd. <info@henceforthsolutions.com>
 * @author     : Gaurav Negi
 * All Rights Reserved.
 * Proprietary and confidential :  All information contained herein is, and remains
 * the property of Henceforth Pvt. Ltd. and its partners.
 * Unauthorized copying of this file, via any medium is strictly prohibited.
 *
 */

import 'package:engagely/app/modules/live/controller/invite_to_join_controller.dart';

import '../../../export.dart';

class InviteToJoinView extends StatelessWidget {
  const InviteToJoinView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
        init: InviteToJoinController(),
        builder: (controller) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _notchView(),
              _heading(),
              _searchEditText(),
            ],
          ).marginSymmetric(horizontal: margin_15);
        });
  }

  Widget _notchView() => Center(
        child: Container(
          margin: EdgeInsets.symmetric(vertical: margin_15),
          width: margin_60,
          height: height_5,
          decoration: BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.circular(margin_5)),
        ),
      );

  Widget _heading() => TextView(
        text: strInvite,
        textStyle: textStyleBodyLarge().copyWith(
            color: Colors.black,
            fontSize: font_18,
            fontWeight: FontWeight.w600),
      ).marginOnly(top: margin_10);

  Widget _searchEditText() => TextFieldWidget(
          hint: strSearch,
          contentPadding: EdgeInsets.symmetric(
            vertical: margin_12,
          ),
          inputType: TextInputType.name,
          fillColor: Colors.grey.shade200,
          prefixIcon: Icon(
            Icons.search,
            color: Colors.black,
            size: margin_25,
          ).paddingOnly(left: margin_10),
          inputAction: TextInputAction.next,
          decoration: OutlineInputBorder(
              borderRadius: BorderRadius.circular(radius_30),
              borderSide: BorderSide(color: Colors.grey.shade200)),
        ).marginSymmetric(vertical: margin_15);
}
