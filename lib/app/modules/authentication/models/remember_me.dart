

/*
 * @copyright : Henceforth Pvt. Ltd. <info@henceforthsolutions.com>
 * @author     : Gaurav Negi
 * All Rights Reserved.
 * Proprietary and confidential :  All information contained herein is, and remains
 * the property of Henceforth Pvt. Ltd. and its partners.
 * Unauthorized copying of this file, via any medium is strictly prohibited.
 *
 */

import 'package:country_calling_code_picker/country.dart';

class RememberMeModel {
  Country? countryCode;
  var contactNumber;
  var password;

  RememberMeModel(
      {this.countryCode, this.contactNumber, this.password});

  RememberMeModel.fromJson(Map<String, dynamic> json) {

    contactNumber = json['contact_number'];
    password = json['password'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};

    data['contact_number'] = contactNumber;
    data['password'] = password;
    return data;
  }
}
