/*
 * @copyright : Henceforth Pvt. Ltd. <info@henceforthsolutions.com>
 * @author     : Gaurav Negi
 * All Rights Reserved.
 * Proprietary and confidential :  All information contained herein is, and remains
 * the property of Henceforth Pvt. Ltd. and its partners.
 * Unauthorized copying of this file, via any medium is strictly prohibited.
 *
 */

import '../dataModel/booking_detail_data_model.dart';

class BookingDetailResponseModel {
  BookingDetailDataModel? detail;
  String? copyrighths;

  BookingDetailResponseModel({this.detail, this.copyrighths});

  BookingDetailResponseModel.fromJson(Map<String, dynamic> json) {
    detail = json['detail'] != null ? new BookingDetailDataModel.fromJson(json['detail']) : null;
    copyrighths = json['copyrighths'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.detail != null) {
      data['detail'] = this.detail!.toJson();
    }
    data['copyrighths'] = this.copyrighths;
    return data;
  }
}




