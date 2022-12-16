// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:lettutor_edu_clone/res/colors/colors_core.dart';
import 'package:lettutor_edu_clone/res/theme/text_theme.dart';

class IconText extends StatelessWidget {
  String title;
  Function()? onTap;
  IconData iconData;
  Color? color;
  IconText({
    Key? key,
    required this.title,
    this.onTap,
    required this.iconData,
    this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Column(
        children: [
          Icon(
            iconData,
            size: 30,
            color: color ?? primaryColor,
          ),
          Text(
            title,
            style: text16.copyWith(color: primaryColor),
          )
        ],
      ),
    );
  }
}
