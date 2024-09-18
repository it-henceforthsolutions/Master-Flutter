/*
 * @copyright : Henceforth Pvt. Ltd. <info@henceforthsolutions.com>
 * @author     : Gaurav Negi
 * All Rights Reserved.
 * Proprietary and confidential :  All information contained herein is, and remains
 * the property of Henceforth Pvt. Ltd. and its partners.
 * Unauthorized copying of this file, via any medium is strictly prohibited.
 *
 */

class BookingDetailDataModel {
  int? id;
  String? title;
  String? pickup;
  String? destination;
  String? pickupLat;
  String? pickupLong;
  String? destinationLat;
  String? destinationLong;
  var driverId;
  int? carTypeId;
  var startTime;
  var endTime;
  int? totalMin;
  String? waitingTime;
  String? totalKm;
  var scheduleTime;
  int? paymentType;
  int? paymentStatus;
  String? reason;
  int? stateId;
  int? typeId;
  String? createdOn;
  int? createdById;
  String? invoiceUrl;
  int? otp;
  int? otpVerified;

  BookingDetailDataModel({this.id, this.title, this.pickup,
    this.destination, this.pickupLat, this.pickupLong, this.destinationLat,
    this.destinationLong, this.driverId, this.carTypeId, this.startTime,
    this.endTime, this.totalMin, this.waitingTime, this.totalKm,
    this.scheduleTime, this.paymentType, this.paymentStatus,
    this.reason, this.stateId, this.typeId, this.createdOn,
    this.createdById, this.invoiceUrl, this.otp, this.otpVerified,  });

  BookingDetailDataModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    pickup = json['pickup'];
    destination = json['destination'];
    pickupLat = json['pickup_lat'];
    pickupLong = json['pickup_long'];
    destinationLat = json['destination_lat'];
    destinationLong = json['destination_long'];
    driverId = json['driver_id'];
    carTypeId = json['car_type_id'];
    startTime = json['start_time'];
    endTime = json['end_time'];
    totalMin = json['total_min'];
    waitingTime = json['waiting_time'];
    totalKm = json['total_km'];
    scheduleTime = json['schedule_time'];
    paymentType = json['payment_type'];
    paymentStatus = json['payment_status'];
    reason = json['reason'];
    stateId = json['state_id'];
    typeId = json['type_id'];
    createdOn = json['created_on'];
    createdById = json['created_by_id'];
    invoiceUrl = json['invoice_url'];
    otp = json['otp'];
    otpVerified = json['otp_verified'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['pickup'] = this.pickup;
    data['destination'] = this.destination;
    data['pickup_lat'] = this.pickupLat;
    data['pickup_long'] = this.pickupLong;
    data['destination_lat'] = this.destinationLat;
    data['destination_long'] = this.destinationLong;
    data['driver_id'] = this.driverId;
    data['car_type_id'] = this.carTypeId;
    data['start_time'] = this.startTime;
    data['end_time'] = this.endTime;
    data['total_min'] = this.totalMin;
    data['waiting_time'] = this.waitingTime;
    data['total_km'] = this.totalKm;
    data['schedule_time'] = this.scheduleTime;
    data['payment_type'] = this.paymentType;
    data['payment_status'] = this.paymentStatus;
    data['reason'] = this.reason;
    data['state_id'] = this.stateId;
    data['type_id'] = this.typeId;
    data['created_on'] = this.createdOn;
    data['created_by_id'] = this.createdById;
    data['invoice_url'] = this.invoiceUrl;
    data['otp'] = this.otp;
    data['otp_verified'] = this.otpVerified;
    return data;
  }
}