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
import 'package:engagely/app/modules/live/controller/player_vs_player_module/vote_user_controller.dart';
import 'package:engagely/app/modules/live/widget/vote_user_items.dart';

class VoteuserView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder(
        init: VoteUserController(),
        builder: (controller) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _notchView(),
              _voteUserList(),
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

  _voteUserList() => Expanded(
      child: ListView.builder(
          itemCount: 3, itemBuilder: (context, index) => VoteuserItem(onTap: (){
            Get.back();
      },).paddingOnly(bottom: margin_12)));
}
