import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lettutor_edu_clone/app/app_setup.dart';
import 'package:lettutor_edu_clone/app/app_storage.dart';
import 'package:lettutor_edu_clone/res/languages/localization_service.dart';
import 'package:lettutor_edu_clone/res/theme/app_theme.dart';
import 'package:lettutor_edu_clone/res/theme/theme_service.dart';

class AppController extends GetxController {
  Rx<Locale?>? locale;
  Rx<ThemeData?>? themeData;

  init() async {
    await Future.wait([initStorage()]);
    final appStorage = Get.find<AppStorage>();

    setupApp();
    await initTheme(appStorage);
    await initLanguage();
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
      if (value != null) locale!.value = Locale(value);
    });
  }

  Future<void> initTheme(AppStorage storage) async {
    await Get.put(ThemeService()).init(storage);
    final themeService = Get.find<ThemeService>();
    themeData = themeService.themeData.obs;

    // Listen to the change of Theme
    storage.box.listenKey(AppStorage.APP_THEME, (value) {
      if (value != null && themeData != null) {
        themeData!.value = appThemeData[themeService.getAppTheme(value)];
      } else {
        themeData = appThemeData[themeService.getAppTheme(value)].obs;
      }
    });
  }
}