/*
 * @copyright : Henceforth Pvt. Ltd. <info@henceforthsolutions.com>
 * @author     : Gaurav Negi
 * All Rights Reserved.
 * Proprietary and confidential :  All information contained herein is, and remains
 * the property of Henceforth Pvt. Ltd. and its partners.
 * Unauthorized copying of this file, via any medium is strictly prohibited.
 *
 */

class ImageData {
  String? baseUrl;
  String? type;
  List<String>? folders;
  String? fileName;

  ImageData({this.baseUrl, this.type, this.folders, this.fileName});

  ImageData.fromJson(Map<String, dynamic> json) {
    baseUrl = json['base_url'];
    type = json['type'];
    folders = json['folders'].cast<String>();
    fileName = json['file_name'];
  }
}
