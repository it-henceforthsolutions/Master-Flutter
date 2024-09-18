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
import 'package:engagely/app/export.dart';
import 'package:engagely/app/modules/settings/controller/creator_center_controller.dart';
import 'package:engagely/app/modules/settings/controller/pricing_controller.dart';
import 'package:engagely/app/modules/settings/controller/privacy_controller.dart';
import 'package:engagely/app/modules/settings/models/request_models/account_information_model.dart';
import 'package:engagely/app/modules/settings/widgets/privacy_item_view.dart';
import 'package:engagely/app/modules/settings/widgets/settings_item_view.dart';

class PricingView extends BaseView<PricingController> {
  PricingView({super.key});

  @override
  PreferredSizeWidget? appBar(BuildContext context) {
    return AppBarWidget(
      appBarTitleText: strPricing,
      isCustom: false,
      bgColor: Colors.white,
      isbackIcon: true,
    );
  }

  @override
  Widget body(BuildContext context) {
    return Column(
      children: [
        _body(),
        _doneButton(),
      ],
    );
  }

  Widget _body() => Expanded(
        child: SingleChildScrollView(
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            _pricingYourChatHeading(),
            _pricingChatDescption(),
            _pricingEditTextField(),
            _pricingYourVideoHeading(),
            _pricingVideoDescption(),
            _pricingVideoEditTextField(),
          ]).marginSymmetric(horizontal: margin_15, vertical: margin_15),
        ),
      );

  Widget _pricingYourChatHeading() => TextView(
        text: strPriceYourChat,
        textStyle: textStyleBodyLarge()
            .copyWith(fontWeight: FontWeight.w500, fontSize: font_16),
      );

  Widget _pricingChatDescption() => TextView(
        text: strPriceYourChatDes,
        maxLines: 5,
        textStyle: textStyleBodyLarge().copyWith(
            fontWeight: FontWeight.w400, fontSize: font_14, color: Colors.grey),
      ).marginOnly(top: margin_5);

  Widget _pricingEditTextField() => TextFieldWidget(
        hint: strEnterDiamond,
        prefixIcon: AssetImageWidget(iconsDianmod,
                imageWidth: margin_22, imageHeight: margin_22)
            .marginOnly(top: margin_2, left: margin_15, right: margin_10),
        textController: controller.chatPricingEditingController,
        inputType: TextInputType.name,
        inputAction: TextInputAction.next,
        formatter: [
          FilteringTextInputFormatter.allow(RegExp('[a-zA-Z]')),
        ],
      ).paddingOnly(top: margin_15);

  Widget _pricingYourVideoHeading() => TextView(
        text: strPriceYourVideoCall,
        textStyle: textStyleBodyLarge()
            .copyWith(fontWeight: FontWeight.w500, fontSize: font_16),
      ).marginOnly(top: margin_20);

  Widget _pricingVideoDescption() => TextView(
        text: strPriceYourVideoCallDes,
        maxLines: 5,
        textStyle: textStyleBodyLarge().copyWith(
            fontWeight: FontWeight.w400, fontSize: font_14, color: Colors.grey),
      ).marginOnly(top: margin_5);

  Widget _pricingVideoEditTextField() => TextFieldWidget(
        hint: strEnterDiamond,
        prefixIcon: AssetImageWidget(iconsDianmod,
                imageWidth: margin_22, imageHeight: margin_22)
            .marginOnly(top: margin_2, left: margin_15, right: margin_10),
        textController: controller.chatPricingEditingController,
        inputType: TextInputType.name,
        inputAction: TextInputAction.next,
        formatter: [
          FilteringTextInputFormatter.allow(RegExp('[a-zA-Z]')),
        ],
      ).paddingOnly(top: margin_15);

  Widget _doneButton() => Container(
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
                color: Colors.grey.shade300,
                offset: const Offset(0.0, -1.0),
                blurRadius: 3.0 //(x,y)
                ),
          ],
        ),
        padding: EdgeInsets.only(top: margin_10),
        child: MaterialButtonWidget(
          buttonBgColor: AppColors.appColor,
          onPressed: () {
            Get.back();
          },
          buttonText: strDone,
          textColor: Colors.white,
        )
            .paddingSymmetric(horizontal: margin_18,vertical: margin_10)
      );
}
