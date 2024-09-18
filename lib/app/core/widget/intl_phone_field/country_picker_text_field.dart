import '../../../export.dart';
import 'countries.dart';
import 'intl_phone_field.dart';

class CountryPickerTextField extends StatelessWidget {
  final TextEditingController controller;
  final FocusNode? focusNode;
  final GlobalKey<IntlPhoneFieldState>? pickerKey;
  final String? hintText;
  final String? labelText;
  final TextStyle? inputTextStyle;
  final TextInputType? inputType;
  final TextInputAction? textInputAction;
  final double? contentPadding;
  final double? borderRadius;
  final bool showShadow;
  final bool showCountryFlag;
  final bool readOnly;
  final Widget? suffix;
  final Country? selectedCountry;
  final ValueChanged<Country>? onCountryChanged;


  const CountryPickerTextField(
      {Key? key,
      required this.controller,
      required this.hintText,
       this.pickerKey,
      this.labelText,
      this.inputTextStyle,
      this.contentPadding,
      this.borderRadius,
      this.inputType = TextInputType.text,
      this.textInputAction = TextInputAction.next,
      this.showShadow = false,
      this.showCountryFlag = false,
      this.readOnly = false,
      this.suffix,
      this.focusNode,
      required this.selectedCountry,
      required this.onCountryChanged})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AbsorbPointer(
      absorbing: readOnly,
      child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(
            radius_12,
          )),
          child: IntlPhoneField(
            controller: controller,
            focusNode: focusNode,
            key: pickerKey,
            inputFormatters: [FilteringTextInputFormatter.digitsOnly],
            textInputAction: textInputAction,
            invalidNumberMessage: strInvalidNumber,
            emptyFieldMessage: '$strPlsEnterYour phone number',
            decoration: _inputDecoration(),
            dropdownTextStyle: textStyleTitleSmall(),
            showCountryFlag: showCountryFlag,
            style: inputTextStyle ??
                textStyleTitleSmall().copyWith(fontWeight: FontWeight.w400),
            initialSelectedCountry: selectedCountry,
            dropdownIconPosition: IconPosition.trailing,
            onCountryChanged: onCountryChanged,
          )),
    );
  }

  InputDecoration _inputDecoration() {
    return InputDecoration(
      fillColor: Colors.white,
      counterText: '',
      filled: true,
      contentPadding: EdgeInsets.symmetric(
          vertical: margin_12, horizontal: contentPadding ?? margin_12),
      isDense: true,
      border: OutlineInputBorder(
        borderRadius:
            BorderRadius.all(Radius.circular(borderRadius ?? radius_2)),
        borderSide: BorderSide(
            color: AppColors.greyColor.withOpacity(0.6), width: margin_0point5),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius:
            BorderRadius.all(Radius.circular(borderRadius ?? radius_2)),
        borderSide: BorderSide(
            color: AppColors.greyColor.withOpacity(0.6), width: margin_0point5),
      ),
      disabledBorder: OutlineInputBorder(
        borderRadius:
            BorderRadius.all(Radius.circular(borderRadius ?? radius_2)),
        borderSide: BorderSide(
            color: AppColors.greyColor.withOpacity(0.6), width: margin_0point5),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius:
            BorderRadius.all(Radius.circular(borderRadius ?? radius_2)),
        borderSide: BorderSide(
            color: AppColors.greyColor.withOpacity(0.6), width: margin_0point5),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius:
            BorderRadius.all(Radius.circular(borderRadius ?? radius_2)),
        borderSide: BorderSide(
            color: AppColors.greyColor.withOpacity(0.6), width: margin_0point5),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius:
            BorderRadius.all(Radius.circular(borderRadius ?? radius_2)),
        borderSide: BorderSide(
            color: AppColors.greyColor.withOpacity(0.6), width: margin_0point5),
      ),
      hintText: hintText,
      hintStyle: textStyleBodyLarge().copyWith(color: AppColors.greyColor),
      suffixIcon: suffix,
    );
  }
}
