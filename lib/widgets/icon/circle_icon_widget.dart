// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:lettutor_edu_clone/res/colors/colors_core.dart';

import 'package:lettutor_edu_clone/res/dimens.dart';
import 'package:lettutor_edu_clone/res/gen/colors.gen.dart';

class CircleIconWidget extends StatelessWidget {
  Widget child;
  Color backgroundColor;
  Color borderColor;
  double width;
  double? padding;
  Function? onTap;
  CircleIconWidget(
      {Key? key,
      required this.child,
      this.backgroundColor = ColorName.white,
      this.borderColor = primaryColor,
      this.padding,
      this.onTap,
      this.width = 0.0})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onTap!();
      },
      child: Container(
        height: 38.w,
        width: 38.w,
        padding: padding == null ? null : EdgeInsets.all(padding!),
        decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: backgroundColor,
            border: Border.all(color: borderColor, width: width)),
        child: CircleAvatar(
          radius: 48.r,
          backgroundColor: backgroundColor,
          child: child,
        ),
      ),
    );
  }
}
