/*
 * @copyright : Henceforth Pvt. Ltd. <info@henceforthsolutions.com>
 * @author     : Gaurav Negi
 * All Rights Reserved.
 * Proprietary and confidential :  All information contained herein is, and remains
 * the property of Henceforth Pvt. Ltd. and its partners.
 * Unauthorized copying of this file, via any medium is strictly prohibited.
 *
 */

import '../../../core/values/app_constants.dart';

class CommentModel {
  String? title;
  String? postData;
  String? imagePath;
  String? daysAgo;
  int? type;
  bool isExpanded=false;
  List<CommentModel>? replies;

  CommentModel(
      {this.title,
      this.postData,
      this.imagePath,
      this.replies,
      this.daysAgo,
      this.type = typeMain});
}
