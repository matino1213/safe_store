import 'package:animations/animations.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:safe_store/app/screens/home/controller.dart';
import 'package:safe_store/app/screens/profile/controller.dart';
import 'package:safe_store/app/screens/shopping_card/controller.dart';
import 'package:safe_store/constants.dart';

class HomeScreen extends GetView<HomeController> {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFFffffff),
        title: Center(
          child: Text(
            'SAFE STORE',
            style: fTitleStyle.copyWith(
              fontSize: 30,
            ),
          ),
        ),
      ),
      body: Container(
        color: Colors.transparent,
        child: Obx(
          () => PageTransitionSwitcher(
            transitionBuilder: (child, primaryAnimation, secondaryAnimation) {
              return SharedAxisTransition(
                animation: primaryAnimation,
                secondaryAnimation: secondaryAnimation,
                transitionType: SharedAxisTransitionType.horizontal,
                child: child,
              );
            },
            child: controller.pages[controller.currentIndex.value],
          ),
        ),
      ),
      bottomNavigationBar: CurvedNavigationBar(
        items: const [
          Icon(Icons.account_circle_outlined),
          Icon(Icons.shopping_cart_outlined),
          Icon(CupertinoIcons.home),
        ],
        height: 60,
        backgroundColor: Colors.white,
        color: kYellowColor,
        index: controller.currentIndex.value,
        onTap: (value) {
          if (value == 1) {
            Get.find<ShoppingCardController>().getInformation();
          }
          else if(value == 0){
            Get.find<ProfileController>().getInformation();
          }
          controller.currentIndex.value = value;
        },
      ),
    );
  }
}
