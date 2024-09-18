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
import 'package:engagely/app/modules/live/controller/select_payment_controller.dart';

class PaymentItemView extends StatelessWidget {
  final PaymentMethod? paymentMethod;
  const PaymentItemView({super.key, this.paymentMethod});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
            child: paymentMethod?.cardType == 2
                ? Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextView(
                          text: paymentMethod?.title ?? "",
                          textStyle: textStyleBodyMedium().copyWith(
                              fontSize: font_14,
                              color: Colors.black,
                              fontWeight: FontWeight.w600)),
                      TextView(
                          text: paymentMethod?.cardNumber ?? "",
                          textStyle: textStyleBodyMedium().copyWith(
                              fontSize: font_14,
                              color: Colors.grey,
                              fontWeight: FontWeight.w500)),
                    ],
                  )
                : TextView(
                    text: paymentMethod?.title ?? "",
                    textStyle: textStyleBodyMedium().copyWith(
                        fontSize: font_14,
                        color: Colors.black,
                        fontWeight: FontWeight.w600))),
        paymentMethod?.cardType == 3
            ? Text(
                strAddCard,
                style: TextStyle(
                    fontSize: font_14,
                    decoration: TextDecoration.underline,
                    color: AppColors.appColor),
              )
            : Icon(
                Icons.arrow_forward_ios_sharp,
                color: AppColors.appColor,
                size: margin_15,
              )
      ],
    );
  }
}
