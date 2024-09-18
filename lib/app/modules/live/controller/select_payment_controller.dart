/*
 * @copyright : Henceforth Pvt. Ltd. <info@henceforthsolutions.com>
 * @author     : Gaurav Negi
 * All Rights Reserved.
 * Proprietary and confidential :  All information contained herein is, and remains
 * the property of Henceforth Pvt. Ltd. and its partners.
 * Unauthorized copying of this file, via any medium is strictly prohibited.
 *
 */


import 'package:engagely/app/core/base/base_controller.dart';
import 'package:engagely/app/export.dart';

class PaymentMethod{
  String? title;
  String? cardNumber;
  int? cardType;
  PaymentMethod({this.title,this.cardNumber,this.cardType});
}

class SelectPaymentController extends BaseController {
  RxList listView = <PaymentMethod>[

    PaymentMethod(title:strGooglePay,cardNumber: "",cardType: 1 ),
    PaymentMethod(title:strApplePay,cardNumber: "",cardType: 1 ),
    PaymentMethod(title:"Card No 1",cardNumber: "**** 78956",cardType: 2 ),
    PaymentMethod(title:strAddCreditCard,cardNumber: "",cardType: 3 ),

  ].obs;

}