import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:safe_store/app/screens/splash/controller.dart';
import '../../../constants.dart';

class SplashScreen extends GetView<SplashController> {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kYellowColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: Get.height > Get.width? Get.width * 0.6 : Get.height * 0.6,
              width: Get.height > Get.width? Get.width * 0.6 : Get.height * 0.6,
              child: Image.asset("assets/images/safestore.png"),
            ),
          ],
        ),
      ),
    );
  }
}
