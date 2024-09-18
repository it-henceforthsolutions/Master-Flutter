
/*
 * @copyright : Henceforth Pvt. Ltd. <info@henceforthsolutions.com>
 * @author     : Gaurav Negi
 * All Rights Reserved.
 * Proprietary and confidential :  All information contained herein is, and remains
 * the property of Henceforth Pvt. Ltd. and its partners.
 * Unauthorized copying of this file, via any medium is strictly prohibited.
 *
 */

class NearbyVehicleDataModel {
  int? id;
  String? title;
  var seats;
  String? imageFile;
  String? price;
  int? stateId;
  int? typeId;
  String? createdOn;
  int? createdById;

  NearbyVehicleDataModel(
      {this.id,
        this.title,
        this.seats,
        this.imageFile,
        this.price,
        this.stateId,
        this.typeId,
        this.createdOn,
        this.createdById});

  NearbyVehicleDataModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    seats = json['seats'];
    imageFile = json['image_file'];
    price = json['price'];
    stateId = json['state_id'];
    typeId = json['type_id'];
    createdOn = json['created_on'];
    createdById = json['created_by_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['seats'] = this.seats;
    data['image_file'] = this.imageFile;
    data['price'] = this.price;
    data['state_id'] = this.stateId;
    data['type_id'] = this.typeId;
    data['created_on'] = this.createdOn;
    data['created_by_id'] = this.createdById;
    return data;
  }
}