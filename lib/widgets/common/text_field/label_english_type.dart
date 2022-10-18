import 'package:flutter/material.dart';
import 'package:lettutor_edu_clone/res/dimens.dart';
import 'package:lettutor_edu_clone/res/gen/colors.gen.dart';
import 'package:lettutor_edu_clone/res/theme/text_theme.dart';

class LabelEnglishType extends StatelessWidget {
  String content;
  LabelEnglishType({
    Key? key,
    required this.content,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(1.w),
      decoration: BoxDecoration(
          color: ColorName.greyColor,
          borderRadius: BorderRadius.circular(5.0.r)),
      child: Row(mainAxisSize: MainAxisSize.min, children: [
        Text(
          content,
          style: text14,
        ),
        SizedBox(
          width: 10.w,
        ),
        const Icon(
          Icons.close,
          size: 15,
        )
      ]),
    );
  }
}
