import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lettutor_edu_clone/app/app_setup.dart';
import 'package:lettutor_edu_clone/app/app_storage.dart';
import 'package:lettutor_edu_clone/data/api_constants.dart';
import 'package:lettutor_edu_clone/data/rest_client.dart';
import 'package:lettutor_edu_clone/res/languages/localization_service.dart';
import 'package:lettutor_edu_clone/res/theme/app_theme.dart';
import 'package:lettutor_edu_clone/res/theme/theme_service.dart';

class AppController extends GetxController {
  late Rx<Locale?> locale;
  late Rx<ThemeData?> themeData;

  Environment? env;
  Rx<AuthState> authState = AuthState.unauthorized.obs;

  init(Environment environment) async {
    env = environment;
    await Future.wait([initStorage()]);
    final appStorage = Get.find<AppStorage>();

    setupApp();
    await initTheme(appStorage);
    await initLanguage();
    await initAuth();
  }

  Future<void> initStorage() async {
    await Get.put(AppStorage()).init();
  }

  Future<void> initLanguage() async {
    await Get.put(LocalizationService()).init();
    final localeService = Get.find<LocalizationService>();
    locale = localeService.getLocale.obs;

    // Listen to the change of locale
    localeService.appStorage.box.listenKey(AppStorage.APP_LANGUAGE, (value) {
      if (value != null) {
        final newLocale = Locale(value);
        locale.value = newLocale;
      }
    });
  }

  Future<void> initTheme(AppStorage storage) async {
    await Get.put(ThemeService()).init(storage);
    final themeService = Get.find<ThemeService>();
    themeData = themeService.themeData.obs;

    // Listen to the change of Theme
    storage.box.listenKey(AppStorage.APP_THEME, (value) {
      if (value != null) {
        themeData.value = appThemeData[themeService.getAppTheme(value)];
      } else {
        themeData = appThemeData[themeService.getAppTheme(value)].obs;
      }
    });
  }

  Future<void> initAuth() async {
    final storage = Get.find<AppStorage>();

    String? accessToken = await storage.getToken();
    await initApi(accessToken);
    if (accessToken != null && accessToken.isNotEmpty) {
      //await Get.find<UserRepository>().getMe(userId: user?.id ?? "");
      authState.value = AuthState.authorized;
    } else {
      authState.value = AuthState.unauthorized;
    }
  }

  initApi(String? accessToken) async {
    String baseUrl;
    // init api
    switch (env!) {
      case Environment.prod:
        baseUrl = BASE_URL_PRO;
        break;
      case Environment.dev:
        baseUrl = BASE_URL_DEV;
        break;
    }
    RestClient.instance.init(baseUrl, accessToken: accessToken ?? "");
  }
}

enum AuthState { unauthorized, authorized }

enum Environment { dev, prod }
