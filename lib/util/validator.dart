import 'package:flutter/cupertino.dart';
import 'package:lettutor_edu_clone/res/constants/local_string.dart';
import 'package:lettutor_edu_clone/res/dimens.dart';

final RegExp regex = RegExp(r'^(?=.*?[A-z])(?=.*?[0-9])(?=.*?[!@#\$&*~_])');
final RegExp regexEmail = RegExp(
    r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
final RegExp regexUserName =
    RegExp(r"^(?![_.])(?!.*[_.]{2})[a-zA-Z0-9._]+(?<![_.])$");
final RegExp regexCharAndNum = RegExp(
    r'^[a-zA-Z ÀÁÂÃÈÉÊÌÍÒÓÔÕÙÚĂĐĨŨƠàáâãèéêìíòóôõùúăđĩũơƯĂẠẢẤẦẨẪẬẮẰẲẴẶẸẺẼỀỀỂưăạảấầẩẫậắằẳẵặẹẻẽềềểỄỆỈỊỌỎỐỒỔỖỘỚỜỞỠỢỤỦỨỪễếệỉịọỏốồổỗộớờởỡợụủứừỬỮỰỲỴÝỶỸửữựỳỵỷỹ0-9]+$');
final RegExp regexAddress = RegExp(
    r'^[a-zA-Z ÀÁÂÃÈÉÊÌÍÒÓÔÕÙÚĂĐĨŨƠàáâãèéêìíòóôõùúăđĩũơƯĂẠẢẤẦẨẪẬẮẰẲẴẶẸẺẼỀỀỂưăạảấầẩẫậắằẳẵặẹẻẽềềểỄỆỈỊỌỎỐỒỔỖỘỚỜỞỠỢỤỦỨỪễếệỉịọỏốồổỗộớờởỡợụủứừỬỮỰỲỴÝỶỸửữựỳỵỷỹ/0-9]+$');
final RegExp regexChar = RegExp(
    r'^[a-zA-Z ÀÁÂÃÈÉÊÌÍÒÓÔÕÙÚĂĐĨŨƠàáâãèéêìíòóôõùúăđĩũơƯĂẠẢẤẦẨẪẬẮẰẲẴẶẸẺẼỀỀỂưăạảấầẩẫậắằẳẵặẹẻẽềềểỄỆỈỊỌỎỐỒỔỖỘỚỜỞỠỢỤỦỨỪễếệỉịọỏốồổỗộớờởỡợụủứừỬỮỰỲỴÝỶỸửữựỳỵỷỹ]+$');
final RegExp regexPhone = RegExp(r'^[0-9]+$');

const int minLengthPassword = 6;
const int maxLengthPassword = 30;
const int minLengthUserName = 5;
const int maxLengthUserName = 25;

final minDate = DateTime(1990);

String? validatorUsername(dynamic value) {
  return validatorWithLengthAndRegex(minLengthUserName, maxLengthUserName,
      regexUserName, LocalString.usernameRegisterRequired, value);
}

String? validatorPassword(dynamic value) {
  return validatorWithLengthAndRegex(minLengthPassword, maxLengthPassword, null,
      LocalString.passwordRegisterRequired, value);
}

String? validatorLastName(dynamic value) {
  return validatorWithRegex(
      regexChar, LocalString.lastNameRegisterRequired, value);
}

String? validatorNameAndNum(dynamic value) {
  return validatorWithRegex(
      regexCharAndNum, LocalString.charAndNumRequirement, value);
}

String? validatorAddress(dynamic value) {
  return validatorWithRegex(
      regexAddress, LocalString.addressRequirement, value);
}

String? validatorFirstName(dynamic value) {
  return validatorWithRegex(
      regexChar, LocalString.firstNameRegisterRequired, value);
}

String? validatorEmail(dynamic value) {
  return validatorWithRegex(
      regexEmail, LocalString.emailRegisterRequired, value);
}

String? validatorPhone(dynamic value) {
  return validatorWithLengthAndRegex(
      10, 10, regexPhone, LocalString.warningPhoneNumber, value);
}

String? validatorWithLengthAndRegex(int minLength, int maxLength,
    RegExp? regExp, String errorText, dynamic value) {
  if (value == null || value.isEmpty) {
    return errorText;
  }
  if (regExp == null) {
    if (value.length < minLength || value.length > maxLength) {
      return errorText;
    }
    return null;
  }

  if (value.length < minLength ||
      value.length > maxLength ||
      !regExp.hasMatch(value)) {
    return errorText;
  }
  return null;
}

String? validatorWithRegex(RegExp regExp, String errorText, dynamic value) {
  if (value == null || value.isEmpty) {
    return errorText;
  }
  if (!regExp.hasMatch(value)) {
    return errorText;
  }
  return null;
}

String? validatorRePassword(dynamic value, String? password) {
  if (value != password) {
    return LocalString.repasswordRegisterRequired;
  }
  return null;
}

dateTimePicked(BuildContext context, Widget child, {then}) async {
  showCupertinoModalPopup<DateTime>(
      context: context,
      builder: (BuildContext context) => Container(
            height: 216.h,
            padding: EdgeInsets.only(top: 6.0.h),
            margin: EdgeInsets.only(
              bottom: MediaQuery.of(context).viewInsets.bottom,
            ),
            color: CupertinoColors.systemBackground.resolveFrom(context),
            child: SafeArea(
              top: false,
              child: child,
            ),
          )).then(then);
}

Widget cupertinoDateTimePicker(onchanged) {
  return CupertinoDatePicker(
    initialDateTime: minDate,
    mode: CupertinoDatePickerMode.date,
    use24hFormat: true,
    // This is called when the user changes the time.
    onDateTimeChanged: (DateTime newTime) {
      onchanged(newTime);
    },
  );
}

bool checkRegisterAvailable(mapCheckInformation) => mapCheckInformation.values
    .fold(true, (previousValue, element) => previousValue && element);

void validatorEmpty(List<TextEditingController> controllers) {
  for (var item in controllers) {
    if (item.text.isNotEmpty) {
      continue;
    }
    item.text = ' ';
    item.text = '';
  }
}
