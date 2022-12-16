import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lettutor_edu_clone/app/app_setup.dart';
import 'package:lettutor_edu_clone/app/app_storage.dart';
import 'package:lettutor_edu_clone/data/api_constants.dart';
import 'package:lettutor_edu_clone/data/models/category.dart';
import 'package:lettutor_edu_clone/data/models/user.dart';
import 'package:lettutor_edu_clone/data/rest_client.dart';
import 'package:lettutor_edu_clone/res/languages/localization_service.dart';
import 'package:lettutor_edu_clone/res/theme/app_theme.dart';
import 'package:lettutor_edu_clone/res/theme/theme_service.dart';

class AppController extends GetxController {
  Environment? env;

  late Rx<Locale?> locale;
  late Rx<ThemeData?> themeData;
  final Rx<UserModel?> userModel = UserModel(birthday: DateTime(1990)).obs;
  final Rx<AuthState> authState = AuthState.unauthorized.obs;

  Map<String, String> languagesContry = {};

  init(Environment environment) async {
    env = environment;
    await Future.wait([initStorage()]);
    final appStorage = Get.find<AppStorage>();

    setupApp();
    await initTheme(appStorage);
    await initLanguage();
    await initApi(null);
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

  logout() async {
    userModel.value = UserModel(birthday: DateTime(1990));
    authState.value = AuthState.unauthorized;
    RestClient.instance.clearToken();
    await Get.find<AppStorage>().logout();
  }

  void saveLanguages(res) {
    final List<Category> categories = res[0]['categories'] == null
        ? []
        : (res[0]['categories'] as List)
            .map((e) => Category.fromJson(e))
            .toList();
    languagesContry = Map.fromEntries(
        categories.map((value) => MapEntry(value.key, value.description)));
  }
}

enum AuthState { unauthorized, authorized }

enum Environment { dev, prod }
