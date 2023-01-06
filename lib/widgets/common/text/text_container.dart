// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:lettutor_edu_clone/res/colors/colors_core.dart';

import 'package:lettutor_edu_clone/res/dimens.dart';
import 'package:lettutor_edu_clone/res/gen/colors.gen.dart';
import 'package:lettutor_edu_clone/res/theme/text_theme.dart';

class TextContainer extends StatelessWidget {
  String title;
  double? radius;
  bool isSelect;
  Color? color;
  Color? borderColor;
  Color? textColor;

  Function()? onTap;

  TextContainer({
    Key? key,
    required this.title,
    this.radius,
    this.isSelect = false,
    this.color,
    this.borderColor,
    this.textColor,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 5.0.w, horizontal: 10.w),
        decoration: BoxDecoration(
            color: isSelect ? primaryColor : color ?? ColorName.greyColor,
            border:
                Border.all(color: borderColor ?? color ?? ColorName.greyColor),
            borderRadius: BorderRadius.circular(radius ?? 10.0.r)),
        child: Text(
          title,
          style: text12.copyWith(color: isSelect ? Colors.white : textColor),
        ),
      ),
    );
  }
}
