// ignore_for_file: non_constant_identifier_names

import 'package:get/get.dart';
import 'package:lettutor_edu_clone/ui/login/login_page.dart';

class AppRoutes {
  static String LOGIN = '/login';
}

class AppPages {
  static final pages = <GetPage>[
    GetPage(
      name: AppRoutes.LOGIN,
      page: () => LoginPage(),
    ),
  ];
}
