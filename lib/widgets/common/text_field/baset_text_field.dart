import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:lettutor_edu_clone/res/colors/colors_core.dart';
import 'package:lettutor_edu_clone/res/dimens.dart';
import 'package:lettutor_edu_clone/res/theme/text_theme.dart';

TextFormField baseTextField(
    {required Function(String) onChanged,
    required TextEditingController? controller,
    String hintText = '',
    void Function()? onTap,
    bool readOnly = false,
    bool isObscure = false,
    bool isPhone = false,
    int? maxLength,
    int maxLine = 1,
    Widget? icon,
    InputBorder? enabledBorder,
    InputBorder? focusedBorder,
    InputBorder? errorBorder,
    InputBorder? focusedErrorBorder,
    bool isOutline = false,
    FormFieldValidator<String>? validator}) {
  return TextFormField(
    onTap: onTap,

    readOnly: readOnly,
    inputFormatters: [
      LengthLimitingTextInputFormatter(maxLength),
    ],
    obscureText: isObscure,
    autovalidateMode: AutovalidateMode.onUserInteraction,
    controller: controller,
    textAlign: TextAlign.start,
    validator: validator,
    textCapitalization: TextCapitalization.words,
    keyboardType: isPhone ? TextInputType.phone : TextInputType.text,
    style: text12,
    //focusNode: focusNode,
    onChanged: onChanged,
    maxLines: maxLine,
    decoration: InputDecoration(
      hintStyle: text12.copyWith(color: Colors.grey),
      filled: true,
      fillColor: whiteColor,
      hintText: hintText,
      suffixIconConstraints: BoxConstraints(minHeight: 20.h, minWidth: 30.w),
      suffixIcon: Padding(
        padding: EdgeInsets.only(right: 8.0.w),
        child: icon,
      ),
      focusedBorder: focusedBorder ??
          (isOutline
              ? outLineInputBorder(width: 1, color: greyBorderColor)
              : underLineIntputBorder(width: 1, color: greyBorderColor)),
      enabledBorder: enabledBorder ??
          (isOutline
              ? outLineInputBorder(width: 1, color: greyBorderColor)
              : underLineIntputBorder(width: 1, color: greyBorderColor)),
      errorBorder: errorBorder ??
          (isOutline
              ? outLineInputBorder(width: 1, color: Colors.red)
              : underLineIntputBorder(width: 1, color: Colors.red)),
      focusedErrorBorder: focusedErrorBorder ??
          (isOutline
              ? outLineInputBorder(width: 1, color: Colors.red)
              : underLineIntputBorder(width: 1, color: Colors.red)),
      contentPadding: EdgeInsets.symmetric(
        horizontal: 15.w,
        vertical: 15.h,
      ),
      isDense: true,
    ),
  );
}

UnderlineInputBorder underLineIntputBorder(
    {required double width, required color}) {
  return UnderlineInputBorder(
    borderSide: BorderSide(color: color, width: width),
  );
}

OutlineInputBorder outLineInputBorder({required double width, required color}) {
  return OutlineInputBorder(
    borderSide: BorderSide(color: color, width: width),
  );
}

InkWell suffixIconRegister(
    {required void Function()? onTap, required RxBool rxPassword}) {
  return InkWell(
    onTap: onTap,
    child: Icon(rxPassword.value ? Icons.visibility : Icons.visibility_off),
  );
}
