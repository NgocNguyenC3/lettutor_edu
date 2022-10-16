import 'package:flutter/material.dart';
import 'package:lettutor_edu_clone/res/dimens.dart';
import 'package:lettutor_edu_clone/res/gen/colors.gen.dart';

class CircleIconWidget extends StatelessWidget {
  Widget child;
  CircleIconWidget({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 38.w,
      width: 38.w,
      padding: EdgeInsets.all(10.w),
      decoration: const BoxDecoration(
          shape: BoxShape.circle, color: ColorName.disabledColor),
      child: CircleAvatar(radius: 48.r, child: child),
    );
  }
}
