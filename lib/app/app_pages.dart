// ignore_for_file: non_constant_identifier_names

import 'package:get/get.dart';
import 'package:lettutor_edu_clone/ui/change_password/change_password_binding.dart';
import 'package:lettutor_edu_clone/ui/change_password/change_password_page.dart';
import 'package:lettutor_edu_clone/ui/course/course_binding.dart';
import 'package:lettutor_edu_clone/ui/course/course_page.dart';
import 'package:lettutor_edu_clone/ui/course_detail/course_detail_binding.dart';
import 'package:lettutor_edu_clone/ui/course_detail/course_detail_page.dart';
import 'package:lettutor_edu_clone/ui/dash_board.dart/dash_board_binding.dart';
import 'package:lettutor_edu_clone/ui/dash_board.dart/dash_board_page.dart';
import 'package:lettutor_edu_clone/ui/forgot_password/forgot_password_binding.dart';
import 'package:lettutor_edu_clone/ui/forgot_password/forgot_password_page.dart';
import 'package:lettutor_edu_clone/ui/history/history_binding.dart';
import 'package:lettutor_edu_clone/ui/history/history_page.dart';
import 'package:lettutor_edu_clone/ui/login/login_binding.dart';
import 'package:lettutor_edu_clone/ui/login/login_page.dart';
import 'package:lettutor_edu_clone/ui/profile/profile_binding.dart';
import 'package:lettutor_edu_clone/ui/profile/profile_page.dart';
import 'package:lettutor_edu_clone/ui/review/review_binding.dart';
import 'package:lettutor_edu_clone/ui/review/review_page.dart';
import 'package:lettutor_edu_clone/ui/schedule/schedule_binding.dart';
import 'package:lettutor_edu_clone/ui/schedule/schedule_page.dart';
import 'package:lettutor_edu_clone/ui/tutor_detail/tutor_detail_binding.dart';
import 'package:lettutor_edu_clone/ui/tutor_detail/tutor_detail_page.dart';

class AppRoutes {
  static String LOGIN = '/login';
  static String FORGOT_PASSWORD = '/forgot_password';
  static String PROFILE = '/profile';
  static String DASHBOARD = '/dashboard';
  static String CHANGE_PASSWORD = '/change_password';
  static String TUTOR_DETAIL = '/tutor_detail';
  static String COURSE = '/course';
  static String REVIEW = '/tutor_detail/review';
  static String COURSE_DETAIL = '/course/detail';
  static String SCHEDULE = '/schedule';
  static String HISTORY = '/history';
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
    GetPage(
        name: AppRoutes.COURSE,
        page: () => CoursePage(),
        binding: CourseBinding()),
    GetPage(
        name: AppRoutes.REVIEW,
        page: () => ReviewPage(),
        binding: ReviewBinding()),
    GetPage(
        name: AppRoutes.COURSE_DETAIL,
        page: () => CourseDetailPage(),
        binding: CourseDetailBinding()),
    GetPage(
        name: AppRoutes.SCHEDULE,
        page: () => SchedulePage(),
        binding: ScheduleBinding()),
    GetPage(
        name: AppRoutes.HISTORY,
        page: () => HistoryPage(),
        binding: HistoryBinding()),
  ];
}
