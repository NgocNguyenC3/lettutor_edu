// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:lettutor_edu_clone/res/dimens.dart';
import 'package:lettutor_edu_clone/res/theme/text_theme.dart';

class InputFieldProfile extends StatelessWidget {
  String title;
  bool isImportant;
  Widget child;
  InputFieldProfile({
    Key? key,
    required this.title,
    required this.child,
    this.isImportant = false,
  }) : super(key: key);
  @override
  Widget build(Object context) {
    return Column(
      children: [
        Row(
          children: [
            Text(
              title,
              style: text14,
              textAlign: TextAlign.start,
            ),
            SizedBox(
              width: 1.0.w,
            ),
            if (isImportant) const Icon(Icons.tag, color: Colors.red, size: 10)
          ],
        ),
        SizedBox(
          height: 8.h,
        ),
        child
      ],
    );
  }
}
