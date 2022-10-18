import 'package:flutter/material.dart';
import 'package:lettutor_edu_clone/res/colors/colors_core.dart';
import 'package:lettutor_edu_clone/res/constants/local_string.dart';
import 'package:lettutor_edu_clone/res/dimens.dart';
import 'package:lettutor_edu_clone/res/theme/text_theme.dart';
import 'package:lettutor_edu_clone/widgets/common/button/loading_button.dart';
import 'package:lettutor_edu_clone/widgets/common/text_field/baset_text_field.dart';

class InputFieldArea extends StatelessWidget {
  const InputFieldArea({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          LocalString.emailTitle,
          style: text14.copyWith(color: greyColor),
          textAlign: TextAlign.start,
        ),
        SizedBox(
          height: 8.h,
        ),
        baseTextField(onChanged: (value) {}, controller: null, hintText: ''),
        SizedBox(
          height: 20.h,
        ),
        LoadingButtonWidget(
            submit: () {}, isLoading: false, label: LocalString.confirm)
      ],
    );
  }
}
