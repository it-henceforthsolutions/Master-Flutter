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
import 'package:country_calling_code_picker/functions.dart';

import '../../export.dart';

class CountryPicker extends StatelessWidget {
  final Country? selectedCountry;
  final bool? showFlag;
  final returnCountry;
  final textColor;
  final bool? isTapEnable;

  CountryPicker({
    Key? key,
    this.selectedCountry,
    this.showFlag = true,
    this.returnCountry,
    this.textColor,
    this.isTapEnable = true,
  }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Container(
          padding: EdgeInsets.symmetric(vertical: margin_9),
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(radius_10),
              border: Border.all(color: Colors.grey.shade300)),
          child: InkWell(
            onTap: isTapEnable == true
                ? () {
                    showCountryPicker();
                  }
                : () {},
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextView(
                    text: selectedCountry!.countryCode,
                    maxLines: 2,
                    textStyle: textStyleBodyLarge().copyWith(
                      color: textColor ?? (Colors.black),
                      fontWeight: FontWeight.w500,
                    )).paddingOnly(left: margin_8),
                TextView(
                    text: selectedCountry!.callingCode,
                    textStyle: textStyleBodyLarge().copyWith(
                      color: textColor ??
                           Colors.black,
                      fontWeight: FontWeight.w500,
                    )).paddingOnly(left: margin_8),
                Icon(
                  Icons.arrow_drop_down,
                  color: textColor ??
                      Colors.black,
                )
              ],
            ).paddingOnly(left: margin_10, right: margin_6),
          ),
        );
  }

  void showCountryPicker() async {
    final country = await showCountryPickerSheet(Get.context!,
        cornerRadius: 25,
        focusSearchBox: true,
        cancelWidget: Positioned(
            right: 1.0,
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal:margin_20,
              ),
              child: InkWell(
                  onTap: () {
                    Get.back();
                  },
                  child: TextView(
                    text: strCancel,
                    textStyle: textStyleBodyLarge().copyWith(
                        color:  Colors.black),
                  )),
            )));
    if (country != null) {
      // print(country.);
      returnCountry(country);
    }
  }
}
