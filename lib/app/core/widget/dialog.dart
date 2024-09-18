import 'package:flutter/material.dart';
import 'package:engagely/app/core/values/app_values.dart';
import 'package:engagely/app/core/values/text_styles.dart';
import 'package:engagely/app/core/widget/button_widget.dart';
import 'package:engagely/app/core/widget/text_view.dart';
import 'package:get/get.dart';

import '../values/app_colors.dart';

class DialogWidget extends StatelessWidget {
  final Function()? onTapDone;
  final Function()? onTapDismiss;
  final String? heading;
  final String? subHeading;

  const DialogWidget({
    Key? key,
    this.onTapDone,
    this.onTapDismiss,
    this.heading,
    this.subHeading,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(margin_25),
              topLeft: Radius.circular(margin_25)),
          color: Colors.white),
      padding: EdgeInsets.symmetric(horizontal: margin_15, vertical: margin_15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Center(
              child: Container(
            width: 150.0,
            alignment: Alignment.center,
            height: margin_5,
            decoration: BoxDecoration(
                color: AppColors.appColor,
                borderRadius: const BorderRadius.all(Radius.circular(5.0)),
                border: Border.all(color: AppColors.appColor)),
          )),
          SizedBox(
            height: margin_15,
          ),
          TextView(
              text: heading ?? "",
              textAlign: TextAlign.center,
              textStyle: textStyleBodyMedium()
                  ?.copyWith(fontSize: margin_22, fontWeight: FontWeight.w500)),
          SizedBox(
            height: margin_10,
          ),
          TextView(
            text: subHeading!,
            textStyle: textStyleBodyMedium().copyWith(fontSize: margin_18),
          ),
          SizedBox(
            height: margin_10,
          ),
          Row(
            children: [
              Expanded(
                child: MaterialButtonWidget(
                  onPressed: onTapDismiss,
                  buttonText: "No",
                  textColor: Colors.white,
                  buttonRadius: 5.0,
                ).marginSymmetric(vertical: 10.0),
              ),
              SizedBox(
                width: margin_15,
              ),
              Expanded(
                child: MaterialButtonWidget(
                  onPressed: onTapDone,
                  buttonText: "Yes",
                  textColor: Colors.white,
                  buttonRadius: 5.0,
                ).marginSymmetric(vertical: 10.0),
              ),
            ],
          )
        ],
      ),
    );
  }
}
