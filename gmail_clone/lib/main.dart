import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'app/bindings/app_binding.dart';
import 'app/views/home_view.dart';
import 'translations/translations.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Gmail Clone',
      debugShowCheckedModeBanner: false,
      initialBinding: AppBinding(),
      translations: MyTranslations(),
      locale: Get.deviceLocale,
      fallbackLocale: const Locale('en', 'US'),
      theme: ThemeData(
        primarySwatch: Colors.red,
        scaffoldBackgroundColor: Colors.white,
      ),
      home: const HomeView(),
    );
  }
}
