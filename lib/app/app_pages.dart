// ignore_for_file: non_constant_identifier_names

import 'package:get/get.dart';
import 'package:lettutor_edu_clone/ui/change_password/change_password_binding.dart';
import 'package:lettutor_edu_clone/ui/change_password/change_password_page.dart';
import 'package:lettutor_edu_clone/ui/dash_board.dart/dash_board_binding.dart';
import 'package:lettutor_edu_clone/ui/dash_board.dart/dash_board_page.dart';
import 'package:lettutor_edu_clone/ui/forgot_password/forgot_password_binding.dart';
import 'package:lettutor_edu_clone/ui/forgot_password/forgot_password_page.dart';
import 'package:lettutor_edu_clone/ui/login/login_binding.dart';
import 'package:lettutor_edu_clone/ui/login/login_page.dart';
import 'package:lettutor_edu_clone/ui/profile/profile_binding.dart';
import 'package:lettutor_edu_clone/ui/profile/profile_page.dart';
import 'package:lettutor_edu_clone/ui/tutor_detail/tutor_detail_binding.dart';
import 'package:lettutor_edu_clone/ui/tutor_detail/tutor_detail_page.dart';

class AppRoutes {
  static String LOGIN = '/login';
  static String FORGOT_PASSWORD = '/forgot_password';
  static String PROFILE = '/profile';
  static String DASHBOARD = '/dashboard';
  static String CHANGE_PASSWORD = '/change_password';
  static String TUTOR_DETAIL = '/tutor_detail';
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
    GetPage(
        name: AppRoutes.PROFILE,
        page: () => ProfilePage(),
        binding: ProfileBinding()),
    GetPage(
        name: AppRoutes.DASHBOARD,
        page: () => DashBoardPage(),
        binding: DashBoardBinding()),
    GetPage(
        name: AppRoutes.CHANGE_PASSWORD,
        page: () => ChangePasswordPage(),
        binding: ChangePasswordBinding()),
    GetPage(
        name: AppRoutes.TUTOR_DETAIL,
        page: () => TutorDetailPage(),
        binding: TutorDetailBinding()),
  ];
}
