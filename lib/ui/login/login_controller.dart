import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_login_facebook/flutter_login_facebook.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:lettutor_edu_clone/app/app_pages.dart';
import 'package:lettutor_edu_clone/controllers/base_controller.dart';
import 'package:lettutor_edu_clone/data/rest_client.dart';
import 'package:lettutor_edu_clone/data/services.dart/user_service.dart';
import 'package:lettutor_edu_clone/res/constants/constants.dart';
import 'package:lettutor_edu_clone/ui/login/components/sign_up_area.dart';
import 'package:lettutor_edu_clone/util/validator.dart';
import 'package:lettutor_edu_clone/widgets/notification/notification_bar.dart';

class LoginController extends BaseController {
  final _userService = Get.find<UserService>();

  final RxBool isLogin = true.obs;
  final RxBool isHide = true.obs;
  final RxBool loading = false.obs;

  final Map<String, TextEditingController> controllers = Map.fromEntries(
    [
      emailField,
      passwordField,
    ].map(
      (value) => MapEntry(
        value,
        TextEditingController(),
      ),
    ),
  );

  final Map<String, bool> mapCheckInformation = {
    emailField: false,
    passwordField: false,
  };

  @override
  void onInit() {
    super.onInit();
    isHaveDrawer = false;
  }

  @override
  void onReloadData() {}

  void changeLogin() {
    isLogin.value = !isLogin.value;
  }

  void onClickLogIn() async {
    //
    validatorEmpty(controllers.values.toList());
    if (!checkRegisterAvailable(mapCheckInformation)) {
      return;
    }

    try {
      loading.value = true;
      await _userService.logAccount(
          email: controllers[emailField]!.text,
          password: controllers[passwordField]!.text,
          isLogin: isLogin.value);
    } on DioError catch (e) {
      notificationBar(message: e.response?.data['message'], isSuccess: false);
      loading.value = false;
      return;
    }
    loading.value = false;

    await _userService.getlanguages();
    Get.offNamed(AppRoutes.DASHBOARD);
  }

  String? Function(String?) validator(
      {required String? Function(dynamic value) func, required String key}) {
    return (value) {
      String? result = func(value);
      mapCheckInformation[key] = result != null ? false : true;
      return result;
    };
  }

  void changeHide() {
    isHide.value = !isHide.value;
  }

  hanldeLogin3rd(Login3rd type) async {
    RestClient.instance.clearToken();
    String token = '';
    switch (type) {
      case Login3rd.google:
        token = await handleLoginByGoogle();
        break;
      case Login3rd.facebook:
        token = await handleLoginByFacebook();
        break;
    }
    if (token.isEmpty) {
      notificationBar(message: 'Login Fail', isSuccess: false);
      return;
    }
    try {
      loading.value = true;
      await _userService.login3rd(accessToken: token, type: type.key);
    } on DioError catch (e) {
      String mes = e.response?.data['message'].toString() ?? '';
      notificationBar(message: mes, isSuccess: false);
      loading.value = false;
      return;
    }
    loading.value = false;

    await _userService.getlanguages();
    Get.offNamed(AppRoutes.DASHBOARD);
  }

  Future<String> handleLoginByGoogle() async {
    GoogleSignIn _googleSignIn = GoogleSignIn(
      scopes: [
        'email',
      ],
    );
    GoogleSignInAccount? googleSignInAccount = await _googleSignIn.signIn();
    if (googleSignInAccount == null) {
      return '';
    }

    final res = await googleSignInAccount.authentication;
    return res.accessToken ?? '';
  }

  Future<String> handleLoginByFacebook() async {
    try {
      final fb = FacebookLogin();
      final res = await fb.logIn(permissions: [
        FacebookPermission.publicProfile,
      ]);

      switch (res.status) {
        case FacebookLoginStatus.success:

          // Send access token to server for validation and auth
          final FacebookAccessToken? accessToken = res.accessToken;
          return accessToken?.token ?? '';
        case FacebookLoginStatus.cancel:
          print(1);
          break;
        case FacebookLoginStatus.error:
          print(2);
          break;
        default:
          return '';
      }
    } catch (e) {
      print(e);
    }

    return '';
  }
}
