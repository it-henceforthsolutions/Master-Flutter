/*
 * @copyright : Henceforth Pvt. Ltd. <info@henceforthsolutions.com>
 * @author     : Gaurav Negi
 * All Rights Reserved.
 * Proprietary and confidential :  All information contained herein is, and remains
 * the property of Henceforth Pvt. Ltd. and its partners.
 * Unauthorized copying of this file, via any medium is strictly prohibited.
 *
 */

import 'package:engagely/app/core/values/app_constants.dart';
import 'package:engagely/app/modules/other_user_profile/models/comment_model.dart';

import '../../../core/base/base_controller.dart';
import '../../../core/values/app_assets.dart';

class CommentController extends BaseController {
  bool isShow= false;

  List<CommentModel> listData = <CommentModel>[
    CommentModel(
        imagePath: iconsIcUser,
        title: 'Jessie Pinkmen 👑',
        postData:
            'Aliquam felis urna, feugiat ac tincidunt id, ultrices eget orci.',
        daysAgo: '20 hrs ago',
        replies: [
          CommentModel(
              imagePath: iconsIcUser,
              title: 'Jessie Pinkmen 👑',
              type: typeReply,
              postData:
                  'Aliquam felis urna, feugiat ac tincidunt id, ultrices eget orci.',
              daysAgo: '20 hrs ago',
              replies: [
                CommentModel(
                  imagePath: iconsIcUser,
                  title: 'Jessie Pinkmen 👑',
                  type: typeReply,
                  postData:
                      'Aliquam felis urna, feugiat ac tincidunt id, ultrices eget orci.',
                  daysAgo: '20 hrs ago',
                ),
                CommentModel(
                  imagePath: iconsIcUser,
                  title: 'Jessie Pinkmen 👑',
                  type: typeReply,
                  postData:
                  'Aliquam felis urna, feugiat ac tincidunt id, ultrices eget orci.',
                  daysAgo: '20 hrs ago',
                ),
              ]),
          CommentModel(
              imagePath: iconsIcUser,
              title: 'Jessie Pinkmen 👑',
              type: typeReply,
              postData:
                  'Aliquam felis urna, feugiat ac tincidunt id, ultrices eget orci.',
              daysAgo: '20 hrs ago',
              replies: [
                CommentModel(
                  imagePath: iconsIcUser,
                  title: 'Jessie Pinkmen 👑',
                  type: typeReply,
                  postData:
                      'Aliquam felis urna, feugiat ac tincidunt id, ultrices eget orci.',
                  daysAgo: '20 hrs ago',
                )
              ]),
        ]),

  ];

  int seletedIndex = 0;

  @override
  void onInit() {
    super.onInit();
  }
}
