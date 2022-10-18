// ignore_for_file: non_constant_identifier_names

import 'package:get/get.dart';
import 'package:lettutor_edu_clone/ui/forgot_password/forgot_password_binding.dart';
import 'package:lettutor_edu_clone/ui/forgot_password/forgot_password_page.dart';
import 'package:lettutor_edu_clone/ui/login/login_binding.dart';
import 'package:lettutor_edu_clone/ui/login/login_page.dart';

class AppRoutes {
  static String LOGIN = '/login';
  static String FORGOT_PASSWORD = '/forgot_password';
}

class AppPages {
  static final pages = <GetPage>[
    GetPage(
        name: AppRoutes.LOGIN,
        page: () => LoginPage(),
        binding: LoginBinding()),
    GetPage(
        name: AppRoutes.FORGOT_PASSWORD,
        page: () => ForgotPasswordPage(),
        binding: ForgotPasswordBinding()),
  ];
}
