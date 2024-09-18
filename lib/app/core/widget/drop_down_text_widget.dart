/*
 * @copyright : Henceforth Pvt. Ltd. <info@henceforthsolutions.com>
 * @author     : Gaurav Negi
 * All Rights Reserved.
 * Proprietary and confidential :  All information contained herein is, and remains
 * the property of Henceforth Pvt. Ltd. and its partners.
 * Unauthorized copying of this file, via any medium is strictly prohibited.
 *
 */

import 'package:engagely/app/modules/authentication/models/responseModel/save_data_update_model.dart';

import '../../export.dart';

class DropDownTextFieldWidget extends StatelessWidget {
  final String? hint;
  final bool? dropdownType;
  final dynamic selectedValue;
  final dynamic validate;
  final dynamic hintStyle;
  final dynamic focusNode;
  final dynamic labelTextStyle;
  final EdgeInsets? contentPadding;
  final Function(dynamic value)? onFieldSubmitted;
  final bool? isShadow;
  final List? items;
  final dynamic dropDownColor;
  final dynamic tvHeading;

  final List<OtherDoc>? docList;
  DropDownTextFieldWidget({
    this.hint,
    this.selectedValue,
    this.hintStyle,
    this.focusNode,
    this.labelTextStyle,
    this.validate,
    this.onFieldSubmitted,
    this.items,
    this.contentPadding,
    this.tvHeading,
    this.dropDownColor,
    this.isShadow = false,
    this.docList,
    this.dropdownType = false,
  });
  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        tvHeading != null
            ? TextView(
          text: tvHeading,
          textStyle: textStyleBodyLarge().copyWith(
              color: Colors.black.withOpacity(.5), fontSize: font_14,fontWeight: FontWeight.w500),
        ).marginOnly(bottom: margin_7)
            : emptySizeBox(),

        DropdownButtonHideUnderline(
          child: DropdownButton2<dynamic>(focusNode: focusNode,
            items: items
                ?.map((item) => DropdownMenuItem(
                    value: item, //item.sId.toString(),
                    child: TextView(
                      text: item, //item.city.toString(),
                      textStyle: textStyleTitleMedium().copyWith(
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                          fontSize: font_13),
                    )))
                .toList(),
            onChanged: onFieldSubmitted,
            style: textStyleTitleMedium().copyWith(
                fontWeight: FontWeight.w600,
                color:  Colors.black,
                fontSize: font_13),
            value: selectedValue != '' ? selectedValue : null,
            isExpanded: true,
            isDense: false,
            hint: TextView(
              text: hint ?? "",
              textStyle: textStyleBodyMedium()
                  .copyWith(color: Colors.grey.shade600, fontSize: font_14),
            ),
            iconStyleData: IconStyleData(
              icon: Icon(
                Icons.keyboard_arrow_down_rounded,
                color: Colors.grey,
                size: height_20,
              ),
            ),
            buttonStyleData: ButtonStyleData(
              width: Get.width,
              height: height_45,
              padding: const EdgeInsets.only(left: 14, right: 14),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(14),
                border: Border.all(
                  color: Colors.grey.shade300,
                ),
                color: Colors.white,
              ),
            ),
            dropdownStyleData: DropdownStyleData(
                maxHeight: Get.height * .4,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(radius_7),
                  border: Border.all(color: Colors.grey.shade600,width: margin_1),
                  color: Colors.grey.shade600,
                ),
                elevation: elevation_2.toInt(),
               ),

          ),
        ),
      ],
    );
  }
}
