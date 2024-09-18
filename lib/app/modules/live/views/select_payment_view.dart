/*
 * @copyright : Henceforth Pvt. Ltd. <info@henceforthsolutions.com>
 * @author     : Gaurav Negi
 * All Rights Reserved.
 * Proprietary and confidential :  All information contained herein is, and remains
 * the property of Henceforth Pvt. Ltd. and its partners.
 * Unauthorized copying of this file, via any medium is strictly prohibited.
 *
 */

/*
 * @copyright : Henceforth Pvt. Ltd. <info@henceforthsolutions.com>
 * @author     : Gaurav Negi
 * All Rights Reserved.
 * Proprietary and confidential :  All information contained herein is, and remains
 * the property of Henceforth Pvt. Ltd. and its partners.
 * Unauthorized copying of this file, via any medium is strictly prohibited.
 *
 */

import 'package:engagely/app/core/widget/app_bar_widget.dart';
import 'package:engagely/app/core/widget/ripple.dart';
import 'package:engagely/app/modules/live/controller/select_payment_controller.dart';
import 'package:engagely/app/modules/live/widget/payment_item.dart';

import '../../../export.dart';

class SelectPaymentView extends BaseView<SelectPaymentController> {
  SelectPaymentView({super.key});

  @override
  PreferredSizeWidget? appBar(BuildContext context) {
    return AppBarWidget(
      appBarTitleText: strSelectPayment,
      isCustom: false,bgColor: Colors.white,isbackIcon: true,
    );
  }

  @override
  Widget body(BuildContext context) {
    return Column(
      children: [
        totalPaymentView(),
        _paymentMethodOtpion(),
        _divider(),
      ],
    );
  }

  totalPaymentView() => Container(
      width: Get.width,
      padding:
          EdgeInsets.only(left: margin_15, top: margin_20, bottom: margin_20),
      decoration: BoxDecoration(
          color: AppColors.creamColor.withOpacity(.7),
          borderRadius: BorderRadius.all(Radius.circular(margin_10))),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _totalPaymentAmount(),
          _amount(),
        ],
      ));
  _totalPaymentAmount() => TextView(
      text: strTotalPayableAmount,
      textStyle: textStyleBodyLarge().copyWith(
          color: AppColors.darkGreyColor.withOpacity(.7),
          fontSize: font_16,
          fontWeight: FontWeight.w600));

  _amount() => TextView(
          text: "\$800",
          textStyle: textStyleBodyLarge().copyWith(
              color: AppColors.appColor,
              fontSize: font_16,
              fontWeight: FontWeight.w600))
      .marginOnly(right: margin_15);

  _paymentMethodOtpion() => Expanded(
      child: ListView.separated(separatorBuilder: (context,index)=>Divider(color: Colors.grey.shade200),
          itemCount: controller.listView.length,
          itemBuilder: (context, index) => ButtonWidget(onTap: (){
            Get.back(result: true);
          },
            child: PaymentItemView(
                  paymentMethod: controller.listView[index],
                ).paddingSymmetric(vertical: margin_15),
          )).paddingSymmetric(horizontal: margin_15));

  _divider()=>Divider(color: Colors.grey.shade200,);
}
