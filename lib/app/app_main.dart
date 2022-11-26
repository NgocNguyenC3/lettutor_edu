import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get.dart';
import 'package:lettutor_edu_clone/app/app_pages.dart';
import 'package:lettutor_edu_clone/controllers/app_controller.dart';
import 'package:lettutor_edu_clone/res/constants/local_string.dart';
import 'package:lettutor_edu_clone/res/languages/localization_service.dart';

class LettutorCloneApp extends GetWidget<AppController> {
  @override
  Widget build(BuildContext context) {
    return Obx(
      () {
        print(controller.locale.value);
        return GestureDetector(
          onTap: () {
            FocusManager.instance.primaryFocus?.unfocus();
          },
          child: GetMaterialApp(
            title: LocalString.appName,
            debugShowCheckedModeBanner: false,
            useInheritedMediaQuery: true,
            getPages: AppPages.pages,
            translations: LocalizationService(),
            locale: controller.locale.value,
            theme: controller.themeData.value,
            initialRoute: AppRoutes.LOGIN,
            defaultTransition: Transition.rightToLeft,
            transitionDuration: const Duration(milliseconds: 200),
            localizationsDelegates: const [
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            supportedLocales: const [
              Locale('vi'),
              Locale('en'),
            ],
          ),
        );
      },
    );
  }
}
