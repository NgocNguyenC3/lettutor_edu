import 'package:flutter/material.dart';
import 'package:lettutor_edu_clone/res/dimens.dart';
import 'package:lettutor_edu_clone/res/gen/colors.gen.dart';
import 'package:lettutor_edu_clone/res/theme/text_theme.dart';
import 'package:lettutor_edu_clone/widgets/common/text_field/baset_text_field.dart';
import 'package:lettutor_edu_clone/widgets/common/text_field/label_english_type.dart';

class DropDownTextFormField extends StatefulWidget {
  List<String> listData;
  String hintText;
  double width;
  DropDownTextFormField({
    Key? key,
    required this.listData,
    required this.hintText,
    required this.width,
  }) : super(key: key);

  @override
  State<DropDownTextFormField> createState() => _DropDownTextFormFieldState();
}

class _DropDownTextFormFieldState extends State<DropDownTextFormField> {
  bool isOnTap = false;
  List<String> data = [];
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 5.h, horizontal: 10.w),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(2.0.r),
          border:
              Border.all(width: 1.0.r, color: Colors.grey.withOpacity(0.5))),
      child: Column(
        children: [
          SizedBox(
            width: widget.width,
            child: Column(children: [
              ...data.map((e) => LabelEnglishType(content: e)),
              baseTextField(
                  onChanged: (value) {},
                  controller: null,
                  isOutline: false,
                  icon: const Icon(Icons.expand_more),
                  hintText: widget.hintText),
            ]),
          ),
          if (isOnTap)
            Container(
              margin: EdgeInsets.only(top: 5.h),
              width: widget.width,
              height: 150.h,
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ...widget.listData.map((e) => Column(
                          children: [
                            Text(
                              e,
                              style: text15,
                            ),
                            SizedBox(
                              height: 5.h,
                            )
                          ],
                        ))
                  ],
                ),
              ),
            )
        ],
      ),
    );
  }
}
