// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lettutor_edu_clone/controllers/app_controller.dart';

import 'package:lettutor_edu_clone/res/constants/constants.dart';
import 'package:lettutor_edu_clone/res/constants/local_string.dart';
import 'package:lettutor_edu_clone/res/dimens.dart';
import 'package:lettutor_edu_clone/res/theme/text_theme.dart';
import 'package:lettutor_edu_clone/ui/profile/components/want_to_learn_wrap.dart';
import 'package:lettutor_edu_clone/ui/profile/profile_controller.dart';
import 'package:lettutor_edu_clone/widgets/common/button/loading_button.dart';
import 'package:lettutor_edu_clone/widgets/common/text_field/baset_text_field.dart';
import 'package:lettutor_edu_clone/widgets/input_field_profile.dart';

class ProfileField extends StatefulWidget {
  const ProfileField({
    Key? key,
    required this.controller,
  }) : super(key: key);

  final ProfileController controller;

  @override
  State<ProfileField> createState() => _ProfileFieldState();
}

class _ProfileFieldState extends State<ProfileField> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 25.w, vertical: 25.h),
      child: Column(children: [
        //
        InputFieldProfile(
          title: LocalString.profileName,
          isImportant: true,
          child: baseTextField(
              onChanged: (value) {},
              controller: widget.controller.controllers[nameField],
              hintText: ''),
        ),
        SizedBox(height: 15.h),
        //
        InputFieldProfile(
          title: LocalString.profileEmailAddress,
          child: baseTextField(
              readOnly: true,
              onChanged: (value) {},
              controller: widget.controller.controllers[emailField],
              hintText: ''),
        ),
        SizedBox(height: 15.h),
        //
        InputFieldProfile(
          title: LocalString.profileCountry,
          isImportant: true,
          child: DropdownButton(
              value: widget.controller.controllers[countryField]!.text
                  .toUpperCase(),
              isExpanded: true, //Adding this property, does the magic
              items: [
                ...languages.entries.map((e) => DropdownMenuItem(
                      value: e.key,
                      child: Text(e.value,
                          overflow: TextOverflow.ellipsis, style: text14),
                    ))
              ],
              onChanged: (val) {
                setState(() {
                  widget.controller.controllers[countryField]!.text = val!;
                });
              }),
        ),
        SizedBox(height: 15.h),
        //
        InputFieldProfile(
          title: LocalString.profilePhone,
          isImportant: true,
          child: baseTextField(
              readOnly: widget.controller.user.value.isPhoneActivated,
              onChanged: (value) {},
              controller: widget.controller.controllers[phoneField],
              hintText: ''),
        ),
        SizedBox(height: 15.h),
        //
        InputFieldProfile(
          title: LocalString.profileBirthday,
          isImportant: true,
          child: baseTextField(
              readOnly: true,
              onTap: () {
                widget.controller.selectDate();
              },
              onChanged: (value) {},
              controller: widget.controller.controllers[birthayDayField],
              icon: IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.calendar_today,
                    size: 15,
                  )),
              hintText: ''),
        ),
        SizedBox(height: 15.h),
        //
        InputFieldProfile(
            title: LocalString.profileMyLevel,
            isImportant: true,
            child: DropdownButton(
                value: widget.controller.controllers[levelField]!.text,
                isExpanded: true, //Adding this property, does the magic
                items: [
                  ...levelUser.entries.map((e) => DropdownMenuItem(
                        value: e.key,
                        child: Text(e.value,
                            overflow: TextOverflow.ellipsis, style: text14),
                      ))
                ],
                onChanged: (val) {
                  setState(() {
                    widget.controller.controllers[levelField]!.text = val!;
                  });
                })),
        SizedBox(height: 15.h),
        //
        InputFieldProfile(
          title: LocalString.profileWantToLearn,
          isImportant: true,
          child: WantToLearnWrap(),
        ),
        SizedBox(height: 15.h),
        //
        InputFieldProfile(
          title: LocalString.profileStudySchedule,
          child: baseTextField(
              maxLine: 4,
              onChanged: (value) {},
              controller: widget.controller.controllers[studyScheduleField],
              hintText:
                  'Note the time of the week you want to study on LetTutor'),
        ),
        SizedBox(height: 15.h),
        //
        Align(
          alignment: Alignment.centerRight,
          child: SizedBox(
            height: 40.h,
            width: 130.w,
            child: LoadingButtonWidget(
                submit: () {widget.controller.saveInfo();}, isLoading: false, label: LocalString.save),
          ),
        )
      ]),
    );
  }
}
