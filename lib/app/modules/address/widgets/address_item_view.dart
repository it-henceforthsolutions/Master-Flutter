/*
 * @copyright : Henceforth Pvt. Ltd. <info@henceforthsolutions.com>
 * @author     : Gaurav Negi
 * All Rights Reserved.
 * Proprietary and confidential :  All information contained herein is, and remains
 * the property of Henceforth Pvt. Ltd. and its partners.
 * Unauthorized copying of this file, via any medium is strictly prohibited.
 *
 */

import 'package:engagely/app/core/widget/ripple.dart';
import 'package:engagely/app/export.dart';

class AddressItemView extends StatelessWidget {
  final Function()? onTapEdit;
  final Function()? onTapDelete;
  final Function()? onTapDefault;
  final int? index;
  const AddressItemView(
      {super.key,this.index, this.onTapEdit, this.onTapDelete, this.onTapDefault});

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      _addressInformation(),
      _addressView(),
      _defaultAddress(),
    ]);
  }

  Widget _addressInformation() => Row(
        children: [
          Expanded(
            child: TextView(
                text: "Flat ${(index??0)+1}",
                textStyle: textStyleBodyLarge().copyWith(
                    color: Colors.black,
                    fontSize: font_16,
                    fontWeight: FontWeight.w600)),
          ),
          _addressActions()
        ],
      ).marginOnly(bottom: margin_5);

  Widget _addressActions() => Row(
        children: [_editAddress(), _deleteAddress()],
      );

  Widget _editAddress() => ButtonWidget(
        onTap: onTapEdit,
        child: AssetImageWidget(
          iconsPencils,
          imageHeight: height_15,
          imageWidth: height_15,
          color: Colors.black,
        ).marginOnly(right: margin_5),
      );

  Widget _deleteAddress() => ButtonWidget(
        onTap: onTapDelete,
        child: AssetImageWidget(
          iconsDelete,
          imageHeight: height_15,
          imageWidth: height_15,
        ),
      );

  Widget _addressView() => TextView(
      text: "71 Cherry Court Southampton SO53 5PD",
      textStyle: textStyleBodyLarge().copyWith(
          color: AppColors.greyLightColor,
          fontSize: font_14,
          fontWeight: FontWeight.w600));

  Widget _defaultAddress() => MaterialButtonWidget(
        onPressed: onTapDefault,

        isOutlined: true,verticalPadding: margin_5,buttonRadius: margin_5,
        borderColor: ((index??0)%2==0)?AppColors.appColor.withOpacity(.5):AppColors.appColor,
        buttonText: strSetAsDefault,
        textColor: ((index??0)%2==0)?AppColors.appColor.withOpacity(.5):AppColors.appColor,
        iconWidget: AssetImageWidget(iconsRotate,
            imageHeight: height_15, imageWidth: height_15,color: ((index??0)%2==0)?AppColors.appColor.withOpacity(.5):AppColors.appColor,).marginOnly(right: margin_5),
      ).marginSymmetric(vertical: margin_15);
}
