


/*
 * @copyright : Henceforth Pvt. Ltd. <info@henceforthsolutions.com>
 * @author     : Gaurav Negi
 * All Rights Reserved.
 * Proprietary and confidential :  All information contained herein is, and remains
 * the property of Henceforth Pvt. Ltd. and its partners.
 * Unauthorized copying of this file, via any medium is strictly prohibited.
 *
 */

import '../../export.dart';

// ignore: must_be_immutable
class LogOutDialogWidget extends StatelessWidget {
  final String title;
  final String description;
  final Function()? onYesPressed;

  LogOutDialogWidget({
    Key? key,
    required this.title,
    required this.description,
    this.onYesPressed,
  }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Obx(() => Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Container(
            width: Get.width,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.transparent,),
                color: Colors.white,
                borderRadius: BorderRadius.circular(margin_5)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _dialogTitle(),
                _logoutSubTitle(),
              ],
            ).marginAll(margin_20)),
        _dialogButton()
      ],
    ).marginAll(margin_10));
  }

  Widget _dialogTitle() => TextView(
    text:   title,
        textStyle: textStyleDisplayLarge().copyWith(color: Colors.black,),
        textAlign: TextAlign.start,
      ).paddingOnly(bottom: margin_10);

  Widget _logoutSubTitle() => TextView(
    text:  description,
        maxLines: 3,
        textStyle: textStyleTitleMedium().copyWith(color: Colors.black,),
        textAlign: TextAlign.start,
      ).paddingOnly(bottom: margin_10);

  Widget _dialogButton() {
    return Row(
      children: [
        noButton(),
        SizedBox(width: margin_15),
        yesButton(),
      ],
    ).marginOnly(top: margin_10, bottom: margin_20);
  }

  yesButton() {
    return Expanded(
        child: MaterialButtonWidget(
          onPressed: onYesPressed,
          buttonRadius: margin_5,
          buttonBgColor: Colors.white,
          textColor :Colors.black,
          buttonText: "Yes",
        ));
  }

  noButton() {
    return Expanded(
        child: MaterialButtonWidget(
          onPressed: () {
            Get.back();
          },
          buttonRadius: margin_5,
          buttonBgColor:Colors.white,
          textColor : Colors.black,
          buttonText: "NO",
        ));
  }
}
