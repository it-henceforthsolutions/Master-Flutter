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




class TextFieldWidget extends StatelessWidget {

  final String? hint;
  final String? tvHeading;

  final Color? fillColor;
  final Color? courserColor;
  final Color? borderColor;

  final validate;
  final hintStyle;
  final style;
  final EdgeInsets? contentPadding;
  final TextInputType? inputType;
  final TextEditingController? textController;
  final FocusNode? focusNode;
  final Function(String value)? onFieldSubmitted;
  final Function()? onTap;
  final TextInputAction? inputAction;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final Widget? prefix;
  final int? maxLines;
  final decoration;
  final int? minLine;
  final int? maxLength;
  final double? borderRadius;
  final bool readOnly;
  final bool? obscureText;
  final suffixIconConstraints;
  final Function(String value)? onChange;
  final List<TextInputFormatter>? formatter;

  TextFieldWidget({super.key,
    this.hint,
    this.tvHeading,
    this.inputType,
    this.textController,
    this.hintStyle,
    this.style,
    this.courserColor,
    this.validate,
    this.onChange,
    this.decoration,
    this.focusNode,
    this.prefix,
    this.readOnly = false,
    this.onFieldSubmitted,
    this.formatter,
    this.inputAction,
    this.contentPadding,
    this.maxLines ,
    this.minLine ,
    this.maxLength,
    this.borderRadius,
    this.borderColor,
    this.fillColor,
    this.suffixIcon,
    this.prefixIcon,
    this.suffixIconConstraints,
    this.obscureText,
    this.onTap,
  });
  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start,mainAxisAlignment: MainAxisAlignment.center,
      children: [
        tvHeading != null
            ? TextView(
          text: tvHeading,
          textStyle: textStyleBodyLarge().copyWith(
              color: Colors.black.withOpacity(.5), fontSize: font_14,fontWeight: FontWeight.w500),
        ).marginOnly(bottom: margin_7)
            : emptySizeBox(),
        TextFormField(
            readOnly: readOnly,
            onTap: onTap,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            obscureText: obscureText ?? false,
            controller: textController,
            focusNode: focusNode,
            keyboardType: inputType,
            maxLength: maxLength,
            onChanged: onChange,
            cursorColor: courserColor ?? AppColors.appBorderDarkColor,
            inputFormatters: formatter ??
                [
                  FilteringTextInputFormatter(
                      RegExp(
                          '(\u00a9|\u00ae|[\u2000-\u3300]|\ud83c[\ud000-\udfff]|\ud83d[\ud000-\udfff]|\ud83e[\ud000-\udfff])'),
                      allow: false)
                ],
            maxLines: maxLines ?? 1,
            minLines: minLine ?? 1,
            obscuringCharacter: "*",
            textInputAction: inputAction,
            onFieldSubmitted: onFieldSubmitted,
            validator: validate,
            style:style?? textStyleTitleMedium()
                .copyWith(fontWeight: FontWeight.w400, color:Colors.black,fontSize: font_14),
            decoration: inputDecoration()),
      ],
    );
  }

  inputDecoration() =>  InputDecoration(
    errorMaxLines: 2,
    hoverColor: AppColors.appBorderDarkColor,
    filled: true,
    isCollapsed: true,
    isDense: true,
    counterText: '',
    contentPadding: contentPadding ??
        EdgeInsets.symmetric(horizontal: margin_15, vertical: margin_15),
    prefixIcon: prefixIcon,
    prefixIconConstraints: BoxConstraints(maxWidth: margin_100,minWidth: margin_30),
    prefix: prefix,
    suffixIcon: suffixIcon,
    hintText: hint,
    hintStyle: hintStyle ??
        textStyleBodyMedium()
            .copyWith(color: Colors.grey.shade600,fontSize: font_14),
    labelText: "",
    floatingLabelBehavior: FloatingLabelBehavior.always,
    fillColor: fillColor ?? (Colors.white),
    border: decoration ??  OutlineInputBorder(
        borderRadius: BorderRadius.circular(borderRadius??  radius_10),
        borderSide: BorderSide(color: (borderColor?? Colors.grey.shade300))),
    focusedErrorBorder: decoration ??  OutlineInputBorder(
        borderRadius: BorderRadius.circular(borderRadius?? radius_10),
        borderSide: BorderSide(color: (borderColor?? Colors.grey.shade300))),
    errorBorder: decoration ?? OutlineInputBorder(
        borderRadius: BorderRadius.circular(borderRadius?? radius_10),
        borderSide: BorderSide(color:(borderColor?? Colors.grey.shade300))),
    focusedBorder: decoration ??  OutlineInputBorder(
        borderRadius: BorderRadius.circular(borderRadius?? radius_10),
        borderSide: BorderSide(color: (borderColor?? Colors.grey.shade300))),
    enabledBorder: decoration ??  OutlineInputBorder(
        borderRadius: BorderRadius.circular(borderRadius?? radius_10),
        borderSide: BorderSide(color: (borderColor?? Colors.grey.shade300))),
  );
}
