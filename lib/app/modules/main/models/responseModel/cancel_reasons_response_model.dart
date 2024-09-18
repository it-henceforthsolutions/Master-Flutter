/*
 * @copyright : Henceforth Pvt. Ltd. <info@henceforthsolutions.com>
 * @author     : Gaurav Negi
 * All Rights Reserved.
 * Proprietary and confidential :  All information contained herein is, and remains
 * the property of Henceforth Pvt. Ltd. and its partners.
 * Unauthorized copying of this file, via any medium is strictly prohibited.
 *
 */

import '../dataModel/cancel_reasons_data_model.dart';

class CancelReasonsResponseModel {
  List<CancelReasonsDataModel>? list;
  String? copyrighths;

  CancelReasonsResponseModel({this.list, this.copyrighths});

  CancelReasonsResponseModel.fromJson(Map<String, dynamic> json) {
    if (json['list'] != null) {
      list = <CancelReasonsDataModel>[];
      json['list'].forEach((v) {
        list!.add(new CancelReasonsDataModel.fromJson(v));
      });
    }
    copyrighths = json['copyrighths'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.list != null) {
      data['list'] = this.list!.map((v) => v.toJson()).toList();
    }
    data['copyrighths'] = this.copyrighths;
    return data;
  }
}



