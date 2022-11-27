// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:lettutor_edu_clone/controllers/app_controller.dart';
import 'package:lettutor_edu_clone/res/colors/colors_core.dart';
import 'package:lettutor_edu_clone/res/dimens.dart';
import 'package:lettutor_edu_clone/res/theme/text_theme.dart';
import 'package:lettutor_edu_clone/widgets/common/text_field/label_english_type.dart';

class WrapField extends StatelessWidget {
  final double width;
  double? radius;
  List<Widget> widgets;
  String hintText;
  Function()? onTap;
  WrapField({
    Key? key,
    required this.width,
    this.radius,
    required this.widgets,
    required this.hintText,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(15.w),
        width: double.infinity,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(radius ?? 5.0.r),
            border: Border.all(
              color: greyBorderColor,
            )),
        child: widgets.isEmpty
            ? Text(
                hintText,
                style: text12.copyWith(color: Colors.grey),
              )
            : Wrap(spacing: 5.0.w, runSpacing: 5.0.w, children: [...widgets]),
      ),
    );
  }
}

class WrapBottom extends StatefulWidget {
  final Map<String, bool> data;
  final Map<String, String> content;
  final dynamic onTapItem;
  const WrapBottom({
    Key? key,
    required this.data,
    required this.onTapItem,
    required this.content,
  }) : super(key: key);
  @override
  State<WrapBottom> createState() => _WrapBottomState();
}

class _WrapBottomState extends State<WrapBottom> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.all(10),
      height: 100,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ...widget.data.keys.map((key) => Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  InkWell(
                    onTap: () {
                      widget.onTapItem(key);
                    },
                    child: Text(
                      widget.content[key]!,
                      style: text18.copyWith(
                          color: widget.data[key]! ? Colors.red : Colors.black),
                    ),
                  ),
                  const Divider()
                ],
              ))
        ],
      ),
    );
  }
}
