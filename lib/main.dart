import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:safe_store/app/common/binding.dart';
import 'package:safe_store/app/common/page_routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      getPages: PageRoutes.routes,
      initialBinding: MyBinding(),
      title: 'Safe Store',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: const Color(0xFFffffff),
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        fontFamily: 'Ubuntu',
        useMaterial3: true,
      ),
      initialRoute: PageRoutes.SPLASH,
      defaultTransition: Transition.native,
    );
  }
}
